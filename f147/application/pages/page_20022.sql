prompt --application/pages/page_20022
begin
--   Manifest
--     PAGE: 20022
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
 p_id=>20022
,p_name=>unistr('Gerenciar o acesso do usu\00E1rio')
,p_alias=>unistr('GERENCIAR-O-ACESSO-DO-USU\00C1RIO')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Gerenciar o acesso do usu\00E1rio')
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this form to enter users, their email address and set their access level. ',
'The settings defined under <em>Configure Access Control</em> will determine whether the username must be their email address or can be any alphanumeric entry.</p>',
'<p>This application supports the following 3 access levels: Reader, Contributor, and Administrator.</p>',
'<ul>',
'  <li><strong>Readers</strong> have read-only access to all information and can also view reports.</li>',
'  <li><strong>Contributors</strong> can create, edit and delete information and view reports.</li>',
'  <li><strong>Administrators</strong>, in addition to Contributors capability, can also perform configuration of the application by accessing the Administration section of the application.</li>',
'</ul>',
'<p>When editing an existing user you can lock their account which will prevent them from accessing the application.</p>',
'<p><em><strong>Note:</strong>   If using Oracle APEX accounts then users entered here must also be defined as end users by a Workspace Administrator, who can also set their password.</em></p>'))
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(580466465777680759)
,p_plug_name=>unistr('Configura\00E7\00E3o Regulado')
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'APEX_APPL_ACL_USERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(580937496841778820)
,p_plug_name=>'Representante'
,p_parent_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_plug_display_sequence=>100
,p_query_type=>'TABLE'
,p_query_table=>'SISPAT_REPRESENTANTE'
,p_include_rowid_column=>false
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(580466495691680759)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_query_type=>'SQL'
,p_plug_query_num_rows=>15
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(309191881204918890)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(580466495691680759)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Salvar altera\00E7\00F5es')
,p_button_position=>'NEXT'
,p_button_condition=>'P20022_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(309192308666918890)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(580466495691680759)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Adicionar usu\00E1rio')
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P20022_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(309193137400918891)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(580466495691680759)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Deletar'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P20022_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323401965605506667)
,p_name=>'P20022_NOME_REPRESENTANTE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_prompt=>'Nome Completo'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NOME_REPRESENTANTE',
'FROM SISPAT_REPRESENTANTE',
'WHERE ID_REPRESENTANTE = :P20022_ID_REPRESENTANTE'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(323402048913506668)
,p_name=>'P20022_NUM_CPF'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_prompt=>'CPF'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NUM_CPF',
'FROM SISPAT_REPRESENTANTE',
'WHERE ID_REPRESENTANTE = :P20022_ID_REPRESENTANTE'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(580398587287112959)
,p_name=>'P20022_APPLICATION_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_item_source_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_item_default=>'&APP_ID.'
,p_source=>'APPLICATION_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(580470629582680774)
,p_name=>'P20022_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_item_source_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(580471434267680775)
,p_name=>'P20022_USER_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_item_source_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_prompt=>unistr('Nome de usu\00E1rio ')
,p_source=>'USER_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    DISTINCT LOWER(TRIM(u.USER_NAME)) AS USENAME',
'FROM ',
'    APEX_APPL_ACL_USERS u',
'WHERE ',
'    NOT EXISTS (',
'        SELECT 1 FROM SISPAT_REPRESENTANTE r ',
'        WHERE LOWER(TRIM(u.USER_NAME)) = LOWER(TRIM(r.EMAIL))',
'    )',
'ORDER BY USENAME'))
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
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
 p_id=>wwv_flow_imp.id(580471856192680775)
