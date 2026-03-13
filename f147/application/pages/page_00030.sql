prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'Gerenciador de API'
,p_alias=>'GERENCIADOR-DE-API'
,p_step_title=>'Gerenciador de API'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Garante que o texto de sucesso/perigo mantenha a cor mesmo na linha selecionada */',
'#IG_API .a-GV-row.is-selected .u-success-text {',
'    color: var(--u-success-text-color) !important;',
'}',
'#IG_API .a-GV-row.is-selected .u-danger-text {',
'    color: var(--u-danger-text-color) !important;',
'}',
'',
unistr('/* Garante que o Link (Bot\00E3o Visualizar) mantenha a cor */'),
'#IG_API .a-GV-row.is-selected a {',
'    color: inherit !important; /* Ou force uma cor: color: #005a9c !important; */',
'}',
'',
unistr('/* (Opcional) Remove o fundo azulz\00E3o da sele\00E7\00E3o apenas nessa grid, deixando mais sutil */'),
'#IG_API .a-GV-row.is-selected .a-GV-cell {',
'    background-color: #f0f6fc !important; /* Um azul bem clarinho */',
'    color: #000 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(319539811813455568)
,p_plug_name=>'Breadcrumb'
,p_title=>'Chaves de API'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(355228427769364912)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(319544800417384157)
,p_plug_name=>'API criadas'
,p_title=>'Suas API'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(319545956203384168)
,p_plug_name=>'API'
,p_title=>'Minhas Chaves de API'
,p_region_name=>'IG_API'
,p_parent_plug_id=>wwv_flow_imp.id(319544800417384157)
,p_region_css_classes=>'t-Report--noBorders t-Report--rowHighlight t-Report--stretch'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    K.ID_KEY,                       -- Nova Primary Key (era ID)',
unistr('    K.ID_ASSOCIACAO,                -- Coluna de v\00EDnculo (importante para processamento)'),
'    R.ID_REPRESENTANTE,             -- Obtido via JOIN',
unistr('    WKSP_SFCDEV.formatar_cnpj(RE.NUM_CNPJ) AS NUM_CNPJ, -- Obtido da tabela de v\00EDnculo (RE)'),
'    K.KEY_NAME,',
'    K.ACTIVE_IND,',
'',
unistr('    -- Data de cria\00E7\00E3o'),
'    TO_CHAR(K.CREATED_AT, ''DD/MM/YYYY'') AS CREATED_AT,',
'',
'    -- Coluna 1: A chave real (oculta)',
'    K.API_KEY AS API_KEY_REAL, ',
'    ',
unistr('    -- Coluna 2: M\00E1scara visual'),
'    SUBSTR(K.API_KEY, 1, 12) || ''********************'' AS API_KEY_VISUAL,',
'',
unistr('    -- Bot\00E3o'),
'    ''Ver / Copiar'' AS LINK_COPIAR',
'',
'FROM SISPAT_API_KEYS K',
unistr('-- 1. Junta com a tabela de v\00EDnculo para pegar o CNPJ e o ID do Representante'),
'JOIN SISPAT_REPRESENTANTE_EMPRESA RE ',
'    ON K.ID_ASSOCIACAO = RE.ID_ASSOCIACAO',
unistr('-- 2. Junta com a tabela de representante para validar o E-mail do usu\00E1rio'),
'JOIN SISPAT_REPRESENTANTE R ',
'    ON RE.ID_REPRESENTANTE = R.ID_REPRESENTANTE',
'WHERE INSTR(R.EMAIL, LOWER(:APP_USER)) > 0;'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Minhas Chaves de API'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(158226460166152636)
,p_name=>'ID_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_KEY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(158226555669152637)
,p_name=>'ID_ASSOCIACAO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ASSOCIACAO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(188628947036541423)
,p_name=>'NUM_CNPJ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NUM_CNPJ'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'CNPJ'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304654961468118578)
,p_name=>'KEY_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'KEY_NAME'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nome da Chave'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304655153208118580)
,p_name=>'ID_REPRESENTANTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_REPRESENTANTE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304655481450118584)
,p_name=>'API_KEY_REAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'API_KEY_REAL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304655651901118585)
,p_name=>'API_KEY_VISUAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'API_KEY_VISUAL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Chave de API'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304655705795118586)
,p_name=>'LINK_COPIAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK_COPIAR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Visualizar'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_API_KEY,P31_ID_KEY,P31_ACTIVE_IND:&API_KEY_REAL.,&ID_KEY.,&ACTIVE_IND.'
,p_link_text=>'<span class="fa fa-eye" aria-hidden="true"></span> Visualizar'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(319546820335384177)
,p_name=>'CREATED_AT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_AT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Criado em'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<span class="u-item-badge">',
    '    <span class="fa fa-calendar"></span> &CREATED_AT.',
    '</span>',
    '',
    '')))).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(321025366328277141)
