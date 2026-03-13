prompt --application/shared_components/logic/application_processes/gerar_zip
begin
--   Manifest
--     APPLICATION PROCESS: GERAR_ZIP
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(227926086462258290)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GERAR_ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_zip BLOB;',
'    l_nome_arquivo_zip VARCHAR2(255);',
'    v_id_bem NUMBER := apex_application.g_x01;',
'    v_patrimonio VARCHAR2(255) := apex_application.g_x02;',
'BEGIN',
'    l_nome_arquivo_zip := ''arquivos_bem_'' || v_patrimonio || ''.zip'';',
'',
'    FOR rec IN (',
'        SELECT nome_arquivo, conteudo_blob',
'        FROM tb_arquivos',
'        WHERE id_key = v_id_bem',
'    ) LOOP',
'        apex_zip.add_file (',
'            p_zipped_blob => l_zip,',
'            p_file_name   => rec.nome_arquivo,',
'            p_content     => rec.conteudo_blob',
'        );',
'    END LOOP;',
'',
'    apex_zip.finish(p_zipped_blob => l_zip);',
'',
'    IF dbms_lob.getlength(l_zip) IS NOT NULL THEN',
'        sys.htp.init;',
'        sys.owa_util.mime_header(''application/zip'', false);',
'        sys.htp.p(''Content-length: '' || dbms_lob.getlength(l_zip));',
'        sys.htp.p(''Content-Disposition: attachment; filename="'' || l_nome_arquivo_zip || ''"'');',
'        sys.owa_util.http_header_close;',
'',
'        sys.wpg_docload.download_file(l_zip);',
'',
'        apex_application.stop_apex_engine;',
'    END IF;',
'',
'EXCEPTION',
'    WHEN apex_application.e_stop_apex_engine THEN',
'        NULL;',
'    WHEN OTHERS THEN',
'        RAISE;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>45347001220841
);
wwv_flow_imp.component_end;
end;
/
