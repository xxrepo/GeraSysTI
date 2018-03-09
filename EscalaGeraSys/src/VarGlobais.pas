unit VarGlobais;

interface

Const
  glb_sUFs: array[0..27] of String = ('','AC','AL','AP','AM','BA','CE','DF','ES','GO',
                                      'MA','MG','MT','MS','PA','PB','PE','PI','PR',
                                      'RJ','RN','RR','RS','RO','SC','SP','SE','TO');

  REMUNERATUS_INI = 'REMUNERATUS.INI';

Var
   glb_hHND_Principal: THandle;

   {Variáveis do tipo String --------------------------------------------------}
   glb_sDatabase,
   glb_oConnecName,
   glb_sBancoOrgao,
   glb_sMarketing,
   glb_sAnoMesTrab,
   glb_sAnoMesTrava,
   glb_sQuadrimTrava,
   glb_sGeraRemBcoTrava,
   glb_sParcela,
   glb_sDescrParcela,
   glb_sParcComplementar,
   glb_sMatricula,
   glb_sCodigo,
   glb_sEmpresa,
   glb_sTipoDeOrgao,
   glb_sDescrMesAnoTrab,
   glb_sNomeForm1,
   glb_sNomeForm2,
   glb_sSistema,
   glb_sVersao,
   glb_sDtVer,
   glb_sTelefone1,
   glb_sTelefone2,
   glb_sPathAplicao,
   glb_sTextUltPesquisa,
   glb_sMultiOrgao,
   glb_sAlias: String;

   {Variáveis do tipo WideString ----------------------------------------------}
   glb_sCodigos: WideString;

   {Variáveis do tipo Integer -------------------------------------------------}
   glb_iHeight,
   glb_iError,
   glb_iIdOperLogado,
   glb_iWidth,
   glb_iIdOperExecut,
   glb_iHeigthBarraTop: Integer;

   {Variáveis do tipo Boolean -------------------------------------------------}
   glb_lMovEmAberto: Boolean;

implementation


end.
