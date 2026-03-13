prompt --application/shared_components/user_interface/lovs/razões_da_baixa
begin
--   Manifest
--     RAZÕES DA BAIXA
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
 p_id=>wwv_flow_imp.id(355610335903656282)
,p_lov_name=>unistr('RAZ\00D5ES DA BAIXA')
,p_lov_query=>'.'||wwv_flow_imp.id(355610335903656282)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365628359407
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355610593495656282)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Devolu\00E7\00E3o de bens em comodato')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355610990095656282)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Erros de tombamento'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355611420574656282)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Extravio'
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355611783581656283)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Por furto ou roubo'
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355612182138656283)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Por sinistro'
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355612635705656283)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>unistr('Por indevida incorpora\00E7\00E3o')
,p_lov_return_value=>'6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355612975314656283)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>unistr('Inserv\00EDvel')
,p_lov_return_value=>'7'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355613423855656283)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>unistr('N\00E3o se aplica')
,p_lov_return_value=>'8'
);
wwv_flow_imp.component_end;
end;
/
