prompt --workspace/credentials/app_112_push_notifications_credentials
begin
--   Manifest
--     CREDENTIAL: App 112 Push Notifications Credentials
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
 p_id=>wwv_flow_imp.id(216814645142436159)
,p_name=>'App 112 Push Notifications Credentials'
,p_static_id=>'App_112_Push_Notifications_Credentials'
,p_authentication_type=>'KEY_PAIR'
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
