prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Grupos Patrimoniais'
,p_alias=>'HOME'
,p_step_title=>'Grupos Patrimoniais'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/* Estilo geral para alinhar o conte\00FAdo dentro do card do APEX */'),
'.a-Card-body {',
'    height: 100%;',
'}',
'',
'.custom-card-wrapper {',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: space-between;',
'    height: 100%;',
'    padding: 4px;',
'}',
'',
unistr('/* Estilo para o t\00EDtulo e subt\00EDtulo */'),
'.card-main-content {',
'    margin-bottom: 16px;',
'}',
'',
'.card-title {',
'    font-size: 16px;',
'    font-weight: bold;',
'    color: #404040;',
'    margin-bottom: 2px;',
unistr('    white-space: normal; /* Permite que o t\00EDtulo quebre a linha */'),
'}',
'',
'.card-subtitle {',
'    font-size: 14px;',
'    color: #707070;',
'}',
'',
unistr('/* Container para as linhas de informa\00E7\00E3o */'),
'.card-info-body {',
'    display: flex;',
'    flex-direction: column;',
unistr('    gap: 8px; /* Espa\00E7o entre as linhas de informa\00E7\00E3o */'),
'}',
'',
'/* Estilo para cada linha (ex: "Itens: 1550") */',
'.info-line {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    font-size: 14px;',
'}',
'',
'.info-label {',
'    color: #606060;',
'}',
'',
'/* Classe para deixar o valor do item em AZUL e em negrito */',
'.info-value-blue {',
'    font-weight: bold;',
'    font-size: 16px;',
unistr('    color: #0d6acb; /* Um tom de azul padr\00E3o do APEX */'),
'    padding: 2px 6px;',
'    background-color: #f0f6fc;',
'    border-radius: 4px;',
'}',
'',
'',
'.info-value-gray {',
'    font-weight: bold;',
'    font-size: 16px;',
'    color: #707070; ',
'    padding: 2px 6px;',
'    background-color: #f0f6fc;',
'    border-radius: 4px;',
'}',
'',
'',
'.info-value {',
'    color: #303030;',
'    font-weight: 500;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(343841962899197884)
,p_plug_name=>'Resultados da Pesquisa'
,p_region_name=>'resultados_pesquisa'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NUM_CNPJ_EMPRESA,',
'    NUM_CNPJ_EMPRESA_FORMATADO,',
'    TO_CHAR(COUNT(DISTINCT NUMERO_CONTRATO), ''999G999G999G990'') AS CONTRATOS,     ',
'    MAX(NOME_PORTO) AS NOME_PORTO,',
'    MAX(SIGLA_UF) AS SIGLA_UF,',
'    CASE ',
'        WHEN MAX(DESC_RAZAO_SOCIAL) IS NULL ',
unistr('            THEN ''Sem identifica\00E7\00E3o'''),
'        ELSE MAX(DESC_RAZAO_SOCIAL)',
'    END AS EMPRESA,',
'    MAX(MODALIDADE_EXPLORACAO) AS MODALIDADE_EXPLORACAO,',
'    TO_CHAR(COUNT(DISTINCT ID_CADASTRO_DE_BENS), ''999G999G999G990'') AS QTD_ITENS',
'FROM',
'    VW_APEX_SISPAT_INVENTARIO_BENS',
'WHERE',
'    NUM_CNPJ_EMPRESA IS NOT NULL',
'    AND ID_STATUS IN (2, 3)',
'    AND INSTR(EMAILS, TRIM(LOWER(APEX_CUSTOM_AUTH.GET_USERNAME))) > 0',
'GROUP BY',
'    NUM_CNPJ_EMPRESA_FORMATADO,',
'    NUM_CNPJ_EMPRESA',
'ORDER BY',
'    EMPRESA;',
''))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(343842062148197885)
,p_region_id=>wwv_flow_imp.id(343841962899197884)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="custom-card-wrapper">',
'    <div class="card-main-content">',
'        <div class="card-title">&EMPRESA. </div>',
'        <div class="card-subtitle">CNPJ: &NUM_CNPJ_EMPRESA_FORMATADO.</div>',
'        <div class="card-subtitle">UF: &SIGLA_UF. </div>',
'        <div class="card-subtitle">Porto: &NOME_PORTO.</div>',
'    </div>',
'</div>'))
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('    <!-- Se\00E7\00E3o de Informa\00E7\00F5es Adicionais -->'),
'    <div class="card-info-body">',
'        <div class="info-line">',
'            <span class="info-label">Contratos Vinculados:</span>',
'            <span class="info-value-gray">&CONTRATOS.</span>            ',
'        </div>',
'        <div class="info-line">',
'            <span class="info-label">Itens cadastrados:</span>',
'            <!-- O valor da contagem, em negrito e com a classe para a cor azul -->',
'            <span class="info-value-blue">&QTD_ITENS.</span>',
'        </div>',
'',
'        <div class="info-line">',
unistr('            <span class="info-label">Modalidade de explora\00E7\00E3o:</span>'),
'            <span class="info-value">&MODALIDADE_EXPLORACAO.</span>            ',
'        </div>',
'        ',
'    </div>'))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(343842264532197887)
,p_card_id=>wwv_flow_imp.id(343842062148197885)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:1,5:P5_NUM_CNPJ_EMPRESA:&NUM_CNPJ_EMPRESA.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(529393269022542082)
,p_plug_name=>'Breadcrumb'
,p_title=>'Grupos Patrimoniais'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(355228427769364912)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(160600535513382137)
,p_plug_name=>unistr('Barra de A\00E7\00F5es')
,p_title=>unistr('Barra de A\00E7\00F5es')
,p_parent_plug_id=>wwv_flow_imp.id(529393269022542082)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>1569994581593435632
,p_plug_display_sequence=>20
,p_plug_display_point=>'SMART_FILTERS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(219611850323986541)
,p_plug_name=>'Filtros'
,p_title=>'Filtros'
,p_parent_plug_id=>wwv_flow_imp.id(160600535513382137)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(343841962899197884)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(370758721366782341)
,p_plug_name=>unistr('Caixas de informa\00E7\00F5es')
,p_parent_plug_id=>wwv_flow_imp.id(529393269022542082)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc:t-CardsRegion--styleA'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SMART_FILTERS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DADOS_FILTRADOS AS (',
'    SELECT',
'        NUMERO_CONTRATO,',
'        NUM_CNPJ_EMPRESA,',
'        NOME_PORTO,',
'        SIGLA_UF,',
'        ID_MODALIDADE_EXPLORACAO',
'    FROM VW_APEX_SISPAT_INVENTARIO_BENS',
'    WHERE',
'        NUM_CNPJ_EMPRESA IS NOT NULL',
'        AND (ID_STATUS = 2 OR ID_STATUS = 3)',
'        AND INSTR(EMAILS, TRIM(LOWER(APEX_CUSTOM_AUTH.GET_USERNAME))) > 0',
')',
'SELECT',
unistr('    ''Empresas e Autoridades Portu\00E1rias com Invent\00E1rio Enviado'' AS TITLE,'),
'    TO_CHAR(COUNT(DISTINCT NUM_CNPJ_EMPRESA), ''999G999G999G990'') AS TOTAL, ',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/NContrato.png'' AS ICON,',
'    1 AS SL',
'FROM DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    ''Contratos Distintos'' AS TITLE,',
'    TO_CHAR(COUNT(DISTINCT NUMERO_CONTRATO), ''999G999G999G990'') AS TOTAL, ',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Aut-port.png'' AS ICON,',
'    2 AS SL',
'FROM DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
unistr('    ''N\00BA de Portos'' AS TITLE,'),
'    TO_CHAR(COUNT(DISTINCT NOME_PORTO), ''999G999G999G990'') AS TOTAL,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nportos.png'' AS ICON,',
'    3 AS SL',
'FROM DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
unistr('    ''N\00BA de UFs'' AS TITLE,'),
'    TO_CHAR(COUNT(DISTINCT SIGLA_UF), ''999G999G999G990'') AS TOTAL,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nufs.png'' AS ICON,',
'    4 AS SL',
'FROM DADOS_FILTRADOS;'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P1_MODALIDADE_EXPLORACAO'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(370758826170782342)
,p_region_id=>wwv_flow_imp.id(370758721366782341)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TOTAL'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TITLE'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'URL'
,p_icon_image_url=>'&ICON.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'SL'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(210410359124569044)
,p_card_id=>wwv_flow_imp.id(370758826170782342)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(163296631540215535)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(160600535513382137)
,p_button_name=>'Manual'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>unistr('Manual de Contas da Autoridade Portu\00E1ria')
,p_button_position=>'BUTTON_END'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-book'
,p_button_cattributes=>'target="_blank"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(163296921096213909)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(160600535513382137)
,p_button_name=>'Manual_1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>unistr('Manual de An\00E1lise de Invent\00E1rio')
,p_button_position=>'BUTTON_END'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-book'
,p_button_cattributes=>'target="_blank"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(319546905792384178)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(529393269022542082)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--stretch:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Novo Bem'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219611872988986542)
,p_name=>'P1_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(219611850323986541)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(321027139927277159)
,p_name=>'Atualizar'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(321027255950277160)
,p_event_id=>wwv_flow_imp.id(321027139927277159)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(343841962899197884)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(192980389197197409)
,p_name=>'Atualizar_1'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(370758721366782341)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(192980531834197411)
,p_event_id=>wwv_flow_imp.id(192980389197197409)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(370758721366782341)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(160601000062382142)
,p_name=>'Manual'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(163296631540215535)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(160601176257382143)
,p_event_id=>wwv_flow_imp.id(160601000062382142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.open(''https://www.gov.br/antaq/pt-br/assuntos/instalacoes-portuarias/ManualdeContasdaAutoridadePorturia_versao2017_Compilada.pdf'', ''_blank'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(160601219733382144)
,p_name=>'Manual_1'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(163296921096213909)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(160601312367382145)
,p_event_id=>wwv_flow_imp.id(160601219733382144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.open(''https://wiki.antaq.gov.br/pt/manual-inventario-de-bens'', ''_blank'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(188630162012541435)
,p_name=>'Ao fechar Modal Dialog'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(319546905792384178)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(188630254224541436)
,p_event_id=>wwv_flow_imp.id(188630162012541435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Substitua o alert por isso:',
'apex.region("resultados_pesquisa").refresh();'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(192979564328197401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>192979564328197401
);
wwv_flow_imp.component_end;
end;
/
