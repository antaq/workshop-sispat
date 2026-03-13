prompt --application/shared_components/navigation/lists/menu_de_navegação
begin
--   Manifest
--     LIST: Menu de Navegação
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(355228826824364917)
,p_name=>unistr('Menu de Navega\00E7\00E3o')
,p_list_status=>'PUBLIC'
,p_version_scn=>45872758537938
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(355528661715365463)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('In\00EDcio')
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(232917310253780982)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Bens Desincorporados '
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cards'
,p_security_scheme=>wwv_flow_imp.id(355521614326365430)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(210833094415540993)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Gerenciar Cap\00EDtulos')
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-layout-header-sidebar-left'
,p_security_scheme=>wwv_flow_imp.id(355521614326365430)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(309091717415363666)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Gerenciar acesso do usu\00E1rio')
,p_list_item_link_target=>'f?p=&APP_ID.:20021:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_security_scheme=>wwv_flow_imp.id(355521614326365430)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'20021'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(319539444984455583)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Gerenciador de API'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-key'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'30'
);
wwv_flow_imp.component_end;
end;
/