,p_name=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE_IND'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'col-status-toggle'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{if ACTIVE_IND/}',
    '    <span class="js-acao-status" style="cursor: pointer; font-weight: bold; display: inline-block; width: 100%; color: var(--ut-palette-success) !important;">',
    '        <span class="fa fa-check-circle"></span> Ativo',
    '    </span>',
    '{else/}',
    '    <span class="js-acao-status" style="cursor: pointer; font-weight: bold; display: inline-block; width: 100%; color: var(--ut-palette-danger) !important;">',
    '        <span class="fa fa-times-circle"></span> Inativo',
    '    </span>',
    '{endif/}')))).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(304654582821118575)
,p_internal_uid=>141852614981994039
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(321013044269289936)
,p_interactive_grid_id=>wwv_flow_imp.id(304654582821118575)
,p_static_id=>'1582111'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(321013217271289934)
,p_report_id=>wwv_flow_imp.id(321013044269289936)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171151151184604475)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(158226460166152636)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(171152031328604469)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(158226555669152637)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(188786281816540989)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(188628947036541423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321014543190289922)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(304654961468118578)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321015430425289920)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(304655153208118580)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321018994147289910)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(304655481450118584)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321019952354289908)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(304655651901118585)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321020849116289905)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(304655705795118586)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321077681871234223)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(321025366328277141)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(321936086929721087)
,p_view_id=>wwv_flow_imp.id(321013217271289934)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(319546820335384177)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(163781264470683715)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(319539811813455568)
,p_button_name=>'Manual_API'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--hoverIconPush'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Manual da API'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-book'
,p_button_cattributes=>'target="_blank"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(319543123997384140)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(319539811813455568)
,p_button_name=>'Gerar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--gapLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Gerar Chave de API'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:32::'
,p_icon_css_classes=>'fa-key'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304654458024118573)
,p_name=>'Atualizar'
,p_event_sequence=>20
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304654522137118574)
,p_event_id=>wwv_flow_imp.id(304654458024118573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(319545956203384168)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(321025437050277142)
,p_name=>'Alternar Status API'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.js-acao-status'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(355227788731364907)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(321025472313277143)
,p_event_id=>wwv_flow_imp.id(321025437050277142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var regionId = "IG_API"; // Seu Static ID',
'var widget = apex.region(regionId).widget();',
'var grid = widget.interactiveGrid("getViews", "grid");',
'var model = grid.model;',
'',
'// Pega o elemento clicado',
'var $element = $(this.triggeringElement); ',
'var $tr = $element.closest("tr"); ',
'var recordId = grid.view$.grid("getRecordId", $tr);',
'var record = model.getRecord(recordId);',
'',
unistr('// L\00F3gica de invers\00E3o'),
'var valorAtual = model.getValue(record, "ACTIVE_IND");',
'',
'// Tratamento para garantir que Y/N ou S/N funcione',
'var novoValor = (valorAtual === ''Y'' || valorAtual === ''S'') ? ''N'' : ''Y''; ',
'',
unistr('// Atualiza o modelo (Isso for\00E7a o Grid a renderizar o HTML Expression de novo)'),
'model.setValue(record, "ACTIVE_IND", novoValor);',
'',
'// Salva imediatamente',
'apex.region(regionId).widget().interactiveGrid("getActions").invoke("save");'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(160601411429382146)
,p_name=>'Guia_API'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(163781264470683715)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(160601598606382147)
,p_event_id=>wwv_flow_imp.id(160601411429382146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.open(''https://antaq.github.io/sispat-api/'', ''_blank'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(192982495755197430)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Fechar Modal'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>192982495755197430
);
wwv_flow_imp.component_end;
end;
/
