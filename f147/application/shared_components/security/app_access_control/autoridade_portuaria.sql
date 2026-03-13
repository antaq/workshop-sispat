prompt --application/shared_components/security/app_access_control/autoridade_portuaria
begin
--   Manifest
--     ACL ROLE: Autoridade Portuaria
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
 p_id=>wwv_flow_imp.id(212166838580912549)
,p_static_id=>'AUTORIDADE_PORTUARIA'
,p_name=>'Autoridade Portuaria'
,p_version_scn=>44999377431652
);
wwv_flow_imp.component_end;
end;
/
