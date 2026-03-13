prompt --workspace/credentials/loginapexsfc_dev
begin
--   Manifest
--     CREDENTIAL: LoginApexSFC_Dev
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(37436827635605330)
,p_name=>'LoginApexSFC_Dev'
,p_static_id=>'loginapexsfc_dev'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
