prompt --application/pages/page_20021
begin
--   Manifest
--     PAGE: 20021
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
 p_id=>20021
,p_name=>unistr('Gerenciar acesso do usu\00E1rio')
,p_alias=>unistr('GERENCIAR-ACESSO-DO-USU\00C1RIO')
,p_step_title=>unistr('Gerenciar acesso do usu\00E1rio')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Esta p\00E1gina mostra um relat\00F3rio dos usu\00E1rios do aplicativo e o n\00EDvel de acesso concedido.</p>'),
unistr('<p>Clique nos t\00EDtulos das colunas para classificar e filtrar dados, ou clique no bot\00E3o <strong>A\00E7\00F5es</strong> para personalizar a exibi\00E7\00E3o da coluna e muitos recursos avan\00E7ados adicionais.<br>'),
unistr('Clique no bot\00E3o <strong>Redefinir</strong> para redefinir o relat\00F3rio interativo de volta \00E0s configura\00E7\00F5es padr\00E3o.</p>'),
unistr('<p>Clique no \00EDcone de edi\00E7\00E3o (l\00E1pis amarelo) para editar os detalhes do usu\00E1rio e o n\00EDvel de acesso, ou para excluir o usu\00E1rio.</p>'),
unistr('<p>Clique em <strong>Adicionar usu\00E1rio</strong>, na parte superior do relat\00F3rio, para adicionar um novo usu\00E1rio e seu n\00EDvel de acesso.</p>')))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(580365108267125535)
,p_plug_name=>unistr('Gerenciar acesso do usu\00E1rio')
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    u.ID,',
'    r.ID_REPRESENTANTE,',
'    LOWER(TRIM(u.USER_NAME)) AS USENAME,',
'    u.ROLE_IDS,',
'    r.EMAIL,',
'    r.NOME_REPRESENTANTE,',
'    (',
'        SELECT LISTAGG(rc.NUM_CNPJ, '':'') WITHIN GROUP (ORDER BY rc.NUM_CNPJ)',
'        FROM SISPAT_REPRESENTANTE_EMPRESA rc',
'        WHERE rc.ID_REPRESENTANTE = r.ID_REPRESENTANTE',
'    ) AS NUM_CNPJ,',
'    (',
'        SELECT LISTAGG(emp.EXIBIR_EMPRESA, '', '') WITHIN GROUP (ORDER BY emp.EXIBIR_EMPRESA)',
'        FROM SISPAT_REPRESENTANTE_EMPRESA rc',
'        LEFT JOIN VW_APEX_SISPAT_EMPRESAS_CNPJ_UNIFICADA emp ON emp.RETURN_VALUE = rc.NUM_CNPJ',
'        WHERE rc.ID_REPRESENTANTE = r.ID_REPRESENTANTE',
'    ) AS NOME_EMPRESAS,',
'    u.ROLE_NAMES AS ACESSOS',
'FROM',
'    APEX_APPL_ACL_USERS u',
'JOIN',
'    SISPAT_REPRESENTANTE r ON LOWER(TRIM(u.USER_NAME)) = LOWER(TRIM(r.EMAIL))',
'WHERE',
'    u.APPLICATION_ID = :APP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Manage User Access'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(580365853603125536)
,p_name=>'Manage User Access'
,p_max_row_count_message=>unistr('A contagem m\00E1xima de linhas deste relat\00F3rio \00E9 #MAX_ROW_COUNT# linhas. Aplique um filtro para reduzir o n\00FAmero de registros em sua consulta.')
,p_no_data_found_message=>unistr('Dados n\00E3o encontrados.')
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:20022:&SESSION.::&DEBUG.:RP,20022:P20022_ID,P20022_ID_REPRESENTANTE:\#ID#\,#ID_REPRESENTANTE#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'ARTHUR.MEDEIROS@ANTAQ.GOV.BR'
,p_internal_uid=>417563885764001000
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(580366580414125542)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(580844041855223628)
,p_db_column_name=>'ID_REPRESENTANTE'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Id Representante'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(580844207445223629)
,p_db_column_name=>'EMAIL'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(580845697457223644)
,p_db_column_name=>'ROLE_IDS'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Role Ids'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(580845820027223645)
,p_db_column_name=>'USENAME'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>unistr('Usu\00E1rio')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60758434275190738)
,p_db_column_name=>'NOME_EMPRESAS'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'Nome Empresas'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(580845915177223646)
,p_db_column_name=>'ACESSOS'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Acessos'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188629056214541424)
,p_db_column_name=>'NUM_CNPJ'
,p_display_order=>90
,p_column_identifier=>'Q'
,p_column_label=>'Num Cnpj'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60758516494190739)
,p_db_column_name=>'NOME_REPRESENTANTE'
,p_display_order=>100
,p_column_identifier=>'S'
,p_column_label=>'Nome Representante'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(580368997839125550)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1782875'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NOME_REPRESENTANTE:USENAME:NOME_EMPRESAS:ACESSOS:'
,p_sort_column_2=>'USERNAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(309095506415363694)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(580365108267125535)
,p_button_name=>'ADD_USER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Adicionar usu\00E1rio')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:20022:&APP_SESSION.::&DEBUG.:20022::'
,p_icon_css_classes=>'fa-plus-square'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(309096564504363707)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(580365108267125535)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309097055788363709)
,p_event_id=>wwv_flow_imp.id(309096564504363707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(580365108267125535)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(309096088917363706)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>146294121078239170
);
wwv_flow_imp.component_end;
end;
/
