prompt --application/shared_components/files/css_util_css
begin
--   Manifest
--     APP STATIC FILES: 147
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '696E7075742E6974656D2D6572726F72207B0D0A20202020626F726465722D636F6C6F723A20234436314531453B0D0A202020206F726465723A20303B0D0A7D0D0A0D0A2E6C6162656C2D6572726F72207B20202020200D0A20202020636F6C6F723A20';
wwv_flow_imp.g_varchar2_table(2) := '234436314531453B0D0A7D0D0A0D0A2E696D672D70726F6475746F20696D677B0D0A2020202077696474683A2031383070783B0D0A7D0D0A0D0A2E617065782D6974656D2D67726F75702D2D706F7075702D6C6F763A666F6375732D77697468696E207B';
wwv_flow_imp.g_varchar2_table(3) := '0D0A20202020626F726465722D7261646975733A20313070783B0D0A7D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(355739980329395440)
,p_file_name=>'css/util.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
