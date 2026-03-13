prompt --application/shared_components/user_interface/lovs/natureza
begin
--   Manifest
--     NATUREZA
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
 p_id=>wwv_flow_imp.id(355607167990646816)
,p_lov_name=>'NATUREZA'
,p_lov_query=>'.'||wwv_flow_imp.id(355607167990646816)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365620419603
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355607420703646817)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('M\00F3vel')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355607839072646817)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Im\00F3vel')
,p_lov_return_value=>'2'
);
wwv_flow_imp.component_end;
end;
/
