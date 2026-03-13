prompt --application/shared_components/user_interface/lovs/fonte_de_recurso
begin
--   Manifest
--      FONTE DE RECURSO
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
 p_id=>wwv_flow_imp.id(355590088029614932)
,p_lov_name=>' FONTE DE RECURSO'
,p_lov_query=>'.'||wwv_flow_imp.id(355590088029614932)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365606550951
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355590385446614933)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Pr\00F3prio')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355590773090614933)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Tesouro Nacional'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355591214711614933)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Tesouro Estadual'
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355591655633614933)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Tesouro Municipal'
,p_lov_return_value=>'4'
);
wwv_flow_imp.component_end;
end;
/
