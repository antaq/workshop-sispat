prompt --application/shared_components/user_interface/lovs/histórico
begin
--   Manifest
--     HISTÓRICO
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
 p_id=>wwv_flow_imp.id(355599918102637681)
,p_lov_name=>unistr('HIST\00D3RICO')
,p_lov_query=>'.'||wwv_flow_imp.id(355599918102637681)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365618320764
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355600232761637682)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Tombado'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355600614543637682)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('N\00E3o Tombado')
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355601047977637682)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Tombado, por\00E9m inexistente ou n\00E3o localizado')
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355601430932637683)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Com invent\00E1rio de transfer\00EAncia pela Uni\00E3o')
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355601776404637683)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Sem invent\00E1rio de transfer\00EAncia pela Uni\00E3o')
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355602191288637683)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>unistr('Com ou sem aceite formal de transfer\00EAncia de guarda e responsabilidade.')
,p_lov_return_value=>'6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355602637709637683)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>unistr('Sem aceite formal de transfer\00EAncia de guarda e responsabilidade.')
,p_lov_return_value=>'7'
);
wwv_flow_imp.component_end;
end;
/
