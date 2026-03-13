prompt --application/shared_components/security/authentications/semlogin
begin
--   Manifest
--     AUTHENTICATION: SemLogin
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
 p_id=>wwv_flow_imp.id(229920588285259113)
,p_name=>'SemLogin'
,p_scheme_type=>'NATIVE_OPEN_DOOR'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'document.addEventListener("DOMContentLoaded", function(e) {',
'   $(''.a-Wizard-title'').text(''Login: cdb - Cadastro de Bens'');',
'   $(''label[id*="USERNAME"]'').text(''Email da ANTAQ'');',
'   // $(''#LOGIN_BUTTON'').attr(''onclick'',''return checkEmail();'');',
'   document.getElementById(''wwvFlowForm'').onsubmit = function() {',
'      return checkEmail();',
'   };',
'});',
'function checkEmail(){',
'    let login = $(''input[id*="_USERNAME"]'').val().toLowerCase();',
'',
'    $(''#alertaLogin'').remove();',
'    if (login.indexOf(''@antaq.gov.br'') === -1 ) {',
'        $(''.a-Wizard'').prepend(''<h1 id="alertaLogin" style="text-align: center;padding: 1em;margin: 1em;background-color: var(--a-palette-color-7);">Insira seu email completo (@antaq.gov.br)</h1>'');',
'        return false;',
'    } else {',
'        // apex.submit({request:''LOGIN_BUTTON''});',
'        return true;',
'    }',
'}',
'</script>'))
,p_version_scn=>44855133928708
);
wwv_flow_imp.component_end;
end;
/
