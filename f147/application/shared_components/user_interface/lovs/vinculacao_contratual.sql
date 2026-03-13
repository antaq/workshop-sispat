prompt --application/shared_components/user_interface/lovs/vinculacao_contratual
begin
--   Manifest
--     VINCULACAO CONTRATUAL
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
 p_id=>wwv_flow_imp.id(355618951188671140)
,p_lov_name=>'VINCULACAO CONTRATUAL'
,p_lov_query=>'.'||wwv_flow_imp.id(355618951188671140)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365630629835
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355619212004671141)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Remov\00EDvel')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355619650822671141)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('N\00E3o Remov\00EDvel')
,p_lov_return_value=>'2'
);
wwv_flow_imp.component_end;
end;
/