,p_name=>'P20022_ROLE_IDS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_item_source_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_prompt=>unistr('N\00EDvel de acesso')
,p_source=>'ROLE_IDS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ACCESS_ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select role_name d, role_id r',
'from APEX_APPL_ACL_ROLES where application_id = :APP_ID ',
'order by 1'))
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(580938580814778837)
,p_name=>'P20022_NUM_CNPJ'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(580466465777680759)
,p_prompt=>'Empresas'
,p_format_mask=>'99.999.999/0001-99'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NUM_CNPJ',
'FROM SISPAT_REPRESENTANTE_EMPRESA',
'WHERE ID_REPRESENTANTE = :P20022_ID_REPRESENTANTE'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_EMPRESAS_CNPJ_UNIFICADA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    formatar_cnpj(E.NUM_CNPJ)       AS DISPLAY_VALUE,',
'    E.NUM_CNPJ                      AS RETURN_VALUE,',
'    E.NOME_EMPRESA                  AS EXIBIR_EMPRESA,',
'    1                               AS ORDEM_SORT',
'FROM VW_APEX_EMPRESAS E',
'WHERE E.NUM_CNPJ IS NOT NULL',
'',
'UNION ALL',
'',
unistr('-- Agora usamos DISTINCT para trazer CNPJs cadastrados por QUALQUER usu\00E1rio'),
'-- e removemos o filtro "WHERE ID_REPRESENTANTE = ..."',
'SELECT DISTINCT',
'    formatar_cnpj(RE.CNPJ)          AS DISPLAY_VALUE,',
'    RE.CNPJ                         AS RETURN_VALUE,',
'    ''CNPJ CADASTRADO: '' || formatar_cnpj(RE.CNPJ) AS EXIBIR_EMPRESA,',
'    2                               AS ORDEM_SORT',
'FROM SISPAT_REPRESENTANTE_EMPRESA RE',
'WHERE RE.CNPJ IS NOT NULL',
'  AND NOT EXISTS (',
'      SELECT 1 ',
'      FROM VW_APEX_EMPRESAS V ',
'      WHERE V.NUM_CNPJ = RE.CNPJ',
'  )',
'',
'ORDER BY ORDEM_SORT, EXIBIR_EMPRESA'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P20022_ID_REPRESENTANTE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(580942115411778850)
,p_name=>'P20022_ID_REPRESENTANTE'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(580937496841778820)
,p_item_source_plug_id=>wwv_flow_imp.id(580937496841778820)
,p_source=>'ID_REPRESENTANTE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(309195455543918907)
,p_name=>unistr('Salvar usu\00E1rio ')
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309196410912918908)
,p_event_id=>wwv_flow_imp.id(309195455543918907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_username       VARCHAR2(255);',
'    l_roles_str      APEX_T_VARCHAR2; ',
'    l_user_role_ids  APEX_T_NUMBER := APEX_T_NUMBER(); ',
'    l_application_id NUMBER;',
'    ',
'    -- ID da role de Administrador (ajuste se souber o ID fixo, ',
'    -- geralmente o APEX usa IDs internos, mas vamos confiar na lista da tela)',
'    v_is_self_edit   BOOLEAN := FALSE;',
'BEGIN ',
'    l_username       := :P20022_USER_NAME;',
'    l_application_id := :P20022_APPLICATION_ID; ',
'',
unistr('    -- Verifica se est\00E1 editando o pr\00F3prio usu\00E1rio logado'),
'    IF UPPER(l_username) = UPPER(:APP_USER) THEN',
'        v_is_self_edit := TRUE;',
'    END IF;',
'',
'    -- Converte checkboxes para Array',
'    IF :P20022_ROLE_IDS IS NOT NULL THEN',
'        l_roles_str := APEX_STRING.SPLIT(:P20022_ROLE_IDS, '':'');',
'        ',
'        FOR i IN 1..l_roles_str.COUNT LOOP',
'            APEX_STRING.PUSH(l_user_role_ids, TO_NUMBER(l_roles_str(i)));',
'        END LOOP;',
'    END IF;',
'',
unistr('    -- BLOCO DE PROTE\00C7\00C3O'),
'    BEGIN',
'        APEX_ACL.REPLACE_USER_ROLES (',
'            p_application_id  => l_application_id,',
'            p_user_name       => l_username,',
'            p_role_ids        => l_user_role_ids',
'        );',
'    EXCEPTION',
'        WHEN OTHERS THEN',
unistr('            -- Se for o erro de remover admin de si mesmo (-20987 \00E9 comum para ACL, mas pegamos gen\00E9rico)'),
'            IF SQLERRM LIKE ''%remove administrator role%'' THEN',
unistr('                -- AQUI EST\00C1 O TRUQUE: '),
unistr('                -- N\00E3o fazemos nada (NULL). O c\00F3digo termina com "sucesso" t\00E9cnico.'),
'                -- O APEX vai achar que deu tudo certo e vai fechar o modal.',
unistr('                -- Na pr\00E1tica, suas roles n\00E3o mudaram (seguran\00E7a do APEX), mas o NUM_CNPJ foi salvo pela DA 2.'),
'                NULL;',
'            ELSE',
'                -- Qualquer outro erro real deve ser exibido',
'                RAISE;',
'            END IF;',
'    END;',
'END;'))
,p_attribute_02=>'P20022_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309196890112918908)
,p_event_id=>wwv_flow_imp.id(309195455543918907)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' l_id_representante NUMBER;',
' l_num_cnpj_array APEX_T_VARCHAR2;',
' l_num_cnpj_limpo NUMBER;',
' l_num_cnpj_str_limpa VARCHAR2(20);',
'',
unistr(' -- ** NOVAS VARI\00C1VEIS PARA O NOME E CPF **'),
' l_nome_representante VARCHAR2(255) := :P20022_NOME_REPRESENTANTE;',
' l_num_cpf_limpo      VARCHAR2(14); ',
'BEGIN',
' ',
unistr(' -- ** LIMPEZA DO CPF (Removendo pontos, tra\00E7os e qualquer n\00E3o-d\00EDgito) **'),
' IF :P20022_NUM_CPF IS NOT NULL THEN',
'    l_num_cpf_limpo := REGEXP_REPLACE(:P20022_NUM_CPF, ''[^0-9]'', '''');',
' END IF;',
'',
' -- PARTE 1: Gerenciar/Criar Representante',
' l_id_representante := :P20022_ID_REPRESENTANTE;',
'',
' IF l_id_representante IS NULL THEN',
unistr('    INSERT INTO SISPAT_REPRESENTANTE (EMAIL, NOME_REPRESENTANTE, NUM_CPF) -- Inclu\00EDdo NOME e NUM_CPF'),
'    VALUES (',
'        LOWER(:P20022_USER_NAME),',
'        l_nome_representante,     -- Novo campo',
'        l_num_cpf_limpo          -- Novo campo (limpo)',
'    )',
'    RETURNING ID_REPRESENTANTE INTO l_id_representante;',
'    :P20022_ID_REPRESENTANTE := l_id_representante;',
' ELSE',
'    UPDATE SISPAT_REPRESENTANTE',
'    SET',
'        EMAIL = LOWER(:P20022_USER_NAME),',
'        NOME_REPRESENTANTE  = l_nome_representante,     -- Novo campo',
'        NUM_CPF = l_num_cpf_limpo        -- Novo campo (limpo)',
'    WHERE ID_REPRESENTANTE = l_id_representante;',
' END IF;',
' ',
unistr(' -- PARTE 2: Gerenciar V\00EDnculos das Empresas'),
' DELETE FROM SISPAT_REPRESENTANTE_EMPRESA',
' WHERE ID_REPRESENTANTE = l_id_representante;',
'',
' IF :P20022_NUM_CNPJ IS NOT NULL THEN',
'    l_num_cnpj_array := APEX_STRING.SPLIT(:P20022_NUM_CNPJ, '':'');',
'    FOR i IN 1..l_num_cnpj_array.COUNT LOOP',
'        l_num_cnpj_str_limpa := REGEXP_REPLACE(l_num_cnpj_array(i), ''[^0-9]'', '''');',
'        IF LENGTH(l_num_cnpj_str_limpa) > 0 THEN BEGIN',
'            l_num_cnpj_limpo := TO_NUMBER(l_num_cnpj_str_limpa);',
'            INSERT INTO SISPAT_REPRESENTANTE_EMPRESA',
'            ( ID_REPRESENTANTE, NUM_CNPJ, DATA_VINCULO )',
'            VALUES ( l_id_representante, l_num_cnpj_limpo, SYSDATE );',
'        EXCEPTION WHEN OTHERS THEN',
'            NULL;',
'        END;',
'        END IF;',
'    END LOOP;',
' END IF;',
'END;'))
,p_attribute_02=>'P20022_ID_REPRESENTANTE, P20022_USER_NAME, P20022_NUM_CNPJ,P20022_NUM_CPF,P20022_NOME_REPRESENTANTE'
,p_attribute_03=>'P20022_ID_REPRESENTANTE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(309197332516918908)
,p_name=>unistr('Deletar usu\00E1rio ')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(309193137400918891)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309198334257918909)
,p_event_id=>wwv_flow_imp.id(309197332516918908)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'BEGIN',
'',
'    DELETE FROM SISPAT_REPRESENTANTE WHERE ID_REPRESENTANTE = :P20022_ID_REPRESENTANTE;',
'END;'))
,p_attribute_02=>'P20022_ID_REPRESENTANTE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309197842535918909)
,p_event_id=>wwv_flow_imp.id(309197332516918908)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'    DELETE FROM SISPAT_REPRESENTANTE_EMPRESA WHERE ID_REPRESENTANTE = :P20022_ID_REPRESENTANTE;',
'',
'END;'))
,p_attribute_02=>'P20022_ID_REPRESENTANTE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309198850039918909)
,p_event_id=>wwv_flow_imp.id(309197332516918908)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'    DELETE FROM APEX_APPL_ACL_USERS WHERE ID = :P20022_ID AND APPLICATION_ID = :P20022_APPLICATION_ID;',
'',
'END;'))
,p_attribute_02=>'P20022_ID_REPRESENTANTE,P20022_ID,P20022_APPLICATION_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(309199357051918910)
,p_event_id=>wwv_flow_imp.id(309197332516918908)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(309189427086918885)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_imp.id(580466465777680759)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Manage User Access'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>146387459247794349
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(175588959255884902)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar CPF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
unistr('    -- Verifica se j\00E1 existe outro registro com o mesmo CPF (excluindo o pr\00F3prio registro em caso de edi\00E7\00E3o)'),
'    FOR c IN (',
'        SELECT 1',
'        FROM SISPAT_REPRESENTANTE',
'        WHERE NUM_CPF = REGEXP_REPLACE(:P20022_NUM_CPF, ''[^0-9]'', '''')',
'        AND (:P20022_ID_REPRESENTANTE IS NULL OR ID_REPRESENTANTE != :P20022_ID_REPRESENTANTE)',
'    ) LOOP',
'        apex_error.add_error(',
unistr('            p_message => ''CPF j\00E1 cadastrado para outro usu\00E1rio'','),
'            p_display_location => apex_error.c_inline_in_notification',
'        );',
'        RETURN; -- Interrompe o processo',
'    END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RETURN :REQUEST IN (''SAVE'', ''CREATE'');'
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_internal_uid=>175588959255884902
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304652913359118558)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(580466465777680759)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Manage User Access'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'N'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>141850945519994022
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(309194106884918904)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>146392139045794368
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(309191185337918889)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(580937496841778820)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Inicializar o form Gerenciar o acesso do usu\00E1rio')
,p_internal_uid=>146389217498794353
);
wwv_flow_imp.component_end;
end;
/
