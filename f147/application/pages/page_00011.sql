prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>141255302529213555
,p_default_application_id=>147
,p_default_id_offset=>162801967839124536
,p_default_owner=>'BENS'
);
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'Detalhes Bens'
,p_alias=>'DETALHES-BENS'
,p_step_title=>'Detalhes dos Bens'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.se_desincorporado_3 td:nth-child(2) {',
'    border-left: 8px solid var(--ut-palette-warning);',
'}',
'.se_desincorporado_3 td {',
'    background-color: var(--ut-palette-warning-shade);',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(209670372492532255)
,p_plug_name=>'Detalhes Bens'
,p_title=>'Detalhes dos Bens'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'       DISTINCT ID_CADASTRO_DE_BENS,',
'       ID_STATUS,',
'       STATUS,',
'       ESPECIFICACAO_TECNICA,',
'       COR,',
'       NUMERO_REGISTRO_PATRIMONIAL,',
'       NOME_ITEM,',
'       FORNECEDOR,',
'       DESTINACAO,',
'       DATA_TOMBAMENTO,',
'       MODALIDADE_TOMBAMENTO,',
'       CAPACIDADE,',
'       VALOR_ORIGINAL_COMPRA,       ',
'       FONTE_RECURSO,',
'       HISTORICO,',
'       SITUACAO,',
'       ESTADO_CONSERVACAO,',
'       BEM_UNIAO,',
'       BEM_REVERSIVEL,',
'       NATUREZA,',
'       TEMPO_UTILIZACAO,',
'       VINCULACAO_CONTRATUAL,',
'       TIPO_BEM,',
'       CONTA_CONTABIL,',
'       DATA_DE_AVALIACAO,       ',
'       VALOR_JUSTO_MERCADO,',
'       VALOR_RESIDUAL',
'  from VW_APEX_SISPAT_INVENTARIO_BENS',
'  where REPLACE(REPLACE(REPLACE(NOME_ITEM, '','', '';''), ''#'', '';''),'':'','';'') = :P11_NOME_ITEM AND',
'    NUM_CNPJ_EMPRESA = :P11_NUM_CNPJ_EMPRESA AND',
'    (ID_STATUS = 1 OR ID_STATUS = 2 OR ID_STATUS = 3) AND',
'    (NUMERO_CONTRATO = :P11_NUMERO_CONTRATO OR NUMERO_CONTRATO IS NULL)',
'',
'  order by  NUMERO_REGISTRO_PATRIMONIAL ',
'    ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detalhes dos Bens'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(209670522545532256)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'Nenhum dado Encontrado'
,p_max_rows_per_page=>'50'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:CR,20:P20_ID_CADASTRO_DE_BENS:#ID_CADASTRO_DE_BENS#'
,p_detail_link_text=>'<span role="img" aria-label="Editar" class="fa fa-edit" title="Editar"></span>'
,p_owner=>'ARTUR.MEDEIROS'
,p_internal_uid=>46868554706407720
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209670649425532257)
,p_db_column_name=>'ID_CADASTRO_DE_BENS'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id Cadastro De Bens'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(232133398809912959)
,p_db_column_name=>'ID_STATUS'
,p_display_order=>20
,p_column_identifier=>'AC'
,p_column_label=>'Id Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(232133484993912960)
,p_db_column_name=>'STATUS'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Status'
,p_column_html_expression=>'<span class="row-class" status-se-desincorporado="#ID_STATUS#">#STATUS#</span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209670669236532258)
,p_db_column_name=>'NUMERO_REGISTRO_PATRIMONIAL'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00BA Patrimonial')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(60758395505190737)
,p_db_column_name=>'NOME_ITEM'
,p_display_order=>50
,p_column_identifier=>'AN'
,p_column_label=>'Nome do Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209670854599532259)
,p_db_column_name=>'ESPECIFICACAO_TECNICA'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>unistr('Especifica\00E7\00E3o T\00E9cnica')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209670880334532260)
,p_db_column_name=>'DATA_DE_AVALIACAO'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>unistr('Data Avalia\00E7\00E3o')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209670968968532261)
,p_db_column_name=>'COR'
,p_display_order=>80
,p_column_identifier=>'E'
,p_column_label=>'Cor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209671097680532262)
,p_db_column_name=>'FORNECEDOR'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'Fornecedor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209671266919532263)
,p_db_column_name=>'DESTINACAO'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>unistr('Destina\00E7\00E3o')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209671335750532264)
,p_db_column_name=>'SITUACAO'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Situacao'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209671642842532267)
,p_db_column_name=>'CAPACIDADE'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Capacidade'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209672040539532271)
,p_db_column_name=>'HISTORICO'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>unistr('Hist\00F3rico')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209672298874532274)
,p_db_column_name=>'BEM_REVERSIVEL'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>unistr('Bem Revers\00EDvel')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209672465218532275)
,p_db_column_name=>'NATUREZA'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'Natureza'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209672570045532277)
,p_db_column_name=>'VINCULACAO_CONTRATUAL'
,p_display_order=>170
,p_column_identifier=>'U'
,p_column_label=>unistr('Vincula\00E7\00E3o Contratual')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(209673036210532281)
,p_db_column_name=>'VALOR_RESIDUAL'
,p_display_order=>180
,p_column_identifier=>'Y'
,p_column_label=>'Valor Residual'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(220322750659764874)
,p_db_column_name=>'CONTA_CONTABIL'
,p_display_order=>190
,p_column_identifier=>'AA'
,p_column_label=>'Conta Contabil'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186253422459524909)
,p_db_column_name=>'MODALIDADE_TOMBAMENTO'
,p_display_order=>200
,p_column_identifier=>'AE'
,p_column_label=>'Modalidade Tombamento'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186254095056524915)
,p_db_column_name=>'DATA_TOMBAMENTO'
,p_display_order=>210
,p_column_identifier=>'AF'
,p_column_label=>'Data Tombamento'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186255122728524926)
,p_db_column_name=>'VALOR_ORIGINAL_COMPRA'
,p_display_order=>220
,p_column_identifier=>'AG'
,p_column_label=>'Valor Original Compra'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(187579897486019501)
,p_db_column_name=>'FONTE_RECURSO'
,p_display_order=>230
,p_column_identifier=>'AH'
,p_column_label=>'Fonte Recurso'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186256145146524936)
,p_db_column_name=>'ESTADO_CONSERVACAO'
,p_display_order=>240
,p_column_identifier=>'AI'
,p_column_label=>'Estado Conservacao'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186256829227524943)
,p_db_column_name=>'VALOR_JUSTO_MERCADO'
,p_display_order=>250
,p_column_identifier=>'AJ'
,p_column_label=>'Valor Justo Mercado'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186256987286524944)
,p_db_column_name=>'BEM_UNIAO'
,p_display_order=>260
,p_column_identifier=>'AK'
,p_column_label=>'Bem Uniao'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(186257584490524950)
,p_db_column_name=>'TEMPO_UTILIZACAO'
,p_display_order=>270
,p_column_identifier=>'AL'
,p_column_label=>'Tempo Utilizacao'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(188627244830541406)
,p_db_column_name=>'TIPO_BEM'
,p_display_order=>280
,p_column_identifier=>'AM'
,p_column_label=>'Tipo Bem'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(209735832168651303)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'469339'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NUMERO_REGISTRO_PATRIMONIAL:NOME_ITEM:STATUS:ESPECIFICACAO_TECNICA:DATA_DE_AVALIACAO:COR:FORNECEDOR:DESTINACAO:SITUACAO:CAPACIDADE:HISTORICO:BEM_REVERSIVEL:NATUREZA:VINCULACAO_CONTRATUAL:VALOR_RESIDUAL:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(232133295200912958)
,p_plug_name=>'Breadcrumb'
,p_title=>'Detalhe dos Bens'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useRegionTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(355228427769364912)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(237791483324237350)
,p_plug_name=>unistr('Caixas de Informa\00E7\00E3o')
,p_parent_plug_id=>wwv_flow_imp.id(232133295200912958)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc:t-CardsRegion--styleA'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SMART_FILTERS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DADOS_FILTRADOS AS (',
'    SELECT',
'        MAX(NUMERO_CONTRATO) as NUMERO_CONTRATO,',
'        MAX(NOME_PORTO) as NOME_PORTO,',
'        MAX(SIGLA_UF) as SIGLA_UF,',
'        MAX(ID_MODALIDADE_EXPLORACAO) as ID_MODALIDADE_EXPLORACAO,',
'        MAX(MODALIDADE_EXPLORACAO) as MODALIDADE_EXPLORACAO,',
'        MAX(NUM_CNPJ_EMPRESA) AS NUM_CNPJ_EMPRESA,',
'        MAX(NUM_CNPJ_EMPRESA_FORMATADO) AS NUM_CNPJ_EMPRESA_FORMATADO,',
'        CASE ',
'            WHEN MAX(DESC_RAZAO_SOCIAL) IS NULL ',
unistr('                THEN ''Sem identifica\00E7\00E3o'''),
'            ELSE MAX(DESC_RAZAO_SOCIAL)',
'        END AS EMPRESA,',
'        REPLACE(REPLACE(REPLACE(NOME_ITEM, '','', '';''), ''#'', '';''),'':'','';'') AS NOME_ITEM,',
'        TO_CHAR(COUNT(DISTINCT ID_CADASTRO_DE_BENS), ''999G999G999G990'')  AS QTD_ITENS',
'    FROM VW_APEX_SISPAT_INVENTARIO_BENS',
'',
'    WHERE REPLACE(REPLACE(REPLACE(NOME_ITEM, '','', '';''), ''#'', '';''),'':'','';'') = :P11_NOME_ITEM AND',
'    (ID_STATUS = 1 OR ID_STATUS = 2 OR ID_STATUS = 3) AND',
'    NUMERO_CONTRATO = :P11_NUMERO_CONTRATO OR NUMERO_CONTRATO IS NULL AND',
'    NUM_CNPJ_EMPRESA = :P11_NUM_CNPJ_EMPRESA ',
'    GROUP BY',
'        NOME_ITEM',
')',
'',
'SELECT',
'    1 AS SL,',
'    NUM_CNPJ_EMPRESA_FORMATADO AS CARD_VALUE,',
'    EMPRESA AS CARD_TITLE,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/NContrato.png'' AS CARD_ICON',
'FROM',
'    DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    2 AS SL,',
'    ''Contrato'' AS CARD_VALUE,',
'    NUMERO_CONTRATO AS CARD_TITLE,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Aut-port.png'' AS CARD_ICON',
'FROM',
'    DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    3 AS SL,',
'    ''Porto'' AS CARD_VALUE,',
'    NOME_PORTO AS CARD_TITLE,',
'    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nportos.png'' AS CARD_ICON',
'FROM',
'    DADOS_FILTRADOS',
'',
'UNION ALL',
'',
'SELECT',
'    4 AS SL,',
'    ''UF'' AS CARD_VALUE,',
unistr('    SIGLA_UF AS CARD_TITLE, -- Formata o n\00FAmero para melhor leitura'),
unistr('    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nufs.png'' AS CARD_ICON -- \00CDcone do Font APEX. Voc\00EA pode trocar.'),
'',
'FROM',
'    DADOS_FILTRADOS',
'UNION ALL',
'',
'SELECT',
'    5 AS SL,',
'    NOME_ITEM AS CARD_VALUE,',
unistr('    QTD_ITENS AS CARD_TITLE, -- Formata o n\00FAmero para melhor leitura'),
unistr('    ''https://des-apex.antaq.gov.br/ords/r/sfc_dev/files/static/v53/img/Nitens.png'' AS CARD_ICON -- \00CDcone do Font APEX. Voc\00EA pode trocar.'),
'',
'FROM',
'    DADOS_FILTRADOS'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(237791596915237351)
,p_region_id=>wwv_flow_imp.id(237791483324237350)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_VALUE'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'URL'
,p_icon_image_url=>'&CARD_ICON.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'SL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(186711216647623780)
,p_name=>'P11_NOME_ITEM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(209670372492532255)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204758889205746061)
,p_name=>'P11_NUMERO_CONTRATO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(209670372492532255)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304651245119118541)
,p_name=>'P11_NUM_CNPJ_EMPRESA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(209670372492532255)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(208974451275264678)
,p_name=>'Atualizar'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(210983250983006048)
,p_name=>'Refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(209670372492532255)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(210983346542006049)
,p_event_id=>wwv_flow_imp.id(210983250983006048)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(209670372492532255)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(232133637477912961)
,p_name=>'UpdateRowClass'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(209670372492532255)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(232133760915912962)
,p_event_id=>wwv_flow_imp.id(232133637477912961)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.row-class'').each(function() {',
'  $(this).closest(''tr'')',
'    .addClass(''se_desincorporado_''+$(this).attr(''status-se-desincorporado''));',
'});'))
);
wwv_flow_imp.component_end;
end;
/
