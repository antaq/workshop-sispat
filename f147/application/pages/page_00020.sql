prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_page.create_page(
 p_id=>20
,p_name=>'Cadastrar Bens'
,p_alias=>'CADASTRAR-BENS'
,p_page_mode=>'MODAL'
,p_step_title=>'Cadastrar Bens'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'  apex.locale.init({',
'    separators: {',
'      group: ''.'',',
'      decimal: '',''',
'    }',
'  });',
'})();',
'',
'function setModifiedFields() {',
'  const currentValue = getValuesLog();',
'  const log = getModifiedFields(window.initialValues, currentValue);',
'',
'  apex.item(''P20_LOG_ALTERACOES'')',
'      .setValue(JSON.stringify(log));',
'}',
'',
'function removeMarcadores(elementMapId) {',
'  const mapInstance = apex.jQuery(''#'' + elementMapId)',
'                          .reportmap(''instance'');',
'',
'  if (!mapInstance || !Array.isArray(mapInstance.markers)) {',
'    return;',
'  }',
'',
'  mapInstance.markers.forEach(marker => {',
'    marker.setMap(null);',
'  });',
'}',
'',
'/* ===============================',
unistr('   INICIALIZA\00C7\00C3O SEGURA'),
'   =============================== */',
'apex.jQuery(document).on(''apexreadyend apexafterrefresh'', function () {',
'',
'  if (typeof window.initialValues === ''undefined'') {',
'    window.initialValues = getValuesLog();',
'  }',
'',
'});',
'',
'',
'',
'/*',
'var clickMarker = null;',
'',
unistr('// VERS\00C3O ANTIGA E EST\00C1VEL'),
'function desenharMarcador(lat, lng, mapObj) {',
'    const latitude = parseFloat(lat);',
'    const longitude = parseFloat(lng);',
'',
'    if (isNaN(latitude) || isNaN(longitude)) {',
'        return; ',
'    }',
'',
'    // Remove o marcador antigo',
'    if (clickMarker) {',
'        clickMarker.setMap(null);',
'    }',
'',
'    // Desenha o novo marcador com a API antiga (google.maps.Marker)',
'    clickMarker = new google.maps.Marker({',
'        position: { lat: latitude, lng: longitude },',
'        map: mapObj,',
unistr('        title: ''Localiza\00E7\00E3o Selecionada'''),
'    });',
'    ',
'    // Centraliza o mapa',
'    mapObj.setCenter({ lat: latitude, lng: longitude });',
'    mapObj.setZoom(15);',
'}',
'',
'function filterMap() {',
'    var map = $("#map_SituacaoMap").reportmap("instance");',
'    var markers = map.markers;',
'    var bounds = new google.maps.LatLngBounds();',
'',
'    if (globalCircles.length) globalCircles.forEach((v) => v.setMap(null) );',
'    ',
'    $.each(markers,function(i,v){',
'        var btn = $(''a.buttonMapClick[data-id="''+v.data.id+''"]'');',
'        var visible = btn.length ? true : false;',
'        var criticidade = btn.length ? btn.data(''criticidade'') : false;',
'',
'        v.setMap(null);',
'        if (typeof v._myCircle !== ''undefined'') v._myCircle.setMap(null);',
'',
'        if (visible) {',
'            bounds.extend(v.getPosition());',
'            v.setMap(map.map);',
'        }',
'',
'        if (criticidade) {',
'            var circle = new google.maps.Circle({',
'                map: map.map,',
'                radius: 4000 * criticidade,',
'                strokeColor: ''#AA0000'',',
'                fillColor: ''#AA0000''',
'            });',
'            circle.bindTo(''center'', v, ''position'');',
'            v._myCircle = circle;',
'            v._myCircle.setMap(map.map);',
'            globalCircles.push(circle);',
'            ',
'        } else if (typeof v._myCircle !== ''undefined'') {',
'            v._myCircle.setMap(null);',
'            v._myCircle = null;',
'        }',
'        ',
'    });',
'    map.map.fitBounds(bounds);',
'}',
'*/',
'',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function () {',
unistr('    console.log("G\00EAnio do APEX - Debug: O c\00F3digo come\00E7ou a rodar.");'),
'',
unistr('    // --- Seu c\00F3digo original para \00EDcones ---'),
'    window.initialValues = getValuesLog();',
unistr('    $(''a.t-Tabs-link span:contains("Descri\00E7\00E3o")'').prepend(''<i class="fa fa-list-alt" style="color: var(--a-switch-background-color);"></i> '');'),
unistr('    $(''a.t-Tabs-link span:contains("Categoriza\00E7\00E3o")'').prepend(''<i class="fa fa-inbox" style="color: var(--a-switch-background-color);"></i> '');'),
unistr('    $(''a.t-Tabs-link span:contains("Localiza\00E7\00E3o")'').prepend(''<i class="fa fa-map-pin" style="color: var(--a-switch-background-color);"></i> '');'),
unistr('    $(''a.t-Tabs-link span:contains("Mensura\00E7\00E3o")'').prepend(''<i class="fa fa-dollar" style="color: var(--a-switch-background-color);"></i> '');'),
unistr('    $(''a.t-Tabs-link span:contains("Classifica\00E7\00E3o")'').prepend(''<i class="fa fa-shapes" style="color: var(--a-switch-background-color);"></i> '');'),
unistr('    $(''a.t-Tabs-link span:contains("Avalia\00E7\00E3o")'').prepend(''<i class="fa fa-money-check-pen" style="color: var(--a-switch-background-color);"></i> '');'),
unistr('    $(''a.t-Tabs-link span:contains("Hist\00F3rico")'').prepend(''<i class="fa fa-clock-o" style="color: var(--a-switch-background-color);"></i> '');'),
'    $(''a.t-Tabs-link span:contains("Anexos")'').prepend(''<i class="fa fa-folder-arrow-up" style="color: var(--a-switch-background-color);"></i> '');',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Seus estilos existentes para erros e labels */',
'.t-Form-itemRequired,',
'[id$="_error"] {',
'    color: rgb(175, 3, 3);',
'    font-size: .8rem;',
'}',
'',
'/* .t-Form-label {',
'    font-size: 16px;',
'    font-weight: bold;',
'} */',
'',
unistr('/* CORRE\00C7\00C3O PARA TEXTO INVIS\00CDVEL E LAYOUT (Existente)'),
unistr('   Reseta e for\00E7a o alinhamento correto para campos de texto somente leitura.'),
'*/',
'.apex-item-text.readonly,',
'.apex-item-text-readonly.readonly {',
'    height: auto !important;',
'    line-height: 1.5 !important;',
'    padding: 6px 8px !important;',
'    box-sizing: border-box !important;',
'}',
'#P20_ID_POSICAO,',
'#P20_ID_SUBPOSICAO {',
'    opacity: 1 !important;',
unistr('    background-color: #FFFFFF !important; /* For\00E7a o fundo a ficar branco */'),
'}',
unistr('/* Esta classe ser\00E1 adicionada e removida pelo JavaScript */'),
'.tabs-is-sticky {',
'  position: fixed;',
unistr('  top: 55px; /* Ajuste esta altura se necess\00E1rio */'),
'  background-color: #ffffff;',
'  z-index: 1000;',
'  box-shadow: 0 2px 4px rgba(0,0,0,.1);',
'}',
unistr('/* PLANO B: Adiciona o s\00EDmbolo de ''%'' usando o NOME do item como ID */'),
unistr('/* Use este c\00F3digo somente se o campo Static ID realmente n\00E3o existir */'),
'',
'#P20_TAXA_DEPRECIACAO .t-Form-inputContainer::after {',
'    content: ''%'';',
'    position: absolute;',
'    right: 30px;',
'    top: 50%;',
'    transform: translateY(-50%);',
'    color: #444;',
'    font-size: 1.1em;',
'    font-weight: 500;',
'    pointer-events: none;',
'}',
'',
'.codestyle {',
'    font-family: monospace;',
'    color: #666;',
'    font-size: 0.8em;',
'}',
'',
'span.display_only[id*="_HR"] {',
'    border: none;',
'    margin-bottom: 0;',
'    padding-bottom: 0;',
'}',
'span.display_only[id*="_HR"] hr {',
'    border-color: #eaeaea;',
'    border-style: solid;',
'}',
'',
'#P20_DATA_AVALIACAO_FINAL,',
'#P20_DESC_DESINCORPORAR {',
'    background-color: #ffebee !important; /* Um tom de vermelho bem claro */',
'    border-color: #c62828 !important;   /* Um tom de vermelho mais escuro para a borda */',
'}',
''))
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(343442329400442383)
,p_plug_name=>'Cadastro de Bens'
,p_region_name=>'rds-cadastro-bens'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--fillLabels:t-TabsRegion-mod--pill'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'rds_mode', 'JUMP',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(210431684349754459)
,p_plug_name=>'Log'
,p_title=>unistr('Hist\00F3rico')
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P20_ID_CADASTRO_DE_BENS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(210432002387754462)
,p_name=>'LogList'
,p_title=>unistr('Altera\00E7\00F5es')
,p_parent_plug_id=>wwv_flow_imp.id(210431684349754459)
,p_template=>4501440665235496320
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_css_classes=>'a-IRR-tableContainer'
,p_display_column=>3
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    l.id_key,',
'    l.table_name,',
'    l.username,',
'    l.app_id,',
'    l.page_id,',
'    l.request_name,',
'    l.date_time,',
'    jt.id         as campo_id,',
'    jt.label      as campo_label,',
'    jt.old_value  as valor_antigo,',
'    jt.new_value  as valor_novo',
'from WKSP_SFCDEV.tb_log l,',
'     json_table(',
'         l.log_json,',
'         ''$[*]''',
'         columns (',
'             id         varchar2(100)  path ''$.id'',',
'             label      varchar2(200)  path ''$.label'',',
'             old_value  varchar2(4000) path ''$.oldValue'',',
'             new_value  varchar2(4000) path ''$.newValue''',
'         )',
'     ) jt',
'where',
'    l.table_name = ''SISPAT_INVENTARIO_BENS''',
'    and l.app_id = :APP_ID',
'    and (l.page_id = 20)',
'    and l.id_key = :P20_ID_CADASTRO_DE_BENS',
'order by l.date_time desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432081496754463)
,p_query_column_id=>1
,p_column_alias=>'ID_KEY'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432204883754464)
,p_query_column_id=>2
,p_column_alias=>'TABLE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Nome da Tabela'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432367681754465)
,p_query_column_id=>3
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Usu\00E1rio')
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432395634754466)
,p_query_column_id=>4
,p_column_alias=>'APP_ID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432520073754467)
,p_query_column_id=>5
,p_column_alias=>'PAGE_ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432619701754468)
,p_query_column_id=>6
,p_column_alias=>'REQUEST_NAME'
,p_column_display_sequence=>60
,p_column_heading=>unistr('Requisi\00E7\00E3o')
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432729923754469)
,p_query_column_id=>7
,p_column_alias=>'DATE_TIME'
,p_column_display_sequence=>70
,p_column_heading=>'Data Hora'
,p_column_format=>'DD/MM/YYYY HH24:MI'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432797182754470)
,p_query_column_id=>8
,p_column_alias=>'CAMPO_ID'
,p_column_display_sequence=>80
,p_column_heading=>'ID Campo'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210432928114754471)
,p_query_column_id=>9
,p_column_alias=>'CAMPO_LABEL'
,p_column_display_sequence=>90
,p_column_heading=>'Label Campo'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210433015160754472)
,p_query_column_id=>10
,p_column_alias=>'VALOR_ANTIGO'
,p_column_display_sequence=>100
,p_column_heading=>'Valor Antigo'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(210433127593754473)
,p_query_column_id=>11
,p_column_alias=>'VALOR_NOVO'
,p_column_display_sequence=>110
,p_column_heading=>'Valor Novo'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(219733401384655838)
,p_plug_name=>unistr('Localiza\00E7\00E3o')
,p_region_name=>'mapa_bens'
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lat, lng, name, id, info',
'from (',
unistr('    -- 1\00AA tentativa: busca pelo cadastro espec\00EDfico'),
'    select',
'        t.latitude as lat,',
'        t.longitude as lng,',
'        t.nome_item as name,',
'        t.id_cadastro_de_bens as id,',
'        replace(replace(''<b>'' || t.nome_item || ''</b><br>Clique e arraste o pino para alterar.'', chr(10), ''''), chr(13), '''') as info,',
'        1 as ordem',
'    from SISPAT_INVENTARIO_BENS t',
'    where t.id_cadastro_de_bens = :p20_id_cadastro_de_bens',
'      and t.latitude is not null',
'      and t.longitude is not null',
'',
'    union all',
'',
unistr('    -- 2\00AA tentativa: fallback pela view vinculada ao contrato'),
'    select',
'        v.LATITUDE as lat,',
'        v.LONGITUDE as lng,',
'        ''Local do contrato'' as name,',
'        null as id,',
'        ''<b>Local do contrato</b>'' as info,',
'        2 as ordem',
'    from VW_APEX_SISPAT_INVENTARIO_BENS v',
'    where v.NUMERO_CONTRATO = :P20_NUMERO_CONTRATO',
'      and v.LATITUDE is not null',
'      and v.LONGITUDE is not null',
')',
'where rownum = 1',
'order by ordem;'))
,p_plug_source_type=>'PLUGIN_COM.JK64.REPORT_GOOGLE_MAP_R1'
,p_ajax_items_to_submit=>'P20_ID_CADASTRO_DE_BENS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '600',
  'attribute_02', 'PINS',
  'attribute_03', '13',
  'attribute_04', 'PAN_ALLOWED:ZOOM_ALLOWED:SPINNER',
  'attribute_05', '4',
  'attribute_06', '-14,-50',
  'attribute_22', 'ROADMAP',
  'attribute_24', 'Y',
  'attribute_25', 'auto')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(223557467074315244)
