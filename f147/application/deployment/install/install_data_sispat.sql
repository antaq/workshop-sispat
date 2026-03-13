prompt --application/deployment/install/install_data_sispat
begin
--   Manifest
--     INSTALL: INSTALL-data_sispat
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(192995057315336532)
,p_install_id=>wwv_flow_imp.id(162814622037096780)
,p_name=>'data_sispat'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    --SISPAT_INVENTARIO_BENS: 8/10000 rows exported, APEX$DATA$PKG/SISPAT_INVENTARIO_BENS$656308',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_INVENTARIO_BENS'', p_delete_after_install => true );',
'    --SISPAT_REPRESENTANTE: 6/10000 rows exported, APEX$DATA$PKG/SISPAT_REPRESENTANTE$304631',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_REPRESENTANTE'', p_delete_after_install => true );',
'    --SISPAT_REPRESENTANTE_EMPRESA: 6/10000 rows exported, APEX$DATA$PKG/SISPAT_REPRESENTANTE_EMP$349718',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_REPRESENTANTE_EMPRESA'', p_delete_after_install => true );',
'    --SISPAT_STATUS_BEM: 4/10000 rows exported, APEX$DATA$PKG/SISPAT_STATUS_BEM$82082',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_STATUS_BEM'', p_delete_after_install => true );',
'    --SISPAT_API_KEYS: 1/10000 rows exported, APEX$DATA$PKG/SISPAT_API_KEYS$818015',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_API_KEYS'', p_delete_after_install => true );',
'    --SISPAT_CAPITULO: 89/10000 rows exported, APEX$DATA$PKG/SISPAT_CAPITULO$560062',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_CAPITULO'', p_delete_after_install => true );',
'    --SISPAT_POSICOES: 1156/10000 rows exported, APEX$DATA$PKG/SISPAT_POSICOES$96493',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_POSICOES'', p_delete_after_install => true );',
'    --SISPAT_SUBPOSICOES: 4845/10000 rows exported, APEX$DATA$PKG/SISPAT_SUBPOSICOES$139746',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_SUBPOSICOES'', p_delete_after_install => true );',
'    --SISPAT_CONTA_CONTABIL: 1776/10000 rows exported, APEX$DATA$PKG/SISPAT_CONTA_CONTABIL$462357',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_CONTA_CONTABIL'', p_delete_after_install => true );',
'    --SISPAT_ARQUIVOS_BENS: 0/10000 rows exported, no file generated',
'    apex_data_install.load_supporting_object_data(p_table_name => ''SISPAT_ARQUIVOS_BENS'', p_delete_after_install => true );',
'end;'))
);
wwv_flow_imp.component_end;
end;
/
