prompt --application/shared_components/user_interface/lovs/capitulo
begin
--   Manifest
--     CAPITULO
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
 p_id=>wwv_flow_imp.id(220225294884560525)
,p_lov_name=>'CAPITULO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    DISTINCT ID_CAPITULO,',
'    DESC_CAPITULO',
'from ',
'    SISPAT_SUBPOSICOES'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ID_CAPITULO'
,p_display_column_name=>'DESC_CAPITULO'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45855612050383
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(209715324154636145)
,p_query_column_name=>'ID_CAPITULO'
,p_heading=>unistr('C\00F3digo')
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(220226851634567343)
,p_query_column_name=>'DESC_CAPITULO'
,p_heading=>'Capitulo'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