,p_plug_name=>unistr('Categoriza\00E7\00E3o')
,p_title=>unistr('Categoriza\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'SISPAT_INVENTARIO_BENS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(228331767449485658)
,p_plug_name=>'Anexos'
,p_title=>'Anexos'
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CADASTRO_DE_BENS,',
'       IMAGEM,',
'       IMAGEM_FILENAME,',
'       IMAGEM_MIMETYPE,',
'       IMAGEM_LAST_UPDATE',
'  from SISPAT_INVENTARIO_BENS'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P20_ID_CADASTRO_DE_BENS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(343442607039442386)
,p_plug_name=>unistr('Mensura\00E7\00E3o')
,p_title=>unistr('Mensura\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'SISPAT_INVENTARIO_BENS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(343442688480442387)
,p_plug_name=>unistr('Classifica\00E7\00E3o')
,p_title=>unistr('Classifica\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'TABLE'
,p_query_table=>'SISPAT_INVENTARIO_BENS'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(355540739347385488)
,p_plug_name=>unistr('Descri\00E7\00E3o')
,p_title=>unistr('Descri\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(343442329400442383)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NUMERO_CONTRATO,',
'       ID_CADASTRO_DE_BENS,',
'       ID_STATUS,',
'       VINCULACAO_CONTRATUAL,',
'       CAPACIDADE,',
'       CAPITULO,',
'       POSICAO,',
'       SUBPOSICAO,',
'       NOME_ITEM,',
'       COR,',
'       FORNECEDOR,',
'       NUMERO_REGISTRO_PATRIMONIAL,',
'       MODALIDADE_TOMBAMENTO,',
'       LATITUDE,',
'       LONGITUDE,',
'       DESTINACAO,',
'       DATA_TOMBAMENTO,',
'       UNIDADE_MEDIDA,',
'       ESPECIFICACAO_TECNICA,',
'       VALOR_ORIGINAL_COMPRA,',
'       FONTE_RECURSO,',
'       HISTORICO,',
'       SITUACAO,',
'       ESTADO_CONSERVACAO, -- Alterado conforme solicitado',
'       BEM_UNIAO,',
'       BEM_REVERSIVEL,',
'       NATUREZA,',
'       TEMPO_UTILIZACAO,',
'       MODALIDADE_EXPLORACAO,',
'       TIPO_BEM,',
'       GRUPO_BENS,',
'       DATA_AVALIACAO,',
'       VALOR_JUSTO_MERCADO,',
'       CONTA_CONTABIL,',
'       VALOR_RESIDUAL,',
'       VIDA_UTIL_ANOS,',
'       TAXA_DEPRECIACAO,',
'       DEPRECIACAO_ESPECIAL,',
'       DESC_DEPRECIACAO_ESPECIAL,',
'       DATA_AVALIACAO_FINAL,',
'       IMAGEM,',
'       IMAGEM_FILENAME,',
'       IMAGEM_MIMETYPE,',
'       IMAGEM_LAST_UPDATE,',
'       DESC_DESINCORPORAR,',
'       DEPRECIACAO_ANUAL,',
'       NUM_CNPJ,',
'       SIGLA_UF,',
'       COD_TRIGRAMA',
'  from SISPAT_INVENTARIO_BENS'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(355565393257385517)
,p_plug_name=>unistr('Bot\00F5es')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219614833958986571)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'DESINCORPORAR_BEM'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>unistr('Solicitar Desincorpora\00E7\00E3o')
,p_button_condition=>':P20_ID_STATUS = 2 AND :P20_ID_CADASTRO_DE_BENS IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-minus-circle-o'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(227355675736144951)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'DESINCORPORAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Desincorporar'
,p_button_condition=>'P20_ID_STATUS'
,p_button_condition2=>'3'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-minus-circle-o'
,p_security_scheme=>wwv_flow_imp.id(212166434089909885)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(319546971540384179)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'REENCORPORAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reencorporar'
,p_button_condition=>':P20_ID_STATUS = 3 OR :P20_ID_STATUS = 4 AND :P20_ID_CADASTRO_DE_BENS IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-refresh'
,p_security_scheme=>wwv_flow_imp.id(212166434089909885)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(355567237794385520)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--noUI:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Excluir'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P20_ID_CADASTRO_DE_BENS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(355567635841385520)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'EDITAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Editar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P20_ID_CADASTRO_DE_BENS'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(355568062679385521)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Salvar'
,p_button_position=>'NEXT'
,p_button_condition=>'P20_ID_CADASTRO_DE_BENS'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(227355381252144948)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(355565393257385517)
,p_button_name=>'APROVAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprovar'
,p_button_position=>'NEXT'
,p_button_condition=>':P20_ID_STATUS = 1 AND :P20_ID_CADASTRO_DE_BENS IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check-square'
,p_security_scheme=>wwv_flow_imp.id(212166434089909885)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(60758609705190740)
,p_name=>'P20_ARQUIVOS_VIEW'
,p_source_data_type=>'BLOB'
,p_is_query_only=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(228331767449485658)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_source=>'IMAGEM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cattributes_element=>'style="justify-content: center;display: flex;"'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'DB_COLUMN',
  'blob_last_updated_column', 'IMAGEM_LAST_UPDATE',
  'filename_column', 'IMAGEM_FILENAME',
  'mime_type_column', 'IMAGEM_MIMETYPE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186252954610524904)
,p_name=>'P20_NUMERO_CONTRATO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Numero Contrato'
,p_source=>'NUMERO_CONTRATO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT NUMERO_CONTRATO',
'FROM SISPAT_INVENTARIO_BENS',
'WHERE NUM_CNPJ = REGEXP_REPLACE(:P20_CNPJ, ''[^0-9]'', '''')',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186253551593524910)
,p_name=>'P20_MODALIDADE_TOMBAMENTO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Modalidade Tombamento'
,p_source=>'MODALIDADE_TOMBAMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MODALIDADE DE TOMBAMENTO'
,p_lov=>'.'||wwv_flow_imp.id(355602885762644153)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('1. Aquisi\00E7\00E3o: Ocorre quando a autoridade portu\00E1ria ou o arrendat\00E1rio compra o bem utilizando recursos pr\00F3prios.'),
'',
unistr('2. Comodato: A entidade recebe um bem para uso por um tempo determinado, de forma gratuita, mas com a obriga\00E7\00E3o de devolv\00EA-lo ao final do contrato.'),
'',
unistr('3. Cess\00E3o: A transfer\00EAncia de posse de um bem de um \00F3rg\00E3o p\00FAblico para outro, sem custo. '),
'',
unistr('4. Permuta ou Troca: Troca de um ou mais bens de seu patrim\00F4nio por outros bens pertencentes a terceiros, sejam eles p\00FAblicos ou privados. '),
'',
unistr('5. Doa\00E7\00E3o: A entidade recebe um bem de uma pessoa f\00EDsica ou jur\00EDdica, p\00FAblica ou privada, sem qualquer custo.'),
'',
unistr('6. Fabrica\00E7\00E3o: Refere-se a bens produzidos pela pr\00F3pria entidade. '),
'',
unistr('7. Incorpora\00E7\00E3o Pr\00E9via: Esta modalidade geralmente se aplica a bens que j\00E1 existiam e estavam em uso pela entidade, mas que, por algum motivo, ainda n\00E3o haviam sido formalmente registrados no sistema patrimonial. '),
'',
unistr('8. Transfer\00EAncia: Este termo \00E9 frequentemente usado no contexto de movimenta\00E7\00E3o de bens entre unidades da mesma institui\00E7\00E3o (por exemplo, entre a sede administrativa e uma unidade portu\00E1ria espec\00EDfica) ou entre \00F3rg\00E3os do governo.'),
'',
unistr('9. Encampa\00E7\00E3o: Ato pelo qual o poder p\00FAblico retoma um servi\00E7o ou bens concedidos a um particular antes do fim do contrato, por motivo de interesse p\00FAblico. '),
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186254178550524916)
,p_name=>'P20_DATA_TOMBAMENTO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Data Tombamento'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'DATA_TOMBAMENTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_help_text=>'Data de cadastramento do bem.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186254607061524921)
,p_name=>'P20_UNIDADE_MEDIDA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Unidade Medida'
,p_source=>'UNIDADE_MEDIDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:N\00E3o definido;1,Caixa;2,Cole\00E7\00E3o;3,Conjunto;4,Equip.;5,Jogo;6,Kg;7,Km;8,Litro;9,M2;10,M3;11,Metro;12,Par;13,Parte;14,Pe\00E7a;15,Tonelada;16,Unid.;17')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186255241713524927)
,p_name=>'P20_VALOR_ORIGINAL_COMPRA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Valor Original Compra'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'VALOR_ORIGINAL_COMPRA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_icon_css_classes=>'fa-dollar'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186256230026524937)
,p_name=>'P20_ESTADO_CONSERVACAO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Estado de conserva\00E7\00E3o')
,p_source=>'ESTADO_CONSERVACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>unistr('ESTADO DE CONSERVA\00C7\00C3O')
,p_lov=>'.'||wwv_flow_imp.id(355587934588610998)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186256380178524938)
,p_name=>'P20_VALOR_JUSTO_MERCADO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Valor Justo de Mercado'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'VALOR_JUSTO_MERCADO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_icon_css_classes=>'fa-dollar'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186257003905524945)
,p_name=>'P20_BEM_UNIAO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Bem da Uniao'
,p_source=>'BEM_UNIAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC2:Sim;1,N\00E3o;2')
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Bem que n\00E3o \00E9 propriedade definitiva da Autoridade Portu\00E1ria, mas sim um patrim\00F4nio que pertence ou pertencer\00E1 \00E0 Uni\00E3o e que est\00E1 sob a responsabilidade do porto para a explora\00E7\00E3o da atividade portu\00E1ria.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(187579951963019502)
,p_name=>'P20_FONTE_RECURSO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Fonte Recurso'
,p_source=>'FONTE_RECURSO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>' FONTE DE RECURSO'
,p_lov=>'.'||wwv_flow_imp.id(355590088029614932)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188626786400541401)
,p_name=>'P20_TEMPO_UTILIZACAO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Tempo de Utilizacao (anos)'
,p_source=>'TEMPO_UTILIZACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_help_text=>'Tempo que foi utilizado em anos.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188627351010541407)
,p_name=>'P20_TIPO_BEM'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Tipo de Bem'
,p_source=>'TIPO_BEM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO DE BEM'
,p_lov=>'.'||wwv_flow_imp.id(355615883765668058)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('1. Bens da Uni\00E3o - Administra\00E7\00E3o: Itens de propriedade da Uni\00E3o que est\00E3o concedidos \00E0s Autoridades Portu\00E1rias para serem utilizadas em suas atividades administrativas.'),
'',
unistr('2. Bens da Uni\00E3o - Opera\00E7\00E3o: Itens de propriedade da Uni\00E3o que est\00E3o concedidos \00E0s Autoridades Portu\00E1rias para serem utilizadas em suas atividades operacionais.'),
'',
unistr('3. Bens da Uni\00E3o - Terceiros: Bens de propriedade da Uni\00E3o, que est\00E3o sob concess\00E3o da Autoridade Portu\00E1ria, e que foram subcontratados ou alugados a terceiros.'),
'',
unistr('4. Bens de Terceiros: Bens de propriedade da Autoridade Portu\00E1ria que est\00E3o concedidos ou alugados a terceiros. '),
'',
unistr('5. Bens Pr\00F3prios - Administra\00E7\00E3o: Itens de propriedade da Autoridade Portu\00E1ria (AP) que s\00E3o utilizados em suas atividades administrativas.'),
'',
unistr('6. Bens Pr\00F3prios - Opera\00E7\00E3o: Itens de propriedade da AP que s\00E3o utilizados em suas atividades operacionais.'),
'',
unistr('7. Imobilizado em Andamento: Itens de propriedade da AP que ainda n\00E3o est\00E3o operando. Isso inclui obras em andamento, importa\00E7\00F5es em andamento e adiantamentos a fornecedores para aquisi\00E7\00E3o de imobilizado.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188627883900541412)
,p_name=>'P20_GRUPO_BENS'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Grupo de Bens'
,p_source=>'GRUPO_BENS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'GRUPO DE BENS'
,p_lov=>'.'||wwv_flow_imp.id(355591965555624897)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('1. <b> Terrenos: </b> Refere-se \00E0s \00E1reas de terra de propriedade da entidade. <br>'),
'',
unistr('2. <b> Edif\00EDcios e benfeitorias: </b> Corresponde \00E0s estruturas prediais, como pr\00E9dios administrativos, e as melhorias realizadas neles. <br>'),
'',
unistr('3. <b> Instala\00E7\00F5es: </b> Registra os sistemas el\00E9tricos, hidr\00E1ulicos, de comunica\00E7\00E3o e outros similares que servem aos edif\00EDcios. <br>'),
'',
unistr('4. <b> M\00E1quinas: </b> Bem mais robusto e complexo, frequentemente com partes m\00F3veis, que utiliza uma fonte de energia para realizar um trabalho espec\00EDfico ou transformar materiais. <br>'),
'',
unistr('5. <b> Aparelhos: </b> Dispositivo com uma fun\00E7\00E3o mais espec\00EDfica, muitas vezes eletr\00F4nica ou de medi\00E7\00E3o, e geralmente de menor porte que uma "m\00E1quina".  <br>'),
'',
unistr('6. <b> Equipamentos: </b> Este \00E9 o termo mais amplo e gen\00E9rico, que pode englobar tanto m\00E1quinas quanto aparelhos. <br>'),
'',
unistr('7. <b> Equipamentos de Inform\00E1tica: </b> Computadores, servidores, impressoras e outros hardwares de tecnologia da informa\00E7\00E3o. <br>'),
'',
unistr('8. <b> Sistemas aplicativos (softwares): </b> Programas de computador adquiridos ou desenvolvidos que possuem uma liga\00E7\00E3o direta com um ativo f\00EDsico (hardware). <br>'),
'',
unistr('9. <b> M\00F3veis e utens\00EDlios: </b> Categoria que inclui mesas, cadeiras, arm\00E1rios e outro mobili\00E1rio de escrit\00F3rio. <br>'),
'',
unistr('10. <b> Ve\00EDculos: </b> Registra os carros, vans e demais ve\00EDculos utilizados para as finalidades administrativas da Autoridade Portu\00E1ria. <br>'),
'',
unistr('11. <b> Ferramentas: </b> Conta que abrange o conjunto de ferramentas de uso geral para atividades de manuten\00E7\00E3o. <br>'),
'',
unistr('12. <b> Pe\00E7as e Conjuntos de Reposi\00E7\00E3o: </b> Pe\00E7as e componentes mantidos em estoque para a reposi\00E7\00E3o e manuten\00E7\00E3o de equipamentos administrativos. <br>'),
'',
unistr('13. <b> Benfeitorias em Propriedades Arrendadas: </b> Refere-se a obras, constru\00E7\00F5es ou melhorias que a Autoridade Portu\00E1ria realiza em um im\00F3vel que ela aluga de terceiros. <br>'),
'',
unistr('14. <b> N\00E3o Aplic\00E1vel: </b> Op\00E7\00E3o para quando a classifica\00E7\00E3o de um bem n\00E3o se encaixa em nenhuma das categorias predefinidas. <br>'),
'',
unistr('15. <b> Infraestrutura Mar\00EDtima: </b> Corresponde aos bens utilizados nas atividades operacionais relacionadas ao acesso aquavi\00E1rio. <br>'),
'',
unistr('16. <b> Infraestrutura Acostagem: </b> Refere-se \00E0s estruturas onde os navios atracam para as opera\00E7\00F5es. '),
'',
unistr('17. <b> Infraestrutura Terrestre: </b> S\00E3o os ativos em terra que d\00E3o suporte \00E0 opera\00E7\00E3o portu\00E1ria. '),
'',
'18. <b> Armazenagem: </b> Categoria para as estruturas de guarda de cargas.',
'',
unistr('19. <b> Outros \2013 Armazenagem (Equipamentos, Guindaste, Port\00EAiner, Ship Loader, Correia Transportadora, Tubula\00E7\00E3o, Grab e Empilhadeira): </b> Esta categoria detalha os equipamentos espec\00EDficos da opera\00E7\00E3o portu\00E1ria.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188628399985541417)
,p_name=>'P20_DATA_AVALIACAO'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Data Avaliacao'
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'DATA_AVALIACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(188628871823541422)
,p_name=>'P20_NUM_CNPJ'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'CNPJ'
,p_source=>'NUM_CNPJ'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_MINHAS_EMPRESAS_VINCULADAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
unistr('    -- Tenta pegar o nome da View. Se n\00E3o achar (foi manual), mostra o CNPJ formatado'),
'    formatar_cnpj(L.CNPJ) AS DISPLAY_VALUE,',
'    V.NOME_EMPRESA                                               AS EMPRESA,',
'    L.CNPJ                                                       AS RETURN_VALUE,',
'    formatar_cnpj(L.CNPJ)                                        AS EXIBIR_CNPJ',
'FROM SISPAT_REPRESENTANTE_EMPRESA L',
'-- Join para pegar dados do representante (para filtrar pelo Login/Email)',
'JOIN SISPAT_REPRESENTANTE R ON L.ID_REPRESENTANTE = R.ID_REPRESENTANTE',
'-- Left Join para tentar achar o nome bonito na View oficial',
'LEFT JOIN VW_APEX_EMPRESAS V ON L.CNPJ = V.NUM_CNPJ',
'WHERE ',
unistr('        -- Condi\00E7\00E3o original: Usu\00E1rio atual'),
'        INSTR(R.EMAIL, LOWER(:APP_USER)) > 0',
'    ',
'ORDER BY 1'))
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_read_only_when=>'P20_NUM_CNPJ'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208804465680941677)
,p_name=>'P20_CAPITULO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(223557467074315244)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Cap\00EDtulo')
,p_source=>'CAPITULO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'CAPITULO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    DISTINCT ID_CAPITULO,',
'    DESC_CAPITULO',
'from ',
'    SISPAT_SUBPOSICOES'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'ID_CAPITULO:P20_ID_CAPITULO',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208804497594941678)
,p_name=>'P20_POSICAO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(223557467074315244)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Posi\00E7\00E3o')
,p_source=>'POSICAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'POSICAO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
' DISTINCT DESC_POSICAO, ',
' ID_POSICAO',
'FROM ',
' SISPAT_SUBPOSICOES',
'WHERE ',
' ID_CAPITULO = :P20_CAPITULO ',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P20_CAPITULO'
,p_ajax_items_to_submit=>'P20_CAPITULO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_colspan=>10
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'ID_POSICAO:P20_ID_POSICAO',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(208804575404941679)
,p_name=>'P20_SUBPOSICAO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(223557467074315244)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Subposi\00E7\00E3o')
,p_source=>'SUBPOSICAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SUBPOSICAO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
unistr('    DISTINCT DESC_SUBPOSICAO, -- Coluna com o nome/descri\00E7\00E3o'),
'    ID_SUBPOSICAO  -- Coluna com o ID',
'FROM ',
'    SISPAT_SUBPOSICOES',
'WHERE ',
unistr('    ID_POSICAO = :P20_POSICAO -- Filtro pela posi\00E7\00E3o selecionada'),
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P20_POSICAO'
,p_ajax_items_to_submit=>'P20_POSICAO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorAsterisk:t-Form-fieldContainer--large'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'ID_SUBPOSICAO:P20_ID_SUBPOSICAO',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(210410191756569043)
,p_name=>'P20_ID_CAPITULO'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(223557467074315244)
,p_prompt=>unistr('Cap\00EDtulo')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(210433258000754474)
,p_name=>'P20_LOG_ALTERACOES'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(210434388834754486)
,p_name=>'P20_ID_SUBPOSICAO'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(223557467074315244)
,p_prompt=>unistr('Subposi\00E7\00E3o')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219614265436986565)
,p_name=>'P20_DESCRICAO_DEPRECIACAO_ESPECIAL'
,p_source_data_type=>'CLOB'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Descri\00E7\00E3o da Deprecia\00E7\00E3o Especial')
,p_source=>'DESC_DEPRECIACAO_ESPECIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219736108226655865)
,p_name=>'P20_MODALIDADE_EXPLORACAO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_source=>'MODALIDADE_EXPLORACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(223557553409315245)
,p_name=>'P20_LATITUDE_VIEW'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(219733401384655838)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Latitude'
,p_source=>'LATITUDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'codestyle'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--normalDisplay'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(223557639162315246)
,p_name=>'P20_LONGITUDE_VIEW'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(219733401384655838)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Longitude'
,p_source=>'LONGITUDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'codestyle'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--normalDisplay'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(225075282113869784)
,p_name=>'P20_DEPRECIACAO_ESPECIAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Depreciacao Especial'
,p_source=>'DEPRECIACAO_ESPECIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC2:Sim;1,N\00E3o;2')
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(225186695329467141)
,p_name=>'P20_ID_STATUS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_default=>'2'
,p_source=>'ID_STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(232133862577912963)
,p_name=>'P20_DATA_AVALIACAO_FINAL'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Data de Avalia\00E7\00E3o Final')
,p_format_mask=>'DD/MM/YYYY'
,p_source=>'DATA_AVALIACAO_FINAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>4
,p_display_when=>'P20_DATA_AVALIACAO_FINAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(232134275532912968)
,p_name=>'P20_DESC_DESINCORPORAR'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Motivo de Desincorpora\00E7\00E3o')
,p_source=>'DESC_DESINCORPORAR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_begin_on_new_line=>'N'
,p_display_when=>'P20_DATA_AVALIACAO_FINAL'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248554930130483066)
,p_name=>'P20_DEPRECIACAO_ANUAL'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Deprecia\00E7\00E3o Anual')
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'DEPRECIACAO_ANUAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'field_log'
,p_field_template=>1609121967514267634
,p_item_icon_css_classes=>'fa-dollar'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge:margin-top-md:margin-bottom-none'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304641775399092783)
,p_name=>'P20_ID_CADASTRO_DE_BENS_1'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(228331767449485658)
,p_item_source_plug_id=>wwv_flow_imp.id(228331767449485658)
,p_source=>'ID_CADASTRO_DE_BENS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304641933929092784)
,p_name=>'P20_ARQUIVOS'
,p_source_data_type=>'BLOB'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(228331767449485658)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Arquivos'
,p_source=>'IMAGEM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_IMAGE_UPLOAD'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561666792084173
,p_item_icon_css_classes=>'fa-upload'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_cropping', 'Y',
  'aspect_ratio', 'AUTO',
  'blob_last_updated_column', 'IMAGEM_LAST_UPDATE',
  'display_as', 'DROPZONE_BLOCK',
  'display_download_link', 'Y',
  'download_link_text', 'Fazer Download',
  'filename_column', 'IMAGEM_FILENAME',
  'max_file_size', '5120',
  'max_width', '1024',
  'mime_type_column', 'IMAGEM_MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(321025976961277148)
,p_name=>'P20_SIGLA_UF'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'UF'
,p_source=>'SIGLA_UF'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT COD_UF AS d,',
'                COD_UF AS r',
'FROM WKSP_SFCDEV.SITPORTOS_PORTOS',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(321026496698277153)
,p_name=>'P20_COD_TRIGRAMA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Porto'
,p_source=>'COD_TRIGRAMA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    tb.NOME_PORTO || '' ('' || COD_TRIGRAMA || '')'' AS d,',
'    tb.COD_TRIGRAMA AS r',
'FROM WKSP_SFCDEV.TB_PORTOS tb',
'JOIN WKSP_SFCDEV.SITPORTOS_PORTOS sit ',
unistr('  ON REGEXP_REPLACE(UPPER(TRANSLATE(tb.NOME_PORTO, ''\00E1\00E9\00ED\00F3\00FA\00E0\00E8\00EC\00F2\00F9\00E3\00F5\00E2\00EA\00EE\00F4\00FB\00E4\00EB\00EF\00F6\00FC\00E7\00C1\00C9\00CD\00D3\00DA\00C0\00C8\00CC\00D2\00D9\00C3\00D5\00C2\00CA\00CE\00D4\00DB\00C4\00CB\00CF\00D6\00DC\00C7'', ''aeiouaeiouaoaeiouaeioucAEIOUAEIOUAOAEIOUAEIOUC'')), ''[^A-Z0-9]'', '''') '),
unistr('   = REGEXP_REPLACE(UPPER(TRANSLATE(sit.NOME_PORTO, ''\00E1\00E9\00ED\00F3\00FA\00E0\00E8\00EC\00F2\00F9\00E3\00F5\00E2\00EA\00EE\00F4\00FB\00E4\00EB\00EF\00F6\00FC\00E7\00C1\00C9\00CD\00D3\00DA\00C0\00C8\00CC\00D2\00D9\00C3\00D5\00C2\00CA\00CE\00D4\00DB\00C4\00CB\00CF\00D6\00DC\00C7'', ''aeiouaeiouaoaeiouaeioucAEIOUAEIOUAOAEIOUAEIOUC'')), ''[^A-Z0-9]'', '''')'),
'WHERE (:P20_SIGLA_UF IS NULL OR sit.COD_UF = :P20_SIGLA_UF)',
'ORDER BY tb.NOME_PORTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P20_SIGLA_UF'
,p_ajax_items_to_submit=>'P20_SIGLA_UF'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355540982588385488)
,p_name=>'P20_ID_CADASTRO_DE_BENS'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_source=>'ID_CADASTRO_DE_BENS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355543051019385495)
,p_name=>'P20_ID_POSICAO'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(223557467074315244)
,p_prompt=>unistr('Posi\00E7\00E3o')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355543861367385496)
,p_name=>'P20_NOME_ITEM'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Nome do Item'
,p_source=>'NOME_ITEM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NOME_ITEM',
'FROM SISPAT_INVENTARIO_BENS',
'GROUP BY NOME_ITEM'))
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_icon_css_classes=>'fa-tag'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '1',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355544236701385496)
,p_name=>'P20_COR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Cor'
,p_source=>'COR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'       COR ',
'  FROM SISPAT_INVENTARIO_BENS',
' ORDER BY 1;'))
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '1',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355544578079385497)
,p_name=>'P20_FORNECEDOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Fornecedor'
,p_source=>'FORNECEDOR'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'       FORNECEDOR ',
'  FROM SISPAT_INVENTARIO_BENS',
' ORDER BY 1;'))
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561666792084173
,p_item_icon_css_classes=>'fa-building'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '1',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355545006390385497)
,p_name=>'P20_NUMERO_REGISTRO_PATRIMONIAL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Numero Registro Patrimonial'
,p_source=>'NUMERO_REGISTRO_PATRIMONIAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355545768828385498)
,p_name=>'P20_LATITUDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(219733401384655838)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_source=>'LATITUDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355546187950385498)
,p_name=>'P20_LONGITUDE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(219733401384655838)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_source=>'LONGITUDE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355546578775385499)
,p_name=>'P20_DESTINACAO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Destina\00E7\00E3o')
,p_source=>'DESTINACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'       DESTINACAO',
'  FROM SISPAT_INVENTARIO_BENS',
' ORDER BY 1;'))
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '1',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355547445733385500)
,p_name=>'P20_CAPACIDADE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Capacidade'
,p_source=>'CAPACIDADE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355548245506385501)
,p_name=>'P20_ESPECIFICACAO_TECNICA'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Especifica\00E7\00E3o t\00E9cnica')
,p_source=>'ESPECIFICACAO_TECNICA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355549421256385502)
,p_name=>'P20_HISTORICO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Hist\00F3rico')
,p_source=>'HISTORICO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>unistr('HIST\00D3RICO')
,p_lov=>'.'||wwv_flow_imp.id(355599918102637681)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
unistr('1. <b>Tombado:</b> O bem existe fisicamente, foi corretamente cadastrado no sistema, possui um n\00FAmero de registro e est\00E1 sob a responsabilidade da entidade.<br>'),
unistr('2. <b>N\00E3o Tombado:</b> O bem existe fisicamente e est\00E1 em uso pela entidade, mas nunca foi formalmente registrado no sistema de controle patrimonial.<br>'),
unistr('3. <b>Tombado, por\00E9m inexistente ou n\00E3o localizado:</b> O sistema diz que o bem existe e est\00E1 registrado, mas durante uma verifica\00E7\00E3o f\00EDsica, ele n\00E3o foi encontrado.<br>'),
unistr('4. <b>Com invent\00E1rio de transfer\00EAncia pela Uni\00E3o:</b> O bem em quest\00E3o fez parte de um processo de transfer\00EAncia da Uni\00E3o para a entidade e existe um documento formal que lista e descreve este bem.<br>'),
unistr('5. <b>Sem invent\00E1rio de transfer\00EAncia pela Uni\00E3o:</b> O bem foi transferido pela Uni\00E3o, mas n\00E3o h\00E1 um documento formal listando-o.<br>'),
unistr('6. <b>Com ou sem aceite formal de transfer\00EAncia de guarda e responsabilidade:</b> A transfer\00EAncia foi iniciada, mas o aceite formal pela entidade que recebeu o bem est\00E1 pendente ou n\00E3o foi claramente documentado.<br>'),
unistr('7. <b>Sem aceite formal de transfer\00EAncia de guarda e responsabilidade:</b> A Uni\00E3o transferiu o bem, mas a entidade que o recebeu nunca assinou o termo de recebimento e responsabilidade.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355549769872385503)
,p_name=>'P20_SITUACAO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Situa\00E7\00E3o')
,p_source=>'SITUACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>unistr('SITUA\00C7\00C3O')
,p_lov=>'.'||wwv_flow_imp.id(355613721223659618)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
unistr('1. <b>Serv\00EDvel:</b> \00C9 um bem que est\00E1 em perfeitas condi\00E7\00F5es de uso e atende aos prop\00F3sitos para os quais foi adquirido.<br>'),
unistr('2. <b>Inserv\00EDvel - Ocioso:</b> O bem est\00E1 em boas condi\00E7\00F5es de uso (\00E9 serv\00EDvel), mas, por alguma raz\00E3o, n\00E3o est\00E1 sendo utilizado.<br>'),
unistr('3. <b>Inserv\00EDvel - Antiecon\00F4mico:</b> O uso deste bem n\00E3o compensa mais. Sua manuten\00E7\00E3o \00E9 muito cara, seu rendimento \00E9 prec\00E1rio ou ele consome recursos de forma excessiva em compara\00E7\00E3o com alternativas mais modernas.<br>'),
unistr('4. <b>Inserv\00EDvel - Recuper\00E1vel:</b> O bem est\00E1 quebrado ou danificado, mas seu conserto \00E9 poss\00EDvel.<br>'),
unistr('5. <b>Inserv\00EDvel - Irrecuper\00E1vel:</b> O bem n\00E3o pode mais ser utilizado para o fim a que se destina e seu conserto n\00E3o \00E9 vi\00E1vel ou \00E9 imposs\00EDvel.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355551011218385504)
,p_name=>'P20_BEM_REVERSIVEL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Bem Revers\00EDvel')
,p_source=>'BEM_REVERSIVEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>unistr('STATIC2:Sim;1,N\00E3o;2')
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Os <B>bens revers\00EDveis</B> s\00E3o aqueles essenciais \00E0 execu\00E7\00E3o da atividade portu\00E1ria,'),
unistr('decorrentes de investimentos realizados na infraestrutura portu\00E1ria e aquavi\00E1ria pela'),
unistr('autoridade portu\00E1ria, pelo arrendat\00E1rio e pela Uni\00E3o (Poder Concedente), bem como'),
unistr('aqueles entregues pela Uni\00E3o ao concession\00E1rio, delegat\00E1rio ou arrendat\00E1rio. Os bens'),
unistr('revers\00EDveis tamb\00E9m se aplicam ao arrendat\00E1rio transit\00F3rio (titular de contrato de'),
unistr('transi\00E7\00E3o).')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355551424484385504)
,p_name=>'P20_NATUREZA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Natureza'
,p_source=>'NATUREZA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'NATUREZA'
,p_lov=>'.'||wwv_flow_imp.id(355607167990646816)||'.'
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
unistr('1. <b>Bem Im\00F3vel:</b> Refere-se ao solo e a tudo que se incorporar a ele natural ou artificialmente. Mant\00E9m a caracter\00EDstica de bem im\00F3vel mesmo que edifica\00E7\00F5es, ap\00F3s serem separadas do solo, conservem sua unidade e sejam removidas para outro local, ')
||unistr('ou que materiais sejam provisoriamente separados de um pr\00E9dio para nele serem reempregados.<br>'),
unistr('2. <b>Bem M\00F3vel:</b> Diz respeito ao que \00E9 suscet\00EDvel de movimento pr\00F3prio, ou de remo\00E7\00E3o por for\00E7a alheia, sem altera\00E7\00E3o de sua subst\00E2ncia ou forma. Inclui tamb\00E9m os materiais destinados a alguma constru\00E7\00E3o enquanto n\00E3o empregados, e os provenientes')
||unistr(' de demoli\00E7\00E3o.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355552212175385505)
,p_name=>'P20_VINCULACAO_CONTRATUAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(343442688480442387)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Vincula\00E7\00E3o contratual')
,p_source=>'VINCULACAO_CONTRATUAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'VINCULACAO CONTRATUAL'
,p_lov=>'.'||wwv_flow_imp.id(355618951188671140)||'.'
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('1. <b>Remov\00EDvel:</b> Indica que o v\00EDnculo pode ser desfeito, rescindido ou alterado com relativa flexibilidade, geralmente mediante aviso pr\00E9vio e/ou sem grandes encargos ou burocracias complexas.<br>'),
unistr('2. <b>N\00E3o Remov\00EDvel:</b> Sinaliza um v\00EDnculo de car\00E1ter mais permanente ou com prazo fixo, onde a rescis\00E3o ou altera\00E7\00E3o pode envolver condi\00E7\00F5es espec\00EDficas, multas contratuais, processos mais formais ou restri\00E7\00F5es legais.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355553403590385506)
,p_name=>'P20_CONTA_CONTABIL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Conta cont\00E1bil')
,p_source=>'CONTA_CONTABIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'CONTA CONTABIL'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Uma <B>conta cont\00E1bil</B> \00E9 a unidade b\00E1sica de registro da contabilidade, que funciona como uma etiqueta para agrupar todas as transa\00E7\00F5es financeiras de mesma natureza.'),
unistr('Cada conta possui um c\00F3digo num\00E9rico e um t\00EDtulo para identifica\00E7\00E3o.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(355554635939385507)
,p_name=>'P20_VALOR_RESIDUAL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>'Valor residual'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_source=>'VALOR_RESIDUAL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_icon_css_classes=>'fa-dollar'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_help_text=>unistr('<B>Valor residual</B> \00E9 o valor estimado que uma Autoridade Portu\00E1ria poderia obter pela venda de um ativo ao final de sua vida \00FAtil, j\00E1 deduzidos os custos esperados para a venda.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(356426782287167955)
,p_name=>'P20_TAXA_DEPRECIACAO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Taxa deprecia\00E7\00E3o')
,p_source=>'TAXA_DEPRECIACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_begin_on_new_line=>'N'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_help_text=>unistr('Percentual anual aplicado sobre o valor de um bem para registrar a sua perda de valor devido ao uso, ao desgaste natural ou \00E0 obsolesc\00EAncia.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(356426901240167956)
,p_name=>'P20_VIDA_UTIL'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(343442607039442386)
,p_item_source_plug_id=>wwv_flow_imp.id(355540739347385488)
,p_prompt=>unistr('Vida \00FAtil (anos)')
,p_source=>'VIDA_UTIL_ANOS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'field_log'
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_help_text=>unistr('Per\00EDodo durante o qual se espera que o ativo seja utilizado pela Autoridade Portu\00E1ria.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'min_value', '0.1',
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(188629572084541429)
,p_validation_name=>'DATA_BASE_AVALIACAO'
,p_validation_sequence=>10
,p_validation=>'TO_DATE(:P20_DATA_AVALIACAO) >= TO_DATE(:P20_DATA_TOMBAMENTO)'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('A data de avalia\00E7\00E3o n\00E3o pode ser maior que a data de tombamento.')
,p_associated_item=>wwv_flow_imp.id(188628399985541417)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(219614729275986570)
,p_validation_name=>unistr('Valida Descri\00E7\00E3o Obrigat\00F3ria')
,p_validation_sequence=>20
,p_validation=>'P20_DESCRICAO_DEPRECIACAO_ESPECIAL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('O campo "Descri\00E7\00E3o da Deprecia\00E7\00E3o Especial" \00E9 obrigat\00F3rio quando a op\00E7\00E3o ''Sim'' \00E9 selecionada.')
,p_validation_condition=>'P20_ID_CADASTRO_DE_BENS'
,p_validation_condition2=>'1'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(219614265436986565)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(220322422060764871)
,p_validation_name=>'N_PATRIMONIO'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM SISPAT_INVENTARIO_BENS',
' WHERE NUMERO_CONTRATO = :P20_NUMERO_CONTRATO',
'   AND NUMERO_REGISTRO_PATRIMONIAL = :P20_NUMERO_REGISTRO_PATRIMONIAL',
unistr('   -- A linha abaixo \00E9 crucial para o modo de EDI\00C7\00C3O,'),
unistr('   -- para n\00E3o dar erro no pr\00F3prio registro que est\00E1 sendo editado.'),
'   AND (:P20_ID_CADASTRO_DE_BENS IS NULL OR ID_CADASTRO_DE_BENS != :P20_ID_CADASTRO_DE_BENS)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('O N\00FAmero de Registro Patrimonial informado j\00E1 existe para este contrato.')
,p_associated_item=>wwv_flow_imp.id(355545006390385497)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(355630653944755545)
,p_name=>unistr('Fun\00E7\00F5es de carregamento')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183883971231689302)
,p_event_id=>wwv_flow_imp.id(355630653944755545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Aplicar mascara monetario'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Fun\00E7\00E3o para aplicar m\00E1scara nos campos de valor monet\00E1rio'),
'(function() {',
'    function applyMoneyMask() {',
'        const moneyMask = (value) => {',
'            const numericValue = value.replace(/\D/g, ''''); ',
'            if (!numericValue) return ''''; ',
'            ',
'            const formattedValue = (numericValue / 100).toFixed(2).replace(".", ",");',
'            return `R$${formattedValue.replace(/(\d)(?=(\d{3})+(?!\d))/g, ''$1.'')}`;',
'        };',
'',
'        const applyMaskToField = (itemId) => {',
'            const item = apex.item(itemId);',
'            const input = item.node;',
'            const cursorPosition = input.selectionStart;',
'            const oldLength = input.value.length;',
'            const newValue = moneyMask(input.value);',
'            item.setValue(newValue);',
'            const newLength = newValue.length;',
'            input.setSelectionRange(cursorPosition + (newLength - oldLength), cursorPosition + (newLength - oldLength));',
'        };',
'',
'        const fields = [',
'            ''P20_VALOR_ORIGINAL_COMPRA'',',
'            ''P20_VALOR_JUSTO_MERCADO'',',
'            ''P20_VALOR_RESIDUAL'',',
'        ];',
'',
'        fields.forEach(itemId => {',
'            const item = apex.item(itemId);',
'            if (item) {',
'                item.node.addEventListener(''input'', () => applyMaskToField(itemId));',
'                applyMaskToField(itemId);',
'            }',
'        });',
'    }',
'',
'    if (document.readyState === ''loading'') {',
'        document.addEventListener(''DOMContentLoaded'', applyMoneyMask);',
'    } else {',
'        applyMoneyMask();',
'    }',
'})();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220321241592764859)
,p_event_id=>wwv_flow_imp.id(355630653944755545)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Aplicar mascara percentual'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Fun\00E7\00E3o para aplicar m\00E1scara nos campos de porcentagem com limite de 100,00% '),
'(function() {',
'    function applyMask() {',
'        const percentMask = (value) => {',
unistr('            // Remove s\00EDmbolo de porcentagem existente para processamento'),
'            let rawValue = value.replace(/%/g, '''');',
unistr('            const numericValue = Math.min(rawValue.replace(/\005CD/g, ''''), 100); // Limite m\00E1ximo de 100 = 100%'),
'            if (!numericValue) return '''';',
'            ',
unistr('            // Formata\00E7\00E3o com separador de milhar e casas decimais'),
'            const formattedValue = (numericValue).toFixed(0)',
'                .replace(".", ",")',
'                .replace(/(\d)(?=(\d{3})+(?!\d))/g, ''$1.'');',
'            ',
unistr('            return `${formattedValue}%`; // Adiciona o s\00EDmbolo de porcentagem no final'),
'        };',
'',
'        const applyMaskToField = (itemId) => {',
'            const item = apex.item(itemId);',
'            const input = item.node;',
'            const cursorPosition = input.selectionStart;',
'            ',
unistr('            // Mant\00E9m o cursor em posi\00E7\00E3o segura antes da formata\00E7\00E3o'),
'            const oldValue = input.value;',
'            const newValue = percentMask(oldValue);',
'            ',
unistr('            // Atualiza apenas se houver mudan\00E7a'),
'            if (newValue !== oldValue) {',
'                item.setValue(newValue);',
'                ',
unistr('                // Ajuste inteligente da posi\00E7\00E3o do cursor'),
'                const lengthDiff = newValue.length - oldValue.length;',
'                const newCursorPosition = Math.max(0, Math.min(',
'                    cursorPosition + lengthDiff,',
unistr('                    newValue.length - 1 // Mant\00E9m cursor antes do %'),
'                ));',
'                ',
'                input.setSelectionRange(newCursorPosition, newCursorPosition);',
'            }',
'        };',
'',
unistr('        // Lista de campos para aplicar a m\00E1scara'),
'        const fields_percent = [',
'            ''P20_TAXA_DEPRECIACAO''',
'        ];',
'',
'        fields_percent.forEach(itemId => {',
'            const item = apex.item(itemId);',
'            if (item) {',
unistr('                // Usamos ''keyup'' para melhor controle de edi\00E7\00E3o'),
'                item.node.addEventListener(''input'', () => applyMaskToField(itemId));',
'                ',
unistr('                // Inicializa a m\00E1scara'),
'                applyMaskToField(itemId);',
'                ',
unistr('                // Bloqueia digita\00E7\00E3o ap\00F3s o %'),
'                item.node.addEventListener(''keydown'', (e) => {',
'                    if (e.key === ''%'') e.preventDefault();',
'                });',
'            }',
'        });',
'    }',
'',
unistr('    // Inicializa\00E7\00E3o'),
'    if (document.readyState === ''loading'') {',
'        document.addEventListener(''DOMContentLoaded'', applyMask);',
'    } else {',
'        applyMask();',
'    }',
'})();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210433268632754475)
,p_name=>'SUBMITE_JS'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210433394096754476)
,p_event_id=>wwv_flow_imp.id(210433268632754475)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'setModifiedFields'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setModifiedFields();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210434556297754487)
,p_name=>'Cap/pos/subpos'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_CAP_POS_SUBPOS'
,p_condition_element=>'P20_CAP_POS_SUBPOS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220268082229721342)
,p_event_id=>wwv_flow_imp.id(210434556297754487)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_POSICAO,P20_ID_SUBPOSICAO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220268004610721341)
,p_event_id=>wwv_flow_imp.id(210434556297754487)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_POSICAO,P20_ID_SUBPOSICAO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(203587887543832578)
,p_name=>'Preencher Campos Separados'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_CAP_POS_SUBPOS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(203587987025832579)
,p_event_id=>wwv_flow_imp.id(203587887543832578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Set Value (para P20_ID_CAPITULO)'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_CAPITULO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'Number($v(''P20_CAP_POS_SUBPOS'').substring(0, 2))'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(203588255585832581)
,p_event_id=>wwv_flow_imp.id(203587887543832578)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Set Value (para P20_ID_POSICAO)'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_POSICAO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'Number($v(''P20_CAP_POS_SUBPOS'').substring(2, 4))'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(203588299000832582)
,p_event_id=>wwv_flow_imp.id(203587887543832578)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Set Value (para P20_ID_SUBPOSICAO)'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_SUBPOSICAO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Number($v(''P20_CAP_POS_SUBPOS'').substring(4, 6))',
''))
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(203752556799218878)
,p_name=>'Desabilitar Campos'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(203752617970218879)
,p_event_id=>wwv_flow_imp.id(203752556799218878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_POSICAO,P20_ID_SUBPOSICAO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208804752784941680)
,p_name=>unistr('Controla Posi\00E7\00E3o')
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_CAPITULO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208804786924941681)
,p_event_id=>wwv_flow_imp.id(208804752784941680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_POSICAO,P20_SUBPOSICAO,P20_ID_POSICAO,P20_ID_SUBPOSICAO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208804875114941682)
,p_event_id=>wwv_flow_imp.id(208804752784941680)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_POSICAO,P20_ID_POSICAO'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P20_CAPITULO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208805042025941683)
,p_event_id=>wwv_flow_imp.id(208804752784941680)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_POSICAO,P20_SUBPOSICAO,P20_ID_POSICAO,P20_ID_SUBPOSICAO'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P20_CAPITULO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208805166287941684)
,p_name=>unistr('Controla Subposi\00E7\00E3o')
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_POSICAO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208805208250941685)
,p_event_id=>wwv_flow_imp.id(208805166287941684)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUBPOSICAO,P20_ID_SUBPOSICAO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(208805312957941686)
,p_event_id=>wwv_flow_imp.id(208805166287941684)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUBPOSICAO,P20_ID_SUBPOSICAO'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P20_POSICAO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209604244202436837)
,p_event_id=>wwv_flow_imp.id(208805166287941684)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUBPOSICAO,P20_ID_SUBPOSICAO'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P20_POSICAO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209604879443436844)
,p_name=>unistr('Define ID do Cap\00EDtulo')
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_CAPITULO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209604972381436845)
,p_event_id=>wwv_flow_imp.id(209604879443436844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_CAPITULO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.item(this.triggeringElement).getValue()'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210410025092569041)
,p_event_id=>wwv_flow_imp.id(209604879443436844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_CAPITULO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.item(this.triggeringElement).getValue()'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(209673256018532283)
,p_name=>unistr('Define ID da Posi\00E7\00E3o')
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_POSICAO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(209673338928532284)
,p_event_id=>wwv_flow_imp.id(209673256018532283)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_POSICAO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.item(this.triggeringElement).getValue()'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210409638426569037)
,p_name=>unistr('Define ID da Subposi\00E7\00E3o')
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_SUBPOSICAO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210409699462569038)
,p_event_id=>wwv_flow_imp.id(210409638426569037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_SUBPOSICAO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.item(this.triggeringElement).getValue()'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(223556958360315239)
,p_name=>'MapClick'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(219733401384655838)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_COM.JK64.REPORT_GOOGLE_MAP_R1|REGION TYPE|mapclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(223557063189315240)
,p_event_id=>wwv_flow_imp.id(223556958360315239)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Atualiza os itens da p\00E1gina com a nova lat/lng do clique'),
'',
unistr('// Converte o campo espera v\00EDrgula como decimal'),
'let latFormatado = this.data.lat.toString().replace(''.'', '','');',
'let lngFormatado = this.data.lng.toString().replace(''.'', '','');',
'',
'apex.item("P20_LATITUDE").setValue(latFormatado);',
'apex.item("P20_LONGITUDE").setValue(lngFormatado);',
'apex.item("P20_LATITUDE_VIEW").setValue(latFormatado);',
'apex.item("P20_LONGITUDE_VIEW").setValue(lngFormatado);',
'',
'const element_map = "#map_mapa_bens";',
'',
'let markers = $(element_map).reportmap("instance").markers;',
'',
'if (markers) {',
'    for (var i = 0; i < markers.length; i++) {',
'        markers[i].setMap(null);',
'    }',
'    markers.delete;',
'}',
'',
'const map = this.data.map;',
'let position = { lat: this.data.lat, lng: this.data.lng }',
'',
'let marcador = new google.maps.Marker({',
'  position: position,',
'  map: map',
'});',
'',
'map.setCenter(position);',
'map.setZoom(10);',
'markers.push(marcador);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219614327052986566)
,p_name=>'Mostrar_Desc_Depreciacao_Especial'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_DEPRECIACAO_ESPECIAL'
,p_condition_element=>'P20_DEPRECIACAO_ESPECIAL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219614447152986567)
,p_event_id=>wwv_flow_imp.id(219614327052986566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_DESCRICAO_DEPRECIACAO_ESPECIAL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219614512981986568)
,p_event_id=>wwv_flow_imp.id(219614327052986566)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_DESCRICAO_DEPRECIACAO_ESPECIAL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(227355554611144949)
,p_name=>'Aprovar'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(227355381252144948)
,p_condition_element=>'P20_ID_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(227355584228144950)
,p_event_id=>wwv_flow_imp.id(227355554611144949)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_STATUS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'2'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(227355774861144952)
,p_name=>'Desincorporar'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(227355675736144951)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(227355942905144953)
,p_event_id=>wwv_flow_imp.id(227355774861144952)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_STATUS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'4'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(319547390976384183)
,p_name=>'Reencorporar'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(319546971540384179)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(319547517542384184)
,p_event_id=>wwv_flow_imp.id(319547390976384183)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_STATUS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'2'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(223558039926315250)
,p_name=>'LoadLatitudeDefaultContrato'
,p_event_sequence=>240
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(219733401384655838)
,p_condition_element=>'P20_LATITUDE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_required_patch=>wwv_flow_imp.id(355227788731364907)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(223558074460315251)
,p_event_id=>wwv_flow_imp.id(223558039926315250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_latitude varchar2(50);',
'begin',
'    select distinct latitude',
'      into v_latitude',
'      from VW_APEX_SISPAT_INVENTARIO_BENS',
'     where NUMERO_CONTRATO = :P20_NUMERO_CONTRATO;',
'',
unistr('    -- Atualiza o item de p\00E1gina'),
'    :p20_latitude := v_latitude;',
'    :p20_latitude_view := v_latitude;',
'exception',
'    when no_data_found then',
'        :p20_latitude := null;',
'        :p20_latitude_view := null;',
'    when too_many_rows then',
'        -- Se houver mais de uma latitude para o mesmo contrato, pega a primeira',
'        select min(latitude)',
'          into v_latitude',
'          from VW_APEX_SISPAT_INVENTARIO_BENS',
'         where NUMERO_CONTRATO = :P20_NUMERO_CONTRATO;',
'',
'        :p20_latitude := v_latitude;',
'        :p20_latitude_view := v_latitude;',
'end;'))
,p_attribute_03=>'P20_LATITUDE, P20_LATITUDE_VIEW'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(223558225233315252)
,p_name=>'LoadLongitudeDefaultContrato'
,p_event_sequence=>250
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(219733401384655838)
,p_condition_element=>'P20_LONGITUDE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
,p_required_patch=>wwv_flow_imp.id(355227788731364907)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(223558322707315253)
,p_event_id=>wwv_flow_imp.id(223558225233315252)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_longitude varchar2(50);',
'begin',
'    select distinct longitude',
'      into v_longitude',
'      from VW_APEX_SISPAT_INVENTARIO_BENS',
'     where NUMERO_CONTRATO = :P20_NUMERO_CONTRATO;',
'',
unistr('    -- Atualiza o item de p\00E1gina'),
'    :p20_longitude := v_longitude;',
'    :p20_longitude_view := v_longitude;',
'exception',
'    when no_data_found then',
'        :p20_longitude := null;',
'        :p20_longitude_view := null;',
'    when too_many_rows then',
'        -- Se houver mais de uma latitude para o mesmo contrato, pega a primeira',
'        select min(latitude)',
'          into v_longitude',
'          from VW_APEX_SISPAT_INVENTARIO_BENS',
'         where NUMERO_CONTRATO = :P20_NUMERO_CONTRATO;',
'',
'        :p20_longitude := v_longitude;',
'        :p20_longitude_view := v_longitude;',
'end;'))
,p_attribute_03=>'P20_LONGITUDE, P20_LONGITUDE_VIEW'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(186255924039524934)
,p_name=>unistr('Calcular Deprecia\00E7\00E3o Anual')
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_VALOR_ORIGINAL_COMPRA,P20_VALOR_RESIDUAL,P20_VIDA_UTIL,P20_TAXA_DEPRECIACAO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(186256063382524935)
,p_event_id=>wwv_flow_imp.id(186255924039524934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_DEPRECIACAO_ANUAL'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
unistr('    -- ... (suas vari\00E1veis de antes, sem altera\00E7\00E3o)'),
'    v_valor_original_str VARCHAR2(100);',
'    v_valor_residual_str VARCHAR2(100);',
'    v_vida_util_str      VARCHAR2(100);',
'    v_taxa_str           VARCHAR2(100);',
'    ',
'    v_valor_original    NUMBER;',
'    v_valor_residual    NUMBER;',
'    v_vida_util         NUMBER;',
'    v_taxa              NUMBER;',
'    ',
'    v_resultado         NUMBER; ',
'BEGIN',
unistr('    -- 1. LIMPEZA DOS INPUTS (sem altera\00E7\00E3o)'),
'    v_valor_original_str := REGEXP_REPLACE(:P20_VALOR_ORIGINAL_COMPRA, ''[^0-9,]'');',
'    v_valor_residual_str := REGEXP_REPLACE(:P20_VALOR_RESIDUAL, ''[^0-9,]'');',
'    v_vida_util_str      := REGEXP_REPLACE(:P20_VIDA_UTIL, ''[^0-9,]'');',
'    v_taxa_str           := REGEXP_REPLACE(:P20_TAXA_DEPRECIACAO, ''[^0-9,]'');',
'',
unistr('    -- 2. CONVERS\00C3O PARA N\00DAMERO (sem altera\00E7\00E3o)'),
'    v_valor_original := TO_NUMBER(v_valor_original_str, ''999999999999990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''''');',
'    v_valor_residual := TO_NUMBER(v_valor_residual_str, ''999999999999990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''''');',
'    v_vida_util      := TO_NUMBER(v_vida_util_str, ''999999999999990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''''');',
'    v_taxa           := TO_NUMBER(v_taxa_str, ''999999999999990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''''');',
'',
'',
unistr('    -- 3. VALIDA\00C7\00C3O (sem altera\00E7\00E3o)'),
'    IF v_vida_util IS NULL OR v_vida_util = 0 OR v_taxa IS NULL THEN',
'        RETURN NULL;',
'    END IF;',
'',
unistr('    -- 4. C\00C1LCULO (sem altera\00E7\00E3o)'),
'    v_resultado := ((v_valor_original - v_valor_residual) / v_vida_util) * (v_taxa / 100);',
'',
unistr('    -- 5. FORMATA\00C7\00C3O DA SA\00CDDA (A \00DANICA MUDAN\00C7A EST\00C1 AQUI)'),
unistr('    -- A m\00E1scara agora suporta n\00FAmeros muito maiores (at\00E9 999 trilh\00F5es)'),
'    RETURN TO_CHAR(',
'        v_resultado, ',
'        ''FML999G999G999G999G990D00'', ',
'        ''NLS_NUMERIC_CHARACTERS = '''',.'''' NLS_CURRENCY = ''''R$''''''',
'    );',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        RETURN NULL;',
'END;'))
,p_attribute_07=>'P20_VALOR_ORIGINAL_COMPRA,P20_VALOR_RESIDUAL,P20_VIDA_UTIL,P20_TAXA_DEPRECIACAO'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(248555896946483076)
,p_name=>unistr('Apenas N\00FAmeros')
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_VIDA_UTIL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'input'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(248555997127483077)
,p_event_id=>wwv_flow_imp.id(248555896946483076)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.triggeringElement.value = this.triggeringElement.value.replace(/\D/g,'''');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(321027361354277161)
,p_name=>unistr('Requisi\00E7\00E3o_desincorporar')
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219614833958986571)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(321027422964277162)
,p_event_id=>wwv_flow_imp.id(321027361354277161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_ID_STATUS'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'3'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(158227204883152644)
,p_name=>'Selecionar UF, Lat e Long'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_COD_TRIGRAMA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(158227843476152650)
,p_event_id=>wwv_flow_imp.id(158227204883152644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Verifica se o Porto est\00E1 vazio'),
'if ( $v("P20_COD_TRIGRAMA") === "" ) {',
'    // Limpa Lat, Long e View',
'    apex.item("P20_LATITUDE").setValue("");',
'    apex.item("P20_LONGITUDE").setValue("");',
'    apex.item("P20_LATITUDE_VIEW").setValue("");',
'    apex.item("P20_LONGITUDE_VIEW").setValue("");',
'',
'    // Limpa o Mapa (Plugin)',
'    var mapRegion = "#map_mapa_bens"; // Confirme seu Static ID',
'    var p = $(mapRegion).reportmap("instance");',
'    if (p && p.markers) {',
'        for (var i = 0; i < p.markers.length; i++) { p.markers[i].setMap(null); }',
'        p.markers = [];',
'    }',
'',
unistr('    // CRUCIAL: Cancela o resto das a\00E7\00F5es (n\00E3o roda o PL/SQL)'),
'    apex.da.cancelEvent.call(this); ',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(158227356452152645)
,p_event_id=>wwv_flow_imp.id(158227204883152644)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_lat NUMBER;',
'    v_lon NUMBER;',
'    v_uf  VARCHAR2(10);',
'BEGIN',
unistr('    -- Busca os dados cruzando as tabelas com higieniza\00E7\00E3o de string'),
'    SELECT ',
'        sit.GEO_LATITUDE,',
'        sit.GEO_LONGITUDE,',
'        sit.COD_UF',
'    INTO ',
'        v_lat,',
'        v_lon,',
'        v_uf',
'    FROM WKSP_SFCDEV.SITPORTOS_PORTOS sit',
'    JOIN WKSP_SFCDEV.TB_PORTOS tb ',
unistr('      ON REGEXP_REPLACE(UPPER(TRANSLATE(tb.NOME_PORTO, ''\00E1\00E9\00ED\00F3\00FA\00E0\00E8\00EC\00F2\00F9\00E3\00F5\00E2\00EA\00EE\00F4\00FB\00E4\00EB\00EF\00F6\00FC\00E7\00C1\00C9\00CD\00D3\00DA\00C0\00C8\00CC\00D2\00D9\00C3\00D5\00C2\00CA\00CE\00D4\00DB\00C4\00CB\00CF\00D6\00DC\00C7'', ''aeiouaeiouaoaeiouaeioucAEIOUAEIOUAOAEIOUAEIOUC'')), ''[^A-Z0-9]'', '''') '),
unistr('       = REGEXP_REPLACE(UPPER(TRANSLATE(sit.NOME_PORTO, ''\00E1\00E9\00ED\00F3\00FA\00E0\00E8\00EC\00F2\00F9\00E3\00F5\00E2\00EA\00EE\00F4\00FB\00E4\00EB\00EF\00F6\00FC\00E7\00C1\00C9\00CD\00D3\00DA\00C0\00C8\00CC\00D2\00D9\00C3\00D5\00C2\00CA\00CE\00D4\00DB\00C4\00CB\00CF\00D6\00DC\00C7'', ''aeiouaeiouaoaeiouaeioucAEIOUAEIOUAOAEIOUAEIOUC'')), ''[^A-Z0-9]'', '''')'),
'    WHERE tb.COD_TRIGRAMA = :P20_COD_TRIGRAMA',
'    FETCH FIRST 1 ROWS ONLY;',
'',
'    -- Se achou, preenche tudo (Lat, Long e a UF correta do porto)',
'    :P20_LATITUDE       := v_lat;',
'    :P20_LONGITUDE      := v_lon;',
'    :P20_SIGLA_UF       := v_uf; ',
'',
unistr('    -- Formata\00E7\00E3o visual (ponto decimal)'),
'    :P20_LATITUDE_VIEW  := REPLACE(TO_CHAR(v_lat), '','', ''.'');',
'    :P20_LONGITUDE_VIEW := REPLACE(TO_CHAR(v_lon), '','', ''.'');',
'',
'EXCEPTION ',
'    WHEN NO_DATA_FOUND THEN',
unistr('        -- Se n\00E3o achou na tabela de coordenadas, mantemos o que o usu\00E1rio fez.'),
unistr('        -- IMPORTANTE: Ao n\00E3o atribuir valor a :P20_SIGLA_UF aqui,'),
unistr('        -- o APEX n\00E3o sobrescreve o campo na tela com NULL.'),
'        :P20_LATITUDE       := NULL;',
'        :P20_LONGITUDE      := NULL;',
'        :P20_LATITUDE_VIEW  := NULL;',
'        :P20_LONGITUDE_VIEW := NULL;',
'END;'))
,p_attribute_02=>'P20_COD_TRIGRAMA'
,p_attribute_03=>'P20_SIGLA_UF, P20_LATITUDE, P20_LONGITUDE, P20_LATITUDE_VIEW, P20_LONGITUDE_VIEW'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P20_COD_TRIGRAMA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183883881617689301)
,p_event_id=>wwv_flow_imp.id(158227204883152644)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var lat = $v("P20_LATITUDE_VIEW");',
'var lng = $v("P20_LONGITUDE_VIEW");',
'var mapId = "#map_mapa_bens"; // Seu Static ID',
'',
'if (lat && lng) {',
'    var p = $(mapId).reportmap("instance");',
unistr('    if (!p) return; // Seguran\00E7a caso o mapa n\00E3o tenha carregado'),
'',
'    // Limpa anteriores',
'    if (p.markers) {',
'        for (var i = 0; i < p.markers.length; i++) { p.markers[i].setMap(null); }',
'        p.markers = [];',
'    }',
'',
'    // Cria novo marcador',
'    var myLatlng = new google.maps.LatLng(parseFloat(lat), parseFloat(lng));',
'    var marker = new google.maps.Marker({',
'        position: myLatlng,',
'        map: p.map,',
'        animation: google.maps.Animation.DROP',
'    });',
'',
'    p.markers.push(marker);',
'    p.map.setCenter(myLatlng);',
'    p.map.setZoom(14); // Zoom aplicado',
'}'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(355568840122385521)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(355540739347385488)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Processar o form Cadastrar Bens'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>159206071575163384
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(210433510561754477)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT_LOG'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    WKSP_SFCDEV.SP_INSERT_LOG(',
unistr('        p_table_name => ''SISPAT_INVENTARIO_BENS'',      -- O nome da tabela principal da p\00E1gina'),
unistr('        p_id_key     => :P20_ID_CADASTRO_DE_BENS,   -- O item que guarda a chave prim\00E1ria'),
unistr('        p_log_json   => :P20_LOG_ALTERACOES        -- O item com o JSON das altera\00E7\00F5es'),
'    );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14070742014532340
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(225074649917869777)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Arquivo imagem'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
unistr('    -- Verifica se o item de upload de arquivo n\00E3o est\00E1 nulo.'),
unistr('    -- Isso garante que a exclus\00E3o s\00F3 ocorra se novos arquivos forem enviados.'),
'    IF :P20_ARQUIVOS IS NOT NULL THEN',
'        WKSP_SFCDEV.P_PROCESSA_ANEXOS_APEX(',
'            p_item_files_value => :P20_ARQUIVOS,',
'            p_table_name       => ''SISPAT_INVENTARIO_BENS'',',
'            p_id_key           => :P20_ID_CADASTRO_DE_BENS',
'        );',
'        ',
'    END IF;',
'END;',
'',
unistr('-- A limpeza manual no final continua sendo uma boa pr\00E1tica para garantir.'),
':P20_ARQUIVOS := NULL;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>62272682078745241
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(355569186191385522)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>unistr('Fechar Caixa de Di\00E1logo')
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,EDITAR,DELETE,APROVAR,DESINCORPORAR,DESINCORPORAR_BEM,REENCORPORAR'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>159206417644163385
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(355568391143385521)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(355540739347385488)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Inicializar o form Cadastrar Bens'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>159205622596163384
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(228331781236485659)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(228331767449485658)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Cadastrar Bens'
,p_internal_uid=>65529813397361123
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(220321108097764858)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Ajustar Campos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P20_NUM_CNPJ := TO_NUMBER(REGEXP_REPLACE(:P20_NUM_CNPJ, ''[^0-9]'', ''''));',
'   ',
'    ',
unistr('    -- Extrair apenas a parte num\00E9rica de P20_TAXA_DEPRECIACAO e converter para n\00FAmero'),
'    IF :P20_TAXA_DEPRECIACAO IS NOT NULL THEN',
'        BEGIN',
'            :P20_TAXA_DEPRECIACAO := TO_NUMBER(REGEXP_REPLACE(:P20_TAXA_DEPRECIACAO, ''[^0-9]'', ''''));',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                DBMS_OUTPUT.PUT_LINE(''Erro ao converter P20_TAXA_DEPRECIACAO: '' || SQLERRM);',
'        END;',
'    END IF;',
'',
'    IF :P20_NUMERO_CONTRATO IS NULL THEN ',
'        BEGIN',
'            :P20_NUMERO_CONTRATO := ''Sem Contrato'';',
'        END;',
'    END IF;',
'',
'    ',
'',
unistr('    -- Este c\00F3digo s\00F3 executa se lat/long existirem'),
'    /*',
'    IF :P20_LATITUDE IS NOT NULL AND :P20_LONGITUDE IS NOT NULL THEN',
'    ',
'        UPDATE SISPAT_INVENTARIO_BENS',
'        SET GEO_LOCATION = SDO_GEOMETRY(',
'                                2001, -- 2001 = Ponto 2D',
unistr('                                4326, -- SRID 4326 = Padr\00E3o WGS84 para coordenadas geogr\00E1ficas'),
unistr('                                SDO_POINT_TYPE(:P20_LONGITUDE, :P20_LATITUDE, NULL), -- IMPORTANTE: A ordem \00E9 (Longitude, Latitude)'),
'                                NULL,',
'                                NULL',
'                            )',
'        WHERE ID_CADASTRO_DE_BENS = :P20_ID_CADASTRO_DE_BENS;',
'    END IF;',
'    */',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>57519140258640322
);
wwv_flow_imp.component_end;
end;
/
