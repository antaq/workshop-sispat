prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 147
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(229916676526114672)
,p_build_option_name=>'Feature: Access Control'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44855032341568
,p_build_option_comment=>'Incorporate role based user authentication within your application and manage username mappings to application roles.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(355227788731364907)
,p_build_option_name=>'Comentado'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>44365509058642
);
wwv_flow_imp.component_end;
end;
/
