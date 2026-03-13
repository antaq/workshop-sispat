prompt --application/shared_components/security/authentications/loginapexsfc
begin
--   Manifest
--     AUTHENTICATION: LoginApexSFC
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
 p_id=>wwv_flow_imp.id(218911947014542556)
,p_name=>'LoginApexSFC'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(37436827635605330)
,p_attribute_02=>'OPENID_CONNECT'
,p_attribute_03=>'https://login.microsoftonline.com/organizations/v2.0/.well-known/openid-configuration'
,p_attribute_07=>'profile,email,offline_access'
,p_attribute_09=>'preferred_username'
,p_attribute_11=>'Y'
,p_attribute_13=>'N'
,p_invalid_session_type=>'LOGIN'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_switch_in_session_yn=>'Y'
,p_reference_id=>86779198397380753
,p_version_scn=>44880990293513
);
wwv_flow_imp.component_end;
end;
/
