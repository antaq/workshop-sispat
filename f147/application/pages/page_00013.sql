prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>unistr('Desincopora\00E7\00E3o de Bens')
,p_alias=>'BENS-DESINCORPORADOS'
,p_step_title=>unistr('Desincopora\00E7\00E3o de Bens')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.card-amarelo {',
'    background-color: #fff3cd !important;',
'    border-left: 5px solid #ffc107;',
'}',
'',
'.card-vermelho {',
'    background-color: #f8d7da !important;',
'    border-left: 5px solid #dc3545;',
'}',
'',
'/* Deixar os cards com cantos levemente arredondados e um respiro */',
'.card-amarelo,',
'.card-vermelho {',
'    border-radius: 6px;',
'}',
'',
'/* Corpo interno do card */',
'.item-card-body {',
'    padding: 10px 12px;',
'}',
'',
unistr('/* Cabe\00E7alho do card (nome + status) */'),
'.item-header {',
'    margin-bottom: 8px;',
'}',
'',
unistr('/* T\00EDtulo do bem */'),
'.item-title {',
'    font-size: 15px;',
'    font-weight: 600;',
'    margin-bottom: 2px;',
'}',
'',
'/* Status do bem */',
'.item-status {',
'    font-size: 12px;',
'    font-weight: 500;',
'    opacity: 0.8;',
'}',
'',
unistr('/* Linhas de informa\00E7\00E3o */'),
'.info-line {',
'    display: flex;',
'    gap: 4px;',
'    font-size: 13px;',
'    margin-bottom: 2px;',
'}',
'',
unistr('/* R\00F3tulo da informa\00E7\00E3o */'),
'.info-label {',
'    font-weight: 500;',
'}',
'',
unistr('/* Valor da informa\00E7\00E3o */'),
'.info-value {',
'    font-weight: 400;',
'}',
'',
unistr('/* Azul j\00E1 usado para destacar campos clic\00E1veis/importantinhos */'),
'.info-value-blue {',
'    font-weight: 500;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'24'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(171604313231085735)
,p_plug_name=>'Filtros'
,p_title=>'Filtros'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_location=>null
,p_plug_source_type=>'NATIVE_SMART_FILTERS'
,p_filtered_region_id=>wwv_flow_imp.id(323398951344506637)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compact_numbers_threshold', '10000',
  'more_filters_suggestion_chip', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(232203303541973454)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
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
 p_id=>wwv_flow_imp.id(171605149863085743)
,p_plug_name=>unistr('Caixas De Informa\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(232203303541973454)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc:t-CardsRegion--styleA'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_plug_display_point=>'SMART_FILTERS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DADOS_FILTRADOS AS (',
'    SELECT',
'        NUMERO_CONTRATO,',
'        NUM_CNPJ_EMPRESA,',
'        NOME_PORTO,',
'        SIGLA_UF,',
'        DESC_RAZAO_SOCIAL',
'    FROM VW_APEX_SISPAT_INVENTARIO_BENS',
'    WHERE',
'        NUM_CNPJ_EMPRESA IS NOT NULL',
unistr('        AND ID_STATUS = 4                            -- <<< S\00D3 DESINCORPORADOS'),
'        AND INSTR(EMAILS, TRIM(LOWER(APEX_CUSTOM_AUTH.GET_USERNAME))) > 0',
')',
'',
'-- 1) Quantidade total de bens desincorporados',
'SELECT',
'    ''Quantidade de Bens Desincorporados'' AS TITLE,',
'    TO_CHAR(COUNT(*), ''FM999G999G999G990'') AS TOTAL,',
'    ''#WORKSPACE_FILES#img/img bens desincorporados.png'' AS ICON,',
'    1 AS SL',
'FROM DADOS_FILTRADOS'))
,p_lazy_loading=>true
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(171605247339085744)
,p_region_id=>wwv_flow_imp.id(171605149863085743)
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
 p_id=>wwv_flow_imp.id(171605336272085745)
