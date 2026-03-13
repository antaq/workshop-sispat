prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Contratos'
,p_alias=>'CONTRATOS'
,p_step_title=>'Contratos'
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
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(321026665525277154)
,p_plug_name=>'Breadcrumb'
,p_title=>'Contratos'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
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
 p_id=>wwv_flow_imp.id(346254770436474955)
,p_plug_name=>unistr('Caixas de Informa\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(321026665525277154)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc:t-CardsRegion--styleA'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SMART_FILTERS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DADOS_FILTRADOS AS (',
'    SELECT',
'        NUM_CNPJ_EMPRESA,',
'        NUM_CNPJ_EMPRESA_FORMATADO,',
'        TO_CHAR(COUNT(DISTINCT NUMERO_CONTRATO), ''999G999G999G990'') AS CONTRATOS,',
'        MAX(NOME_PORTO) AS NOME_PORTO,',
'        MAX(SIGLA_UF) AS SIGLA_UF,',
'    CASE ',
'        WHEN MAX(DESC_RAZAO_SOCIAL) IS NULL ',
unistr('            THEN ''Sem Identifica\00E7\00E3o'''),
'        ELSE MAX(DESC_RAZAO_SOCIAL)',
'    END AS EMPRESA,',
'        MAX(MODALIDADE_EXPLORACAO) AS MODALIDADE_EXPLORACAO,',
'        TO_CHAR(COUNT(DISTINCT ID_CADASTRO_DE_BENS), ''999G999G999G990'')  AS QTD_ITENS',
'    FROM VW_APEX_SISPAT_INVENTARIO_BENS',
'    WHERE ',
'       NUM_CNPJ_EMPRESA = :P5_NUM_CNPJ_EMPRESA ',
'       AND (ID_STATUS = 1 OR ID_STATUS = 2 OR ID_STATUS = 3)',
'    GROUP BY',
'        NUM_CNPJ_EMPRESA,',
'        NUM_CNPJ_EMPRESA_FORMATADO',
')',
'',
'SELECT',
'    1 AS SL,',
'    NUM_CNPJ_EMPRESA_FORMATADO AS CARD_VALUE,',
'    EMPRESA AS CARD_TITLE,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/NContrato.png'' AS CARD_ICON',
'FROM',
'    DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    2 AS SL,',
'    ''Contratos Distintos'' AS CARD_VALUE,',
'    CONTRATOS AS CARD_TITLE,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Aut-port.png'' AS CARD_ICON',
'FROM',
'    DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    3 AS SL,',
unistr('    ''N\00BA de Itens'' AS CARD_VALUE,'),
unistr('    QTD_ITENS AS CARD_TITLE, -- Formata o n\00FAmero para melhor leitura'),
unistr('    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nitens.png'' AS CARD_ICON -- \00CDcone do Font APEX. Voc\00EA pode trocar.'),
'',
'FROM',
'    DADOS_FILTRADOS',
'',
'',
'UNION ALL',
'',
'SELECT',
'    4 AS SL,',
'    ''Porto'' AS CARD_VALUE,',
'    NOME_PORTO AS CARD_TITLE,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nportos.png'' AS CARD_ICON',
'FROM',
'    DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    5 AS SL,',
'    ''UF'' AS CARD_VALUE,',
unistr('    SIGLA_UF AS CARD_TITLE, -- Formata o n\00FAmero para melhor leitura'),
unistr('    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nufs.png'' AS CARD_ICON -- \00CDcone do Font APEX. Voc\00EA pode trocar.'),
'',
'FROM',
'    DADOS_FILTRADOS'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(322351616838975673)
,p_region_id=>wwv_flow_imp.id(346254770436474955)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_VALUE'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'URL'
,p_icon_image_url=>'&CARD_ICON.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'SL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(379157097595837734)
,p_plug_name=>unistr('Barra de A\00E7\00F5es')
,p_title=>unistr('Barra de A\00E7\00F5es')
,p_parent_plug_id=>wwv_flow_imp.id(321026665525277154)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>1569994581593435632
,p_plug_display_sequence=>20
,p_plug_display_point=>'SMART_FILTERS'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(379155435828837717)
,p_plug_name=>'Filtros'
,p_title=>'Filtros'
,p_parent_plug_id=>wwv_flow_imp.id(379157097595837734)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(363292587189070019)
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(363292587189070019)
,p_plug_name=>'Contratos'
,p_region_css_classes=>'cards-layout-mestre'
,p_icon_css_classes=>'fa-cubes'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    MAX(t.MODALIDADE_EXPLORACAO) AS MODALIDADE_EXPLORACAO,',
'    MAX(t.ID_MODALIDADE_EXPLORACAO) AS ID_MODALIDADE_EXPLORACAO,',
'    TO_CHAR(COUNT(DISTINCT ID_CADASTRO_DE_BENS),''999G999G990'') AS QUANTIDADE_TOTAL,',
'    MAX(t.NOME_PORTO) AS PORTO, ',
'    t.NUMERO_CONTRATO AS NUMERO_CONTRATO, ',
'    MAX(t.SIGLA_UF) AS SIGLA_UF,',
'    MAX(NUM_CNPJ_EMPRESA) AS NUM_CNPJ_EMPRESA',
'FROM',
'    VW_APEX_SISPAT_INVENTARIO_BENS t',
'WHERE ',
'    NUM_CNPJ_EMPRESA = :P5_NUM_CNPJ_EMPRESA',
'    AND ID_STATUS IN (2, 3)',
'GROUP BY',
'    t.NUMERO_CONTRATO',
'ORDER BY',
'    NUMERO_CONTRATO DESC,',
'    COUNT(DISTINCT ID_CADASTRO_DE_BENS) DESC'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(322348853907975681)
,p_region_id=>wwv_flow_imp.id(363292587189070019)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="custom-card-wrapper">',
unistr('    <!-- Se\00E7\00E3o do T\00EDtulo e Subt\00EDtulo -->'),
'    <div class="card-main-content">',
'        <div class="card-title">&NUMERO_CONTRATO. </div>',
'    </div>',
'    <!-- Linha para a Quantidade -->',
'    <div class="info-line">',
'        <span class="info-label">Itens cadastrados:</span>',
'        <span class="info-value-blue">&QUANTIDADE_TOTAL.</span>',
'    </div>',
'</div>',
'',
''))
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(322349317554975677)
,p_card_id=>wwv_flow_imp.id(322348853907975681)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:CR,10:P10_NUMERO_CONTRATO,P10_NUM_CNPJ_EMPRESA:&NUMERO_CONTRATO.,&NUM_CNPJ_EMPRESA.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(322348014272975685)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(379157097595837734)
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
 p_id=>wwv_flow_imp.id(322347612538975685)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(379157097595837734)
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
 p_id=>wwv_flow_imp.id(322346485133975693)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(321026665525277154)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--stretch:t-Button--gapRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Novo Bem'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20:P20_NUM_CNPJ:&P5_NUM_CNPJ_EMPRESA.'
