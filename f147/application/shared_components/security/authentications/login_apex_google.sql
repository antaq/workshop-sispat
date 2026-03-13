prompt --application/shared_components/security/authentications/login_apex_google
begin
--   Manifest
--     AUTHENTICATION: LOGIN_APEX_GOOGLE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(245766491582448460)
,p_name=>'LOGIN_APEX_GOOGLE'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(96079216712680613)
,p_attribute_02=>'GOOGLE'
,p_attribute_07=>'profile,email'
,p_attribute_09=>'#email#'
,p_attribute_11=>'Y'
,p_attribute_13=>'N'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'https://www.google.com/accounts/Logout'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_version_scn=>45333611260533
);
wwv_flow_imp.component_end;
end;
/