,p_card_id=>wwv_flow_imp.id(171605247339085744)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(323398951344506637)
,p_plug_name=>'Bens Desincorporados'
,p_title=>'Bens Desincorporados'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_CADASTRO_DE_BENS,',
'       NUMERO_CONTRATO,',
'       SUBPOSICAO,',
'       NUM_CNPJ_EMPRESA_FORMATADO,',
'       NOME_PORTO,',
'       NOME_ITEM,',
'       NUMERO_REGISTRO_PATRIMONIAL,',
'       SIGLA_UF,',
'       ID_STATUS,',
'       STATUS,',
'',
unistr('-- =========== SE NOME DA EMPRESA N\00C3O FOR INFORMADO ==========='),
unistr('       COALESCE(NULLIF(TRIM(DESC_RAZAO_SOCIAL), ''''), ''N\00E3o informada'') AS DESC_RAZAO_SOCIAL,'),
'',
'       CASE',
'           when ID_STATUS = 4 then ''card-vermelho''',
'       ELSE ''''',
'       END AS card_css_class',
'from VW_APEX_SISPAT_INVENTARIO_BENS',
'where ID_STATUS = 4 ',
'AND INSTR(EMAILS, TRIM(LOWER(APEX_CUSTOM_AUTH.GET_USERNAME))) > 0',
'',
unistr('-- =========== IN\00CDCIO DA ALTERA\00C7\00C3O ==========='),
'AND (',
'    :P14_SEARCH IS NULL OR',
'    UPPER(NOME_ITEM) LIKE ''%'' || UPPER(:P14_SEARCH) || ''%'' OR',
'    UPPER(NUMERO_CONTRATO) LIKE ''%'' || UPPER(:P14_SEARCH) || ''%'' OR',
'    UPPER(SUBPOSICAO) LIKE ''%'' || UPPER(:P14_SEARCH) || ''%''',
')',
unistr('-- =========== FIM DA ALTERA\00C7\00C3O ============')))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P14_SEARCH'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_plug_query_no_data_found=>'Nenhum bem desincorporado.'
,p_show_total_row_count=>true
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(171603800195085730)
,p_region_id=>wwv_flow_imp.id(323398951344506637)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_CSS_CLASS.'
,p_title_adv_formatting=>false
,p_title_column_name=>'NOME_ITEM'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'STATUS'
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="item-card-body">',
'',
'    <div class="info-line">',
unistr('        <span class="info-label">N\00FAmero do Contrato:</span>'),
'        <span class="info-value-blue"><strong>&NUMERO_CONTRATO.</strong></span>',
'    </div>',
'',
'    <div class="info-line">',
'        <span class="info-label">Empresa:</span>',
'        <span class="info-value-blue"><strong>&DESC_RAZAO_SOCIAL.</strong></span>',
'    </div>',
'',
'    <div class="info-line">',
'        <span class="info-label">CNPJ:</span>',
'        <span class="info-value-blue"><strong>&NUM_CNPJ_EMPRESA_FORMATADO.</strong></span>',
'    </div>',
'',
'    <div class="info-line">',
'        <span class="info-label">Registro Patrimonial:</span>',
'        <span class="info-value"><strong>&NUMERO_REGISTRO_PATRIMONIAL.</strong></span>',
'    </div>',
'',
'    <div class="info-line">',
'        <span class="info-label">Porto / UF:</span>',
'        <span class="info-value"><strong>&NOME_PORTO. / &SIGLA_UF.</strong></span>',
'    </div>',
'',
'</div>'))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID_CADASTRO_DE_BENS'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(171603926045085731)
,p_card_id=>wwv_flow_imp.id(171603800195085730)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20:P20_ID_CADASTRO_DE_BENS:&ID_CADASTRO_DE_BENS.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(366092301863818370)
,p_plug_name=>unistr('Barra de A\00E7\00F5es')
,p_title=>unistr('Barra de A\00E7\00F5es')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>1569994581593435632
,p_plug_display_sequence=>40
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(237791825193237353)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(232203303541973454)
,p_button_name=>unistr('Desinscorpora\00E7\00E3o')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Pendente Desincorpora\00E7\00E3o (&P13_QTD_PENDENTES.)')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:13::'
,p_icon_css_classes=>'fa-arrow-circle-o-right'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(171604536372085737)
,p_name=>'P13_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(171604313231085735)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(171604645595085738)
,p_name=>'P13_QTD_PENDENTES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(232203303541973454)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*)',
'FROM VW_APEX_SISPAT_INVENTARIO_BENS',
'WHERE ID_STATUS = 3'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(321027698628277165)
,p_name=>'Atualizar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(323398951344506637)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(321027853721277166)
,p_event_id=>wwv_flow_imp.id(321027698628277165)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(323398951344506637)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(321027889920277167)
,p_name=>'UpdateRowClass'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(323398951344506637)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(321027981308277168)
,p_event_id=>wwv_flow_imp.id(321027889920277167)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.row-class'').each(function() {',
'  $(this).closest(''tr'')',
'    .addClass(''se_desincorporado_''+$(this).attr(''status-se-desincorporado''));',
'});'))
);
wwv_flow_imp.component_end;
end;
/
