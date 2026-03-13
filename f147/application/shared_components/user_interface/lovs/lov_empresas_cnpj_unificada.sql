prompt --application/shared_components/user_interface/lovs/lov_empresas_cnpj_unificada
begin
--   Manifest
--     LOV_EMPRESAS_CNPJ_UNIFICADA
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
 p_id=>wwv_flow_imp.id(320341237200469760)
,p_lov_name=>'LOV_EMPRESAS_CNPJ_UNIFICADA'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'VW_APEX_SISPAT_EMPRESAS_CNPJ_UNIFICADA'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>46056134682358
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(320341688337464189)
,p_query_column_name=>'RETURN_VALUE'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(320342166219464188)
,p_query_column_name=>'DISPLAY_VALUE'
,p_heading=>'CNPJ'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(320623249535734380)
,p_query_column_name=>'EXIBIR_EMPRESA'
,p_heading=>'Empresa'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(320343304311464187)
,p_query_column_name=>'ORDEM_SORT'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