,p_icon_css_classes=>'fa-plus-square'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(321026847332277156)
,p_name=>'NUMERO_CONTRATO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(379155435828837717)
,p_prompt=>'Contrato:'
,p_source=>'NUMERO_CONTRATO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_suggestions_type=>'DYNAMIC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(379160005310837678)
,p_name=>'P5_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(379155435828837717)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(384732027211318301)
,p_name=>'P5_NUM_CNPJ_EMPRESA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(321026665525277154)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(322353773712975649)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(322356049527975646)
,p_name=>'Manual'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(322348014272975685)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(322356477988975645)
,p_event_id=>wwv_flow_imp.id(322356049527975646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.open(''https://www.gov.br/antaq/pt-br/assuntos/instalacoes-portuarias/ManualdeContasdaAutoridadePorturia_versao2017_Compilada.pdf'', ''_blank'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(322354181621975648)
,p_name=>'atualizar'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(322346485133975693)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(322354732074975647)
,p_event_id=>wwv_flow_imp.id(322354181621975648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(363292587189070019)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(322355149375975647)
,p_name=>'Manual_1'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(322347612538975685)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(322355593795975646)
,p_event_id=>wwv_flow_imp.id(322355149375975647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// apex.navigation.dialog(',
'//     ''f?p='' + apex.item("pApplicationId").getValue() + '':15:'' + apex.item("pInstance").getValue(), ',
'//     {',
unistr('//         title: ''Manual de An\00E1lise de Invent\00E1rio'','),
'//         width: ''90%'',',
'//         maxWidth: ''1200px'',',
'//         height: ''95%'',',
'//         modal: true,',
unistr('//         dialog: null // Usa o template padr\00E3o do APEX'),
'//     },',
unistr('//     ''t-Dialog-page--standard'', // CSS class para o dialog, padr\00E3o \00E9 bom'),
unistr('//     this.triggeringElement // O elemento que disparou a a\00E7\00E3o (o bot\00E3o)'),
'// );',
'window.open(''https://wiki.antaq.gov.br/pt/manual-inventario-de-bens'', ''_blank'');'))
);
wwv_flow_imp.component_end;
end;
/
