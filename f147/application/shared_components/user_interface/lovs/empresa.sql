prompt --application/shared_components/user_interface/lovs/empresa
begin
--   Manifest
--     EMPRESA
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
 p_id=>wwv_flow_imp.id(319645225766737038)
,p_lov_name=>'EMPRESA'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SISPAT_API_KEYS'
,p_return_column_name=>'CNPJ'
,p_display_column_name=>'USERNAME'
,p_default_sort_column_name=>'USERNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45859029591224
);
wwv_flow_imp.component_end;
end;
/
