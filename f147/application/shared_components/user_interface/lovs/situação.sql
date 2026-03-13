prompt --application/shared_components/user_interface/lovs/situação
begin
--   Manifest
--     SITUAÇÃO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(355613721223659618)
,p_lov_name=>unistr('SITUA\00C7\00C3O')
,p_lov_query=>'.'||wwv_flow_imp.id(355613721223659618)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365628531337
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355614001160659619)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Serv\00EDvel')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355614446647659619)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Inserv\00EDvel - Ocioso')
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355614812386659619)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Inserv\00EDvel  - Antiecon\00F4mico')
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355615211110659620)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Inserv\00EDvel - Recuper\00E1vel')
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355615657003659620)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Insers\00EDvel - Irrecuper\00E1vel')
,p_lov_return_value=>'5'
);
wwv_flow_imp.component_end;
end;
/
