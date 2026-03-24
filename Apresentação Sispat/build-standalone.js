const fs = require('fs');
const path = require('path');

const dir = __dirname;
const imgDir = path.join(dir, 'Imagens');
const total = 15;

// Convert images to Base64 data URIs
function imgToDataUri(filePath) {
  const ext = path.extname(filePath).slice(1).toLowerCase();
  const mime = ext === 'jpg' ? 'image/jpeg' : `image/${ext}`;
  const data = fs.readFileSync(filePath).toString('base64');
  return `data:${mime};base64,${data}`;
}

const logoAntaq = imgToDataUri(path.join(imgDir, 'Logo ANTAQ.jpg'));
const logoSispat = imgToDataUri(path.join(imgDir, 'LogoSisPAT.jpg'));

function normalizeFooterCounter(html, slideNumber, slideTotal) {
  return html.replace(
    /(<p class="text-gray-300 text-xs font-mono">)\s*\d+\s*\/\s*\d+\s*(<\/p>)/,
    `$1${slideNumber} / ${slideTotal}$2`
  );
}

function escapeClosingScriptTags(html) {
  return html.replace(/<\/script>/gi, '<\\/script>');
}

// Read all slides
const slides = [];
for (let i = 1; i <= total; i++) {
  const file = path.join(dir, `slide-${String(i).padStart(2, '0')}.html`);
  let html = fs.readFileSync(file, 'utf8');

  // Replace local image references with Base64
  html = html.replace(/src="Imagens\/Logo ANTAQ\.jpg"/g, `src="${logoAntaq}"`);
  html = html.replace(/src="Imagens\/LogoSisPAT\.jpg"/g, `src="${logoSispat}"`);

  // Replace video in slide 10 with placeholder
  if (i === 10) {
    html = html.replace(
      /<div class="video-frame">[\s\S]*?<\/div>\s*<div class="screen-glare"><\/div>/,
      `<div style="width:100%;height:100%;display:flex;flex-direction:column;align-items:center;justify-content:center;background:#1E293B;border-radius:8px;">
        <i class="fas fa-play-circle" style="font-size:80px;color:#0066CC;opacity:0.7;margin-bottom:20px;"></i>
        <p style="color:#94A3B8;font-family:Montserrat,sans-serif;font-weight:700;font-size:20px;margin-bottom:8px;">Video Demonstrativo do SisPAT</p>
        <p style="color:#64748B;font-size:14px;">Disponivel na versao completa da apresentacao</p>
      </div>`
    );
  }

  html = normalizeFooterCounter(html, i, total);
  html = escapeClosingScriptTags(html);

  slides.push(html);
}

