prompt --application/shared_components/user_interface/lovs/tipo_de_bem
begin
--   Manifest
--     TIPO DE BEM
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
 p_id=>wwv_flow_imp.id(355615883765668058)
,p_lov_name=>'TIPO DE BEM'
,p_lov_query=>'.'||wwv_flow_imp.id(355615883765668058)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365630556676
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355616193769668059)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Bens da Uni\00E3o - Administra\00E7\00E3o')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355616622522668060)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Bens da Uni\00E3o - Opera\00E7\00E3o')
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355617024228668060)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Bens da Uni\00E3o - Terceiros')
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355617376938668060)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Bens de Terceiros'
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355617812527668060)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Bens Pr\00F3prios - Administra\00E7\00E3o')
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355618235422668061)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>unistr('Bens Pr\00F3prios - Opera\00E7\00E3o')
,p_lov_return_value=>'6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355618589838668061)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'Imobilizado em Andamento'
,p_lov_return_value=>'7'
);
wwv_flow_imp.component_end;
end;
/
