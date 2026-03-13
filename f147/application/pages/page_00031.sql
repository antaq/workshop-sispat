prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
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
 p_id=>31
,p_name=>'Chave de API criada com sucesso!'
,p_alias=>'API-CRIADA'
,p_page_mode=>'MODAL'
,p_step_title=>'Chave de API criada com sucesso!'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2121795032473542284
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(319543551679384144)
,p_plug_name=>'Dialogo'
,p_title=>'API Key Criada com sucesso!'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Sua chave est\00E1 pronta para uso. Voc\00EA pode consult\00E1-la novamente quando precisar.<br><br>'),
unistr('\D83D\DD10 Lembre-se: Trate sua chave como uma senha. N\00E3o compartilhe e evite exp\00F4-la em c\00F3digo p\00FAblico ou reposit\00F3rios.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304653559165118564)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(319543551679384144)
,p_button_name=>'BTN_COPIAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--iconLeft:t-Button--hoverIconPush:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Copiar'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-clipboard'
,p_button_cattributes=>'style="margin-bottom: 0.5em;"'
,p_grid_column_attributes=>'style="align-self: end;"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(60758293026190736)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(319543551679384144)
,p_button_name=>'Desativar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--noUI:t-Button--iconLeft:t-Button--padLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Desativar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Tem certeza que deseja desativar a chave de API?'
,p_confirm_style=>'danger'
,p_button_condition=>'P31_ACTIVE_IND'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-times-circle-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(192981129180197417)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(319543551679384144)
,p_button_name=>'Reativar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--noUI:t-Button--iconLeft:t-Button--padLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reativar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Tem certeza que deseja reativar a chave de API?'
,p_confirm_style=>'warning'
,p_button_condition=>'P31_ACTIVE_IND'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-check-circle-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(192980680400197412)
,p_name=>'P31_ID_KEY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(319543551679384144)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(192981048905197416)
,p_name=>'P31_ACTIVE_IND'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(319543551679384144)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(319543660594384145)
,p_name=>'P31_API_KEY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(319543551679384144)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style="font-family: monospace;"'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#:js-hidePasswordVisibility:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304653624571118565)
,p_name=>'Copiar Chave'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(304653559165118564)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304653725723118566)
,p_event_id=>wwv_flow_imp.id(304653624571118565)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('// Pega o valor do item que cont\00E9m a chave'),
'var textoCopia = apex.item("P31_API_KEY").getValue();',
'',
'// Usa a API moderna do navegador para copiar',
'navigator.clipboard.writeText(textoCopia).then(function() {',
unistr('    // Sucesso: Mostra uma mensagem visual r\00E1pida'),
'    apex.message.showPageSuccess("Chave copiada com sucesso!");',
'}, function(err) {',
'    // Erro (caso o navegador bloqueie)',
'    console.error(''Erro ao copiar: '', err);',
unistr('    apex.message.alert("N\00E3o foi poss\00EDvel copiar automaticamente. Por favor, selecione e copie manualmente.");'),
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(192980747926197413)
,p_name=>'Desativar Chave API'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(60758293026190736)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(192980813969197414)
,p_event_id=>wwv_flow_imp.id(192980747926197413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE SISPAT_API_KEYS ',
'SET ACTIVE_IND = ''N'' ',
'WHERE ID_KEY = :P31_ID_KEY;',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(192980900216197415)
,p_event_id=>wwv_flow_imp.id(192980747926197413)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(192981222312197418)
,p_name=>'Reativar Chave API'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(192981129180197417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(192981382795197419)
,p_event_id=>wwv_flow_imp.id(192981222312197418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE SISPAT_API_KEYS ',
'SET ACTIVE_IND = ''Y'' ',
'WHERE ID_KEY = :P31_ID_KEY;',
''))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(192981480519197420)
,p_event_id=>wwv_flow_imp.id(192981222312197418)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304654335767118572)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Fechar'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>141852367927994036
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(192982510760197431)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Fechar Modal'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>192982510760197431
);
wwv_flow_imp.component_end;
end;
/
