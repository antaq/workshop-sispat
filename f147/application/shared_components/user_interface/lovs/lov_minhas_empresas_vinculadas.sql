prompt --application/shared_components/user_interface/lovs/lov_minhas_empresas_vinculadas
begin
--   Manifest
--     LOV_MINHAS_EMPRESAS_VINCULADAS
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
 p_id=>wwv_flow_imp.id(320630747279555656)
,p_lov_name=>'LOV_MINHAS_EMPRESAS_VINCULADAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
unistr('    -- Tenta pegar o nome da View. Se n\00E3o achar (foi manual), mostra o CNPJ formatado'),
'    WKSP_SFCDEV.formatar_cnpj(L.NUM_CNPJ) AS DISPLAY_VALUE,',
'    V.NOME_EMPRESA            AS EMPRESA,',
'    L.NUM_CNPJ                AS RETURN_VALUE,',
'    WKSP_SFCDEV.formatar_cnpj(L.NUM_CNPJ) AS EXIBIR_CNPJ',
'FROM SISPAT_REPRESENTANTE_EMPRESA L',
'-- Join para pegar dados do representante (para filtrar pelo Login/Email)',
'JOIN SISPAT_REPRESENTANTE R',
'    ON L.ID_REPRESENTANTE = R.ID_REPRESENTANTE',
'-- Left Join para tentar achar o nome bonito na View oficial',
'LEFT JOIN WKSP_SFCDEV.VW_APEX_EMPRESAS V',
'    ON L.NUM_CNPJ = V.NUM_CNPJ',
'WHERE ',
unistr('    -- Condi\00E7\00E3o original: Usu\00E1rio atual'),
'    INSTR(R.EMAIL, LOWER(:APP_USER)) > 0',
'ORDER BY 1;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>46474130589293
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(256709651769120212)
,p_query_column_name=>'RETURN_VALUE'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(256709955179120217)
,p_query_column_name=>'DISPLAY_VALUE'
,p_heading=>'Display Value'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(256710314920120218)
,p_query_column_name=>'EMPRESA'
,p_heading=>'Empresa'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(256710782357120218)
,p_query_column_name=>'EXIBIR_CNPJ'
,p_heading=>'CNPJ'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