// Escape for JS template literal (backticks and ${})
function escapeForTemplate(str) {
  return str.replace(/\\/g, '\\\\').replace(/`/g, '\\`').replace(/\$\{/g, '\\${');
}

// Build the standalone HTML
const output = `<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Apresentacao SisPAT</title>
  <style>
    :root {
      --bg: #0f172a;
      --panel: #111827;
      --text: #e5e7eb;
      --muted: #9ca3af;
      --accent: #0066cc;
    }
    * { box-sizing: border-box; }
    html, body {
      margin: 0;
      width: 100%;
      height: 100%;
      background: radial-gradient(circle at top, #1f2937 0%, var(--bg) 55%);
      color: var(--text);
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      overflow: hidden;
    }
    .app {
      width: 100vw;
      height: 100vh;
      display: grid;
      grid-template-rows: 1fr auto;
      place-items: center;
      padding: 18px;
      gap: 12px;
    }
    .stage {
      width: min(96vw, calc(96vh * 16 / 9));
      aspect-ratio: 16 / 9;
      background: #000;
      border-radius: 10px;
      border: 1px solid #334155;
      box-shadow: 0 16px 44px rgba(0, 0, 0, 0.45);
      overflow: hidden;
      position: relative;
    }
    iframe {
      width: 1920px;
      height: 1080px;
      border: 0;
      background: #fff;
      display: block;
      position: absolute;
      top: 0;
      left: 0;
      transform-origin: top left;
    }
    .controls {
      width: min(96vw, calc(96vh * 16 / 9));
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: rgba(17, 24, 39, 0.9);
      border: 1px solid #334155;
      border-radius: 10px;
      padding: 10px 14px;
    }
    .left, .right { display: flex; align-items: center; gap: 8px; }
    button {
      background: #1f2937;
      color: var(--text);
      border: 1px solid #334155;
      border-radius: 8px;
      padding: 8px 12px;
      cursor: pointer;
      font-size: 14px;
    }
    button:hover { border-color: var(--accent); }
    button:disabled { opacity: 0.45; cursor: not-allowed; }
    .badge {
      font-size: 14px;
      color: var(--muted);
      min-width: 102px;
      text-align: center;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .slide-select {
      background: #1f2937;
      color: var(--text);
      border: 1px solid #334155;
      border-radius: 6px;
      padding: 4px 8px;
      font-size: 14px;
      cursor: pointer;
      text-align: center;
    }
    .slide-select:hover { border-color: var(--accent); }
    .slide-select:focus { outline: none; border-color: var(--accent); }
    .hint { font-size: 12px; color: var(--muted); }
  </style>
</head>
<body>
  <div class="app">
    <div class="stage">
      <iframe id="slideFrame" title="Slide" sandbox="allow-scripts allow-same-origin"></iframe>
    </div>
    <div class="controls">
      <div class="left">
        <button id="prevBtn" type="button">Anterior</button>
        <button id="nextBtn" type="button">Proximo</button>
      </div>
      <div class="badge">
        <select id="slideSelect" class="slide-select"></select>
        <span>/ ${total}</span>
      </div>
      <div class="right">
        <button id="fsBtn" type="button">Tela cheia</button>
        <div class="hint">Teclas: &larr; &rarr; Space F</div>
      </div>
    </div>
  </div>

  <script>
    const total = ${total};
    const slides = [
${slides.map((s, i) => `      \`${escapeForTemplate(s)}\``).join(',\n')}
    ];

    const frame = document.getElementById('slideFrame');
    const slideSelect = document.getElementById('slideSelect');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');
    const fsBtn = document.getElementById('fsBtn');

    for (let i = 1; i <= total; i++) {
      const opt = document.createElement('option');
      opt.value = i;
      opt.textContent = i;
      slideSelect.appendChild(opt);
    }

    let current = 1;

    function render() {
      frame.srcdoc = slides[current - 1];
      slideSelect.value = current;
      prevBtn.disabled = current === 1;
      nextBtn.disabled = current === total;
    }

    slideSelect.addEventListener('change', () => {
      current = parseInt(slideSelect.value);
      render();
    });

    function next() { if (current < total) { current++; render(); } }
    function prev() { if (current > 1) { current--; render(); } }

    prevBtn.addEventListener('click', prev);
    nextBtn.addEventListener('click', next);

    fsBtn.addEventListener('click', async () => {
      if (!document.fullscreenElement) {
        try { await document.documentElement.requestFullscreen(); } catch (_) {}
      } else {
        try { await document.exitFullscreen(); } catch (_) {}
      }
    });

    document.addEventListener('keydown', (ev) => {
      if (ev.key === 'ArrowRight' || ev.key === ' ' || ev.key === 'PageDown') { ev.preventDefault(); next(); }
      if (ev.key === 'ArrowLeft' || ev.key === 'PageUp') { ev.preventDefault(); prev(); }
      if (ev.key.toLowerCase() === 'f') { fsBtn.click(); }
      if (ev.key === 'Home') { current = 1; render(); }
      if (ev.key === 'End') { current = total; render(); }
    });

    render();

    const stage = document.querySelector('.stage');
    function scaleFrame() {
      const scale = Math.min(stage.clientWidth / 1920, stage.clientHeight / 1080);
      frame.style.transform = 'scale(' + scale + ')';
    }
    scaleFrame();
    window.addEventListener('resize', scaleFrame);
    new ResizeObserver(scaleFrame).observe(stage);
  </script>
</body>
</html>`;

fs.writeFileSync(path.join(dir, 'SisPAT-Apresentacao-Standalone.html'), output, 'utf8');
console.log('Build complete! File: SisPAT-Apresentacao-Standalone.html');
console.log('Size: ' + (Buffer.byteLength(output) / 1024).toFixed(1) + ' KB');
