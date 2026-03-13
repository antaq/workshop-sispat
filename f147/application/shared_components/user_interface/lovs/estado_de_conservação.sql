prompt --application/shared_components/user_interface/lovs/estado_de_conservação
begin
--   Manifest
--     ESTADO DE CONSERVAÇÃO
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
 p_id=>wwv_flow_imp.id(355587934588610998)
,p_lov_name=>unistr('ESTADO DE CONSERVA\00C7\00C3O')
,p_lov_query=>'.'||wwv_flow_imp.id(355587934588610998)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365606340911
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355588211951610999)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Novo'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355588630306610999)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Exelente'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355589031626610999)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Bom'
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355589460200611000)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Regular'
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355589773841611000)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('P\00E9ssimo')
,p_lov_return_value=>'5'
);
wwv_flow_imp.component_end;
end;
/
