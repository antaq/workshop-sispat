prompt --application/shared_components/automations/limpeza_de_patrimônios_duplicados
begin
--   Manifest
--     AUTOMATION: Limpeza de Patrimônios Duplicados
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_automation(
 p_id=>wwv_flow_imp.id(224564475703857366)
,p_name=>unistr('Limpeza de Patrim\00F4nios Duplicados')
,p_static_id=>unistr('limpeza-de-patrim\00F4nios-duplicados')
,p_trigger_type=>'API'
,p_polling_status=>'DISABLED'
,p_result_type=>'ROWS'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_type=>'TABLE'
,p_query_table=>'SISPAT_INVENTARIO_BENS'
,p_include_rowid_column=>false
,p_commit_each_row=>false
,p_error_handling_type=>'IGNORE'
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(224564807332857382)
,p_automation_id=>wwv_flow_imp.id(224564475703857366)
,p_name=>'New Action'
,p_execution_sequence=>10
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Cole este c\00F3digo no campo "Code"'),
'MERGE INTO SISPAT_INVENTARIO_BENS target',
'USING (',
'    SELECT',
'        ID_CADASTRO_DE_BENS,',
'        NUMERO_REGISTRO_PATRIMONIAL || ''-'' || LPAD(',
'            ROW_NUMBER() OVER (',
'                PARTITION BY NUMERO_CONTRATO, NUMERO_REGISTRO_PATRIMONIAL',
'                ORDER BY ID_CADASTRO_DE_BENS',
'            ), 3, ''0''',
'        ) AS NOVO_PATRIMONIAL',
'    FROM',
'        SISPAT_INVENTARIO_BENS',
'    WHERE (NUMERO_CONTRATO, NUMERO_REGISTRO_PATRIMONIAL) IN (',
unistr('        -- Subquery para encontrar apenas os grupos que precisam de atualiza\00E7\00E3o'),
'        SELECT',
'            NUMERO_CONTRATO,',
'            NUMERO_REGISTRO_PATRIMONIAL',
'        FROM',
'            SISPAT_INVENTARIO_BENS',
'        WHERE',
unistr('            NUMERO_REGISTRO_PATRIMONIAL IS NOT NULL AND NUMERO_REGISTRO_PATRIMONIAL != ''N\00C3O INFORMADO'''),
'        GROUP BY',
'            NUMERO_CONTRATO,',
'            NUMERO_REGISTRO_PATRIMONIAL',
'        HAVING',
'            COUNT(*) > 1',
'    )',
') source',
'ON (target.ID_CADASTRO_DE_BENS = source.ID_CADASTRO_DE_BENS)',
'WHEN MATCHED THEN',
'    UPDATE SET target.NUMERO_REGISTRO_PATRIMONIAL = source.NOVO_PATRIMONIAL;',
'',
unistr('-- N\00E3o \00E9 necess\00E1rio COMMIT aqui, o APEX faz isso automaticamente ao final da automa\00E7\00E3o.')))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp.component_end;
end;
/
