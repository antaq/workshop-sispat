prompt --application/shared_components/user_interface/lovs/lista_posicoes
begin
--   Manifest
--     LISTA_POSICOES
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
 p_id=>wwv_flow_imp.id(212646712028883959)
,p_lov_name=>'LISTA_POSICOES'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SISPAT_POSICOES'
,p_query_where=>'ID_CAPITULO = :P20_ID_CAPITULO'
,p_return_column_name=>'ID_POSICAO'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45787903664225
);
wwv_flow_imp.component_end;
end;
/
