prompt --application/shared_components/user_interface/lovs/modalidade_de_tombamento
begin
--   Manifest
--     MODALIDADE DE TOMBAMENTO
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
 p_id=>wwv_flow_imp.id(355602885762644153)
,p_lov_name=>'MODALIDADE DE TOMBAMENTO'
,p_lov_query=>'.'||wwv_flow_imp.id(355602885762644153)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365619533611
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355603235564644154)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Aquisi\00E7\00E3o')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355603611754644155)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Comodato'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355603991508644155)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Cess\00E3o')
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355604395887644156)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Permuta ou Troca'
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355604773977644156)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Doa\00E7\00E3o')
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355605243972644156)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>unistr('Fabrica\00E7\00E3o')
,p_lov_return_value=>'6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355605642178644156)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>unistr('Incorpora\00E7\00E3o pr\00E9via')
,p_lov_return_value=>'7'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355606013240644157)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>unistr('Transfer\00EAncia')
,p_lov_return_value=>'8'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355606381670644157)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>unistr('Encampa\00E7\00E3o')
,p_lov_return_value=>'9'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355606782558644157)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Outros'
,p_lov_return_value=>'10'
);
wwv_flow_imp.component_end;
end;
/
