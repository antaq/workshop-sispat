prompt --application/pages/page_00032
begin
--   Manifest
--     PAGE: 00032
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
 p_id=>32
,p_name=>'Gerar Chave de API'
,p_alias=>'GERAR-CHAVE-API'
,p_page_mode=>'MODAL'
,p_step_title=>'Gerar Chave de API'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(319543699528384146)
,p_plug_name=>'Gerar Chave de API'
,p_title=>'Gerar Chave de API'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ID_KEY,            -- Nova PK (antigo ID)',
'    ID_ASSOCIACAO,     -- Nova FK (substitui CNPJ + ID_REP)',
'    API_KEY,',
'    KEY_NAME,',
'    CREATED_AT,',
'    ACTIVE_IND',
'FROM SISPAT_API_KEYS'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(319543889380384148)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_button_name=>'Gerar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Gerar'
,p_button_position=>'CREATE'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(304653460016118563)
,p_branch_name=>unistr('Ir para P\00E1gina 31')
,p_branch_action=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_API_KEY,P31_ID_KEY:&P32_API_KEY.,&P32_ID_KEY.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(319543889380384148)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(158226974039152641)
,p_name=>'P32_ID_KEY'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_display_point=>'EDIT'
,p_item_source_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_source=>'ID_KEY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(158227047982152642)
,p_name=>'P32_ID_ASSOCIACAO'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_source_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_prompt=>'Empresa'
,p_source=>'ID_ASSOCIACAO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_EMPRESAS_PARA_NOVA_KEY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN V.NOME_EMPRESA IS NULL ',
unistr('            THEN ''Sem identifica\00E7\00E3o'''),
'        ELSE V.NOME_EMPRESA',
'    END AS NOME_EMPRESA,',
'    formatar_cnpj(L.NUM_CNPJ) AS NUM_CNPJ,',
'    -- Display: Nome e CNPJ',
unistr('    COALESCE(V.NOME_EMPRESA, ''Empresa Sem Identifica\00E7\00E3o'') || '' - '' || formatar_cnpj(L.NUM_CNPJ) AS DISPLAY_VALUE,'),
'    ',
unistr('    -- Return: O ID da Associa\00E7\00E3o (V\00EDnculo)'),
'    L.ID_ASSOCIACAO AS RETURN_VALUE',
'    ',
'FROM SISPAT_REPRESENTANTE_EMPRESA L',
'JOIN SISPAT_REPRESENTANTE R ON L.ID_REPRESENTANTE = R.ID_REPRESENTANTE',
'LEFT JOIN VW_APEX_EMPRESAS V ON L.NUM_CNPJ = V.NUM_CNPJ',
'WHERE ',
unistr('    -- 1. Filtra pelo usu\00E1rio logado'),
'    INSTR(R.EMAIL, LOWER(:APP_USER)) > 0',
'',
unistr('    -- 2. Regra de Neg\00F3cio: Excluir empresas que J\00C1 t\00EAm chave'),
'    AND NOT EXISTS (',
'        SELECT 1',
'        FROM SISPAT_API_KEYS k',
'        WHERE k.ID_ASSOCIACAO = L.ID_ASSOCIACAO',
unistr('          -- 3. Tratamento para EDI\00C7\00C3O:'),
'          -- Se estivermos editando (P32_ID_KEY tem valor), ',
unistr('          -- ignoramos o registro atual na verifica\00E7\00E3o de exist\00EAncia.'),
unistr('          -- Isso permite que a empresa atual da chave apare\00E7a na lista.'),
'          AND k.ID_KEY != NVL(:P32_ID_KEY, -1)',
'    )',
'ORDER BY 1'))
,p_lov_cascade_parent_items=>'P32_ID_KEY'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:js-hidePasswordVisibility:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(319544239439384151)
,p_name=>'P32_API_KEY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_display_point=>'EDIT'
,p_item_source_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_source=>'API_KEY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(319544464486384153)
,p_name=>'P32_KEY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_source_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_prompt=>'Nome da API'
,p_source=>'KEY_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>3031561932232085882
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--indicatorLabel:t-Form-fieldContainer--xlarge'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(319544615615384155)
,p_name=>'P32_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_display_point=>'EDIT'
,p_item_source_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_default=>'SELECT SYSDATE FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'CREATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(319544716232384156)
,p_name=>'P32_ACTIVE_IND'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_display_point=>'EDIT'
,p_item_source_plug_id=>wwv_flow_imp.id(319543699528384146)
,p_item_default=>'Y'
,p_source=>'ACTIVE_IND'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304653334850118562)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gerar API Key'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_prefixo     VARCHAR2(20) := ''sispat_test_''; ',
'    v_random_part VARCHAR2(80);',
'    v_final_key   VARCHAR2(100);',
'    v_exists      NUMBER;',
'BEGIN',
unistr('    -- S\00F3 gera se o campo estiver vazio (Insert)'),
'    IF :P32_API_KEY IS NULL THEN',
'        LOOP',
unistr('            -- Gera string aleat\00F3ria de 40 caracteres'),
'            v_random_part := DBMS_RANDOM.STRING(''x'', 40);',
'            v_final_key   := v_prefixo || v_random_part;',
'',
unistr('            -- Verifica colis\00E3o (rar\00EDssima, mas poss\00EDvel)'),
'            SELECT count(*)',
'            INTO v_exists',
'            FROM SISPAT_API_KEYS',
'            WHERE API_KEY = v_final_key;',
'',
'            EXIT WHEN v_exists = 0;',
'        END LOOP;',
'',
unistr('        -- Atribui ao item para ser salvo pelo pr\00F3ximo processo'),
'        :P32_API_KEY := v_final_key;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>141851367010994026
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304653030027118559)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(319543699528384146)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Processar o form API'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'N'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>141851062187994023
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(319543995273384149)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(319543699528384146)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Initialize form Defini\00E7\00E3o da API')
,p_internal_uid=>156742027434259613
);
wwv_flow_imp.component_end;
end;
/
