prompt --application/shared_components/user_interface/lovs/conta_contabil
begin
--   Manifest
--     CONTA CONTABIL
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
 p_id=>wwv_flow_imp.id(218772020694829144)
,p_lov_name=>'CONTA CONTABIL'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SISPAT_CONTA_CONTABIL'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'GRAU = ''4'' OR ',
'GRAU = ''5'' OR',
'GRAU = ''6'''))
,p_return_column_name=>'CODIGO'
,p_display_column_name=>'CODIGO'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'CODIGO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45942610133861
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(187410540973483374)
,p_query_column_name=>'CODIGO'
,p_heading=>unistr('C\00F3digo')
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(322316247314004692)
,p_query_column_name=>'GRAU'
,p_heading=>'Grau'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(187416025478421838)
,p_query_column_name=>'TITULO'
,p_heading=>unistr('T\00EDtulo')
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
