prompt --application/shared_components/security/app_access_control/administrador
begin
--   Manifest
--     ACL ROLE: Administrador
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_acl_role(
 p_id=>wwv_flow_imp.id(229530265986888793)
,p_static_id=>'ADMINISTRADOR'
,p_name=>'Administrador'
,p_version_scn=>44854956392915
);
wwv_flow_imp.component_end;
end;
/
