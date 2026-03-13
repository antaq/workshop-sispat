prompt --application/shared_components/user_interface/lovs/lov_empresas_para_nova_key
begin
--   Manifest
--     LOV_EMPRESAS_PARA_NOVA_KEY
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
 p_id=>wwv_flow_imp.id(171165266545498397)
,p_lov_name=>'LOV_EMPRESAS_PARA_NOVA_KEY'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN V.NOME_EMPRESA IS NULL ',
unistr('            THEN ''Sem identifica\00E7\00E3o'''),
'        ELSE V.NOME_EMPRESA',
'    END AS NOME_EMPRESA,',
'    formatar_cnpj(L.NUM_CNPJ) AS NUM_CNPJ,',
'    -- Display: Nome e CNPJ',
unistr('    COALESCE(V.NOME_EMPRESA, ''Empresa Sem Identifica\00E7\00E3o'') || '' - '' || formatar_cnpj(L.NUM_CNPJ) AS DISPLAY_VALUE,'),
'    ',
unistr('    -- Return: O ID da Associa\00E7\00E3o (V\00EDnculo)'),
'    L.ID_ASSOCIACAO AS RETURN_VALUE',
'    ',
'FROM SISPAT_REPRESENTANTE_EMPRESA L',
'JOIN SISPAT_REPRESENTANTE R ON L.ID_REPRESENTANTE = R.ID_REPRESENTANTE',
'LEFT JOIN VW_APEX_EMPRESAS V ON L.NUM_CNPJ = V.NUM_CNPJ',
'WHERE ',
unistr('    -- 1. Filtra pelo usu\00E1rio logado'),
'    INSTR(R.EMAIL, LOWER(:APP_USER)) > 0',
'',
unistr('    -- 2. Regra de Neg\00F3cio: Excluir empresas que J\00C1 t\00EAm chave'),
'    AND NOT EXISTS (',
'        SELECT 1',
'        FROM SISPAT_API_KEYS k',
'        WHERE k.ID_ASSOCIACAO = L.ID_ASSOCIACAO',
unistr('          -- 3. Tratamento para EDI\00C7\00C3O:'),
'          -- Se estivermos editando (P32_ID_KEY tem valor), ',
unistr('          -- ignoramos o registro atual na verifica\00E7\00E3o de exist\00EAncia.'),
unistr('          -- Isso permite que a empresa atual da chave apare\00E7a na lista.'),
'          AND k.ID_KEY != NVL(:P32_ID_KEY, -1)',
'    )',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>45963173350005
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(171173952997396329)
,p_query_column_name=>'NOME_EMPRESA'
,p_display_sequence=>1
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(192960758294498976)
,p_query_column_name=>'NUM_CNPJ'
,p_display_sequence=>2
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(171173172158396330)
,p_query_column_name=>'DISPLAY_VALUE'
,p_heading=>'Display Value'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(171172744604396330)
,p_query_column_name=>'RETURN_VALUE'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
