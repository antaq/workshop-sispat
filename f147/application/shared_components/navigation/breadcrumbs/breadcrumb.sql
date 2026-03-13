prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(355228427769364912)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(210834044606541009)
,p_short_name=>unistr('Gerenciar Cap\00EDtulos')
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
,p_security_scheme=>wwv_flow_imp.id(212166434089909885)
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(232203845621973455)
,p_short_name=>'Bens Desincorporados'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(233233352895662774)
,p_parent_id=>wwv_flow_imp.id(355536757757379221)
,p_short_name=>'Detalhes dos Bens'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(237846057802512692)
,p_short_name=>unistr('Bens Pendentes de Desincorpora\00E7\00E3o')
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(319540361459455556)
,p_short_name=>'Gerenciador de API'
,p_link=>'f?p=&APP_ID.:30:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>30
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(322456710452758321)
,p_parent_id=>wwv_flow_imp.id(355228624512364913)
,p_short_name=>'Contratos'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(355228624512364913)
,p_short_name=>'Grupos Patrimoniais'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(355536757757379221)
,p_parent_id=>wwv_flow_imp.id(322456710452758321)
,p_short_name=>'Lista de Bens'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp.component_end;
end;
/
