prompt --application/shared_components/user_interface/lovs/grupo_de_bens
begin
--   Manifest
--     GRUPO DE BENS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(355591965555624897)
,p_lov_name=>'GRUPO DE BENS'
,p_lov_query=>'.'||wwv_flow_imp.id(355591965555624897)||'.'
,p_location=>'STATIC'
,p_version_scn=>44365617396593
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355592239467624897)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Terrenos'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355592600870624898)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Edif\00EDcios e benfeitorias')
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355593066623624898)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Instala\00E7\00F5es')
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355593390116624898)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('M\00E1quinas')
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355593780771624898)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Aparelhos'
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355594170799624898)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'Equipamentos'
,p_lov_return_value=>'6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355594639883624899)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>unistr('Equipamentos de Inform\00E1tica')
,p_lov_return_value=>'7'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355595038229624899)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'Sistemas aplicativos (softwares)'
,p_lov_return_value=>'8'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355595415225624899)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>unistr('M\00F3veis e utens\00EDlios')
,p_lov_return_value=>'9'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355595800747624900)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>unistr('Ve\00EDculos')
,p_lov_return_value=>'10'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355596228808624900)
,p_lov_disp_sequence=>11
,p_lov_disp_value=>'Ferramentas'
,p_lov_return_value=>'11'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355596589655624901)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>unistr('Pe\00E7as e Conjuntos de Reposi\00E7\00E3o')
,p_lov_return_value=>'12'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355597000365624901)
,p_lov_disp_sequence=>13
,p_lov_disp_value=>'Benfeitorias em Propriedades Arrendada'
,p_lov_return_value=>'13'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355597440732624901)
,p_lov_disp_sequence=>14
,p_lov_disp_value=>unistr('N\00E3o Aplic\00E1vel')
,p_lov_return_value=>'14'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355597825623624901)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>unistr('Infraestrutura Mar\00EDtima (Dragagem \2013 Aprofundamento, Sinaliza\00E7\00E3o, Prote\00E7\00E3o Mar\00EDtima, Outros - Infraestrutura Mar\00EDtima);')
,p_lov_return_value=>'15'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355598178251626628)
,p_lov_disp_sequence=>16
,p_lov_disp_value=>unistr('Infraestrutura Acostagem (Ber\00E7o e Cais, Pontos e Plataformas de Liga\00E7\00E3o, Rampa Ro Ro, Outro - Infraestrutura Acostagem)')
,p_lov_return_value=>'16'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355598480392627398)
,p_lov_disp_sequence=>17
,p_lov_disp_value=>unistr('Infraestrutura Terrestre (Gates, Estacionamento, Vias Internas, Linha F\00E9rrea, Outros - Infraestrutura Terrestre)')
,p_lov_return_value=>'17'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355598821453628565)
,p_lov_disp_sequence=>18
,p_lov_disp_value=>unistr('Armazenagem (P\00E1tios; Armaz\00E9ns; Tancagem, Silo)')
,p_lov_return_value=>'18'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355599110224629444)
,p_lov_disp_sequence=>19
,p_lov_disp_value=>unistr('Outros \2013 Armazenagem (Equipamentos, Guindaste, Port\00EAiner, Ship Loader, Correia Transportadora, Tubula\00E7\00E3o, Grab, Empilhadeira)')
,p_lov_return_value=>'19'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355599396622630773)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>unistr('Outros \2013 Equipamentos')
,p_lov_return_value=>'20'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(355599689046631693)
,p_lov_disp_sequence=>21
,p_lov_disp_value=>unistr('N\00E3o Aplic\00E1vel')
,p_lov_return_value=>'21'
);
wwv_flow_imp.component_end;
end;
/
