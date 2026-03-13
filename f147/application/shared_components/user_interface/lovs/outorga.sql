prompt --application/shared_components/user_interface/lovs/outorga
begin
--   Manifest
--     OUTORGA
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
 p_id=>wwv_flow_imp.id(355608133954650286)
,p_lov_name=>'OUTORGA'
,p_lov_query=>'.'||wwv_flow_imp.id(355608133954650286)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365620602589
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355608418650650286)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Estatal Federal'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355608815667650286)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Contrato de Arrendamento'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355609257415650287)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Contrato de Transi\00E7\00E3o')
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355609664695650287)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Conv\00EAnio ou Delega\00E7\00E3o')
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355610056610650287)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Contrato de Concess\00E3o')
,p_lov_return_value=>'5'
);
wwv_flow_imp.component_end;
end;
/
