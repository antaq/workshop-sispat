prompt --application/shared_components/automations/gerar_embeddings_em_lote
begin
--   Manifest
--     AUTOMATION: Gerar Embeddings em Lote
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_automation(
 p_id=>wwv_flow_imp.id(198227317398526370)
,p_name=>'Gerar Embeddings em Lote'
,p_static_id=>'gerar-embeddings-em-lote'
,p_trigger_type=>'POLLING'
,p_polling_interval=>'FREQ=MINUTELY;INTERVAL=10'
,p_polling_status=>'DISABLED'
,p_result_type=>'ROWS'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_type=>'TABLE'
,p_query_table=>'SISPAT_INVENTARIO_BENS'
,p_include_rowid_column=>false
,p_commit_each_row=>false
,p_error_handling_type=>'IGNORE'
);
wwv_flow_imp_shared.create_automation_action(
 p_id=>wwv_flow_imp.id(198227582805526379)
,p_automation_id=>wwv_flow_imp.id(198227317398526370)
,p_name=>'Gerar Embeddings em Lote'
,p_execution_sequence=>10
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_embedding_result CLOB;',
'BEGIN',
unistr('    -- **A MUDAN\00C7A EST\00C1 AQUI**'),
unistr('    -- Em vez de buscar um lote de 20, buscamos apenas UM \00DANICO item pendente.'),
'    FOR rec IN (',
'        SELECT ID_CADASTRO_DE_BENS, NOME_ITEM || '': '' || ESPECIFICACAO_TECNICA as ESPECIFICACAO_TECNICA',
'        FROM SISPAT_INVENTARIO_BENS',
'        WHERE EMBEDDING_VECTOR IS NULL',
'        AND ROWNUM <= 10',
'    ) LOOP',
unistr('        -- O bloco a seguir s\00F3 ser\00E1 executado uma vez por ciclo da automa\00E7\00E3o.'),
'        BEGIN',
'            l_embedding_result := POST_EMBEDDINGS(p_texto => rec.ESPECIFICACAO_TECNICA);',
'',
'            UPDATE SISPAT_INVENTARIO_BENS',
'            SET EMBEDDING_VECTOR = l_embedding_result',
'            WHERE ID_CADASTRO_DE_BENS = rec.ID_CADASTRO_DE_BENS;',
'',
unistr('            COMMIT; -- Salva a altera\00E7\00E3o deste \00FAnico item.'),
'',
'            apex_automation.log_info(''Item ID '' || rec.ID_CADASTRO_DE_BENS || '' processado com sucesso.'');',
'',
'        EXCEPTION',
'            WHEN OTHERS THEN',
unistr('                -- Se a chamada falhar, registra o erro para an\00E1lise posterior.'),
'                apex_automation.log_error(''Falha ao processar o item ID '' || rec.ID_CADASTRO_DE_BENS || '': '' || SQLERRM);',
'                -- Mesmo com erro, fazemos o COMMIT para registrar o log.',
'                COMMIT;',
'        END;',
'    END LOOP;',
'',
unistr('    -- A mensagem abaixo s\00F3 aparecer\00E1 se n\00E3o houver mais itens a processar.'),
unistr('    -- Se houver itens, o LOOP ser\00E1 executado e a automa\00E7\00E3o encerrar\00E1 depois.'),
unistr('    -- Vamos adicionar uma verifica\00E7\00E3o para um log mais claro.'),
'    IF SQL%ROWCOUNT = 0 THEN',
'         apex_automation.log_info(''Nenhum item pendente encontrado neste ciclo.'');',
'    END IF;',
'',
'END;'))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp.component_end;
end;
/
