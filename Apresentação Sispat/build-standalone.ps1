$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$imgDir = Join-Path $dir "Imagens"
$total = 15

function ConvertTo-DataUri($filePath) {
    $bytes = [System.IO.File]::ReadAllBytes($filePath)
    $b64 = [Convert]::ToBase64String($bytes)
    $ext = [System.IO.Path]::GetExtension($filePath).TrimStart('.').ToLower()
    $mime = if ($ext -eq 'jpg') { 'image/jpeg' } else { "image/$ext" }
    return "data:${mime};base64,$b64"
}

$logoAntaq = ConvertTo-DataUri (Join-Path $imgDir "Logo ANTAQ.jpg")
$logoSispat = ConvertTo-DataUri (Join-Path $imgDir "LogoSisPAT.jpg")

# Process slides and encode as Base64
$b64Slides = @()
for ($i = 1; $i -le $total; $i++) {
    $file = Join-Path $dir ("slide-{0:D2}.html" -f $i)
    $html = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

    $html = $html.Replace('src="Imagens/Logo ANTAQ.jpg"', "src=`"$logoAntaq`"")
    $html = $html.Replace('src="Imagens/LogoSisPAT.jpg"', "src=`"$logoSispat`"")

    # Replace video in slide 10 with placeholder
    if ($i -eq 10) {
        $videoPattern = '<div class="video-frame">'
        $idx = $html.IndexOf($videoPattern)
        if ($idx -ge 0) {
            $endPattern = '<div class="screen-glare"></div>'
            $endIdx = $html.IndexOf($endPattern)
            if ($endIdx -ge 0) {
                $endIdx += $endPattern.Length
                $placeholder = '<div style="width:100%;height:100%;display:flex;flex-direction:column;align-items:center;justify-content:center;background:#1E293B;border-radius:8px;"><i class="fas fa-play-circle" style="font-size:80px;color:#0066CC;opacity:0.7;margin-bottom:20px;"></i><p style="color:#94A3B8;font-family:Montserrat,sans-serif;font-weight:700;font-size:20px;margin-bottom:8px;">Video Demonstrativo do SisPAT</p><p style="color:#64748B;font-size:14px;">Disponivel na versao completa da apresentacao</p></div>'
                $html = $html.Substring(0, $idx) + $placeholder + $html.Substring($endIdx)
            }
        }
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, '<script>[\s\S]*?playbackRate[\s\S]*?</script>', '')
    }

    # Base64 encode the entire slide HTML - no escaping issues possible
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($html)
    $b64 = [Convert]::ToBase64String($bytes)
    $b64Slides += "`"$b64`""
}

$slidesArrayStr = $b64Slides -join ",`n"

# Write output file piece by piece to avoid here-string escaping issues
$outPath = Join-Path $dir "SisPAT-Apresentacao-Standalone.html"
$sw = [System.IO.StreamWriter]::new($outPath, $false, (New-Object System.Text.UTF8Encoding $false))

$sw.WriteLine('<!DOCTYPE html>')
$sw.WriteLine('<html lang="pt-BR">')
$sw.WriteLine('<head>')
$sw.WriteLine('  <meta charset="UTF-8" />')
$sw.WriteLine('  <meta name="viewport" content="width=device-width, initial-scale=1.0" />')
$sw.WriteLine('  <title>Apresentacao SisPAT</title>')
$sw.WriteLine('  <style>')
$sw.WriteLine('    :root { --bg:#0f172a; --panel:#111827; --text:#e5e7eb; --muted:#9ca3af; --accent:#0066cc; }')
$sw.WriteLine('    * { box-sizing:border-box; }')
$sw.WriteLine('    html,body { margin:0; width:100%; height:100%; background:radial-gradient(circle at top,#1f2937 0%,var(--bg) 55%); color:var(--text); font-family:"Segoe UI",Tahoma,Geneva,Verdana,sans-serif; overflow:hidden; }')
$sw.WriteLine('    .app { width:100vw; height:100vh; display:grid; grid-template-rows:1fr auto; place-items:center; padding:18px; gap:12px; }')
$sw.WriteLine('    .stage { width:min(96vw,calc(96vh * 16/9)); aspect-ratio:16/9; background:#000; border-radius:10px; border:1px solid #334155; box-shadow:0 16px 44px rgba(0,0,0,.45); overflow:hidden; position:relative; }')
$sw.WriteLine('    iframe { width:1920px; height:1080px; border:0; background:#fff; display:block; position:absolute; top:0; left:0; transform-origin:top left; }')
$sw.WriteLine('    .controls { width:min(96vw,calc(96vh * 16/9)); display:flex; align-items:center; justify-content:space-between; background:rgba(17,24,39,.9); border:1px solid #334155; border-radius:10px; padding:10px 14px; }')
$sw.WriteLine('    .left,.right { display:flex; align-items:center; gap:8px; }')
$sw.WriteLine('    button { background:#1f2937; color:var(--text); border:1px solid #334155; border-radius:8px; padding:8px 12px; cursor:pointer; font-size:14px; }')
$sw.WriteLine('    button:hover { border-color:var(--accent); }')
$sw.WriteLine('    button:disabled { opacity:.45; cursor:not-allowed; }')
$sw.WriteLine('    .badge { font-size:14px; color:var(--muted); min-width:102px; text-align:center; display:flex; align-items:center; gap:6px; }')
$sw.WriteLine('    .slide-select { background:#1f2937; color:var(--text); border:1px solid #334155; border-radius:6px; padding:4px 8px; font-size:14px; cursor:pointer; text-align:center; }')
$sw.WriteLine('    .slide-select:hover { border-color:var(--accent); }')
$sw.WriteLine('    .slide-select:focus { outline:none; border-color:var(--accent); }')
$sw.WriteLine('    .hint { font-size:12px; color:var(--muted); }')
$sw.WriteLine('  </style>')
$sw.WriteLine('</head>')
$sw.WriteLine('<body>')
$sw.WriteLine('  <div class="app">')
$sw.WriteLine('    <div class="stage"><iframe id="slideFrame" title="Slide"></iframe></div>')
$sw.WriteLine('    <div class="controls">')
$sw.WriteLine('      <div class="left">')
$sw.WriteLine('        <button id="prevBtn" type="button">Anterior</button>')
$sw.WriteLine('        <button id="nextBtn" type="button">Proximo</button>')
$sw.WriteLine('      </div>')
$sw.WriteLine('      <div class="badge">')
$sw.WriteLine('        <select id="slideSelect" class="slide-select"></select>')
$sw.WriteLine('        <span>/ 15</span>')
$sw.WriteLine('      </div>')
$sw.WriteLine('      <div class="right">')
$sw.WriteLine('        <button id="fsBtn" type="button">Tela cheia</button>')
$sw.WriteLine('        <div class="hint">Teclas: &#8592; &#8594; Space F</div>')
$sw.WriteLine('      </div>')
$sw.WriteLine('    </div>')
$sw.WriteLine('  </div>')
$sw.WriteLine('  <script>')
$sw.WriteLine("    var total = $total;")
$sw.WriteLine('    var slidesB64 = [')
$sw.WriteLine($slidesArrayStr)
$sw.WriteLine('    ];')
$sw.WriteLine('    var frame = document.getElementById("slideFrame");')
$sw.WriteLine('    var slideSelect = document.getElementById("slideSelect");')
$sw.WriteLine('    var prevBtn = document.getElementById("prevBtn");')
$sw.WriteLine('    var nextBtn = document.getElementById("nextBtn");')
$sw.WriteLine('    var fsBtn = document.getElementById("fsBtn");')
$sw.WriteLine('    for (var i = 1; i <= total; i++) { var o = document.createElement("option"); o.value = i; o.textContent = i; slideSelect.appendChild(o); }')
$sw.WriteLine('    var current = 1;')
$sw.WriteLine('    function render() {')
$sw.WriteLine('      frame.src = "data:text/html;base64," + slidesB64[current - 1];')
$sw.WriteLine('      slideSelect.value = current;')
$sw.WriteLine('      prevBtn.disabled = current === 1;')
$sw.WriteLine('      nextBtn.disabled = current === total;')
$sw.WriteLine('    }')
$sw.WriteLine('    slideSelect.addEventListener("change", function() { current = parseInt(slideSelect.value); render(); });')
$sw.WriteLine('    function next() { if (current < total) { current++; render(); } }')
$sw.WriteLine('    function prev() { if (current > 1) { current--; render(); } }')
$sw.WriteLine('    prevBtn.addEventListener("click", prev);')
$sw.WriteLine('    nextBtn.addEventListener("click", next);')
$sw.WriteLine('    fsBtn.addEventListener("click", function() {')
$sw.WriteLine('      if (!document.fullscreenElement) { document.documentElement.requestFullscreen().catch(function(){}); }')
$sw.WriteLine('      else { document.exitFullscreen().catch(function(){}); }')
$sw.WriteLine('    });')
$sw.WriteLine('    document.addEventListener("keydown", function(ev) {')
$sw.WriteLine('      if (ev.key === "ArrowRight" || ev.key === " " || ev.key === "PageDown") { ev.preventDefault(); next(); }')
$sw.WriteLine('      if (ev.key === "ArrowLeft" || ev.key === "PageUp") { ev.preventDefault(); prev(); }')
$sw.WriteLine('      if (ev.key.toLowerCase() === "f") { fsBtn.click(); }')
$sw.WriteLine('      if (ev.key === "Home") { current = 1; render(); }')
$sw.WriteLine('      if (ev.key === "End") { current = total; render(); }')
$sw.WriteLine('    });')
$sw.WriteLine('    render();')
$sw.WriteLine('    var stage = document.querySelector(".stage");')
$sw.WriteLine('    function scaleFrame() {')
$sw.WriteLine('      var s = Math.min(stage.clientWidth / 1920, stage.clientHeight / 1080);')
$sw.WriteLine('      frame.style.transform = "scale(" + s + ")";')
$sw.WriteLine('    }')
$sw.WriteLine('    scaleFrame();')
$sw.WriteLine('    window.addEventListener("resize", scaleFrame);')
$sw.WriteLine('    new ResizeObserver(scaleFrame).observe(stage);')
$sw.WriteLine('  </script>')
$sw.WriteLine('</body>')
$sw.WriteLine('</html>')

$sw.Close()

$size = [math]::Round((Get-Item $outPath).Length / 1024, 1)
Write-Host "Build complete! File: SisPAT-Apresentacao-Standalone.html"
Write-Host "Size: ${size} KB"
