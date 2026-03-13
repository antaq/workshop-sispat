prompt --application/shared_components/user_interface/lovs/posicao
begin
--   Manifest
--     POSICAO
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
 p_id=>wwv_flow_imp.id(209571558815204652)
,p_lov_name=>'POSICAO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
' DISTINCT DESC_POSICAO, ',
' ID_POSICAO',
'FROM ',
' SISPAT_SUBPOSICOES',
'WHERE ',
' ID_CAPITULO = :P20_CAPITULO ',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ID_POSICAO'
,p_display_column_name=>'DESC_POSICAO'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45855716743952
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(318466617317809619)
,p_query_column_name=>'ID_POSICAO'
,p_heading=>unistr('C\00F3digo')
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(318466902824809618)
,p_query_column_name=>'DESC_POSICAO'
,p_heading=>unistr('Posi\00E7\00E3o')
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
