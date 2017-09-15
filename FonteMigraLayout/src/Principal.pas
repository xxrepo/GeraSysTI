unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, DBClient, Provider, SqlExpr,
  DBTables, ExtCtrls, Grids, DBGrids, ComCtrls, Gauges, cxGraphics, cxControls,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookAndFeels, cxLookAndFeelPainters, cxEdit, dxSkinsCore, cxContainer, cxSpinEdit, Mask, DBCtrls,
  dxSkinMcSkin, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White;

type
  TFrmPrincipal = class(TForm)
    btnFechar: TButton;
    OpenDialog1: TOpenDialog;
    spLimpaGrupoServidor: TSQLStoredProc;
    spAutlizaGen: TSQLStoredProc;
    cdsEventoFb: TClientDataSet;
    qryEventoFb: TSQLQuery;
    qryEventoFbID: TIntegerField;
    qryEventoFbDESCRICAO: TStringField;
    qryEventoFbCODIGO: TStringField;
    qryEventoFbTIPO: TStringField;
    qryEventoFbFORMA_CALC: TStringField;
    qryEventoFbID_CATEG: TIntegerField;
    qryEventoFbID_CATEG_TCM: TIntegerField;
    qryEventoFbPERCENT_HORA_EXTRA: TFMTBCDField;
    qryEventoFbHE_SOBRE_HORA_NORMAL: TStringField;
    qryEventoFbTIPO_BASE_CALC: TStringField;
    qryEventoFbINCIDE_SAL_FAMILIA: TStringField;
    qryEventoFbINCIDE_ATS: TStringField;
    qryEventoFbINCIDE_FERIAS: TStringField;
    qryEventoFbINCIDE_DEC_TERC: TStringField;
    qryEventoFbINCIDE_FALTA: TStringField;
    qryEventoFbINCIDE_PREVID: TStringField;
    qryEventoFbINCIDE_IRRF: TStringField;
    qryEventoFbINCIDE_OUTRA_BC1: TStringField;
    qryEventoFbINCIDE_OUTRA_BC2: TStringField;
    qryEventoFbINCIDE_OUTRA_BC3: TStringField;
    qryEventoFbVALOR_FIXO: TFMTBCDField;
    qryEventoFbDIVISOR: TFMTBCDField;
    qryEventoFbSUBDIVISOR: TFMTBCDField;
    qryEventoFbGERA_RAIS: TStringField;
    qryEventoFbCOPIA_MES_ANTERIOR: TStringField;
    qryEventoFbPERMITIR_USUARIO_ALTER: TStringField;
    qryEventoFbDESCR_CATEGORIA: TStringField;
    qryEventoFbDESCR_FORMA_CALC: TStringField;
    qryEventoFbDESCR_BASE_CALC: TStringField;
    qryEventoFbDESCR_CATEG_TCM: TStringField;
    qryUltID: TSQLQuery;
    cdsBCMesServidor: TClientDataSet;
    cdsBCMesServidoranomes: TStringField;
    cdsBCMesServidormatricula: TStringField;
    qryEvento: TSQLQuery;
    qryEventoCODIGO: TStringField;
    qryEventoDESCRICAO: TStringField;
    qryEventoNATUREZA: TStringField;
    qryEventoPERMANEN: TStringField;
    qryEventoTIPO: TStringField;
    qryEventoINCIDEINSS: TStringField;
    qryEventoINCIDEPREV: TStringField;
    qryEventoINCIDEIRRF: TStringField;
    qryEventoVALOR: TFMTBCDField;
    qryEventoINCIDE13: TStringField;
    qryEventoINCIDEINSS13: TStringField;
    qryEventoINCIDEIPM13: TStringField;
    qryEventoINCIDEANU: TStringField;
    qryEventoINCIDETRI: TStringField;
    qryEventoINCIDEQUI: TStringField;
    qryEventoINCIDECONTRSIND: TStringField;
    qryEventoINCIDEFER: TStringField;
    qryEventoOBS: TStringField;
    qryEventoINCIDEADI: TStringField;
    qryEventoMEDIA13: TStringField;
    qryEventoMEDFERIAS: TStringField;
    qryEventoALTERADO: TStringField;
    qryEventoTIPOGRAT: TStringField;
    qryEventoNUMGRAT: TStringField;
    qryEventoCODTCM: TStringField;
    qryEventoDESCTOTAL: TStringField;
    qryEventoTIPAMPARO: TStringField;
    qryEventoNUMAMPARO: TStringField;
    qryEventoDATAMPARO: TSQLTimeStampField;
    qryEventoPUBAMPARO: TSQLTimeStampField;
    qryEventoTIPDECRETO: TStringField;
    qryEventoNUMDECRETO: TStringField;
    qryEventoDATDECRETO: TSQLTimeStampField;
    qryEventoPUBDECRETO: TSQLTimeStampField;
    qryEventoCLASSIFICA: TStringField;
    qryEventoFLAGS: TStringField;
    qryEventoSTATUS: TStringField;
    qryEventoTIPAMPEXT: TStringField;
    qryEventoNUMAMPEXT: TStringField;
    qryEventoDATAMPEXT: TSQLTimeStampField;
    qryEventoPUBAMPEXT: TSQLTimeStampField;
    qryEventoTIPDECEXT: TStringField;
    qryEventoNUMDECEXT: TStringField;
    qryEventoDATDECEXT: TSQLTimeStampField;
    qryEventoPUBDECEXT: TSQLTimeStampField;
    qryEventoOBSRESERVA: TStringField;
    qryEventoCONSIGPARCTOT: TStringField;
    qryEventoDESCRPERC: TStringField;
    qryEventoDUPLIC: TStringField;
    qryEventoBASEFALTAS: TStringField;
    qryEventoPROPBASE: TStringField;
    qryEventoBASESALFAMPREV: TStringField;
    qryEventoBASESALFAMINSS: TStringField;
    qryEventoBASEHE: TStringField;
    qryEventoBASEAD: TStringField;
    qryEventoAPAGTEMP: TStringField;
    qryEventoBASELIQ: TStringField;
    qryEventoSTATUSORC: TStringField;
    qryEventoPARTEVENT: TStringField;
    qryEventoCONSIGNA: TStringField;
    qryEventoMGMCONSIG: TStringField;
    PageControl1: TPageControl;
    tsConfig: TTabSheet;
    GroupBox1: TGroupBox;
    chkImportTabCBO: TCheckBox;
    chkTabAliquotas: TCheckBox;
    chkTabCargos: TCheckBox;
    chkTabDeptos: TCheckBox;
    chkTabEventos: TCheckBox;
    chkTabEntidFinanc: TCheckBox;
    chkTabSubUnidOrcam: TCheckBox;
    chkCadPrestServ: TCheckBox;
    chkCadServidor: TCheckBox;
    chkMovmFinanc: TCheckBox;
    chkConfigOrgao: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edMatricServidIni: TEdit;
    qryEventoFbMAX_X_VENCTO_BASE: TFMTBCDField;
    qryEventoFbSEM_USO: TStringField;
    qryEventoFbID_SYS_ANTER: TStringField;
    qryEventoFbCONT_COD_ITEM: TStringField;
    qryEventoFbCONT_SUB_ELEMEN_DESP: TStringField;
    qryEventoFbCONT_CONTA_CORRENTE: TStringField;
    qryMovServidLO: TSQLQuery;
    qryMovServidLOTIPO: TIntegerField;
    qryMovServidLOMATRICULA: TStringField;
    qryMovServidLOANOREF: TStringField;
    qryMovServidLOMESREF: TStringField;
    qryMovServidLODTINICIO: TSQLTimeStampField;
    qryMovServidLOCODFOL: TStringField;
    qryMovServidLOCODGFIP: TStringField;
    qryMovServidLOCODRAIS: TStringField;
    qryMovServidLOCODTRIB: TStringField;
    qryMovServidLODTFIM: TSQLTimeStampField;
    qryMovServidLODTAVISO: TSQLTimeStampField;
    qryMovServidLOOBS: TStringField;
    qryMovServidLOCPFPENSION: TStringField;
    qryMovServidLODTDECRMOV: TSQLTimeStampField;
    qryMovServidLODTPUBLICMOV: TSQLTimeStampField;
    qryMovServidLONUMDECMOV: TStringField;
    qryMovServidLOTIPODECRMOV: TStringField;
    qryMovServidLOCODSIPREV: TStringField;
    qryMovServidLOTMP_MATER_INSS: TSmallintField;
    qryMovServidLOTMP_MATER_PREVM: TSmallintField;
    qryMovServidLODIASGEST: TIntegerField;
    provMovServidLO: TDataSetProvider;
    cdsMovServidLO: TClientDataSet;
    cdsMovServidLOTIPO: TIntegerField;
    cdsMovServidLOMATRICULA: TStringField;
    cdsMovServidLOANOREF: TStringField;
    cdsMovServidLOMESREF: TStringField;
    cdsMovServidLODTINICIO: TSQLTimeStampField;
    cdsMovServidLOCODFOL: TStringField;
    cdsMovServidLOCODGFIP: TStringField;
    cdsMovServidLOCODRAIS: TStringField;
    cdsMovServidLOCODTRIB: TStringField;
    cdsMovServidLODTFIM: TSQLTimeStampField;
    cdsMovServidLODTAVISO: TSQLTimeStampField;
    cdsMovServidLOOBS: TStringField;
    cdsMovServidLOCPFPENSION: TStringField;
    cdsMovServidLODTDECRMOV: TSQLTimeStampField;
    cdsMovServidLODTPUBLICMOV: TSQLTimeStampField;
    cdsMovServidLONUMDECMOV: TStringField;
    cdsMovServidLOTIPODECRMOV: TStringField;
    cdsMovServidLOCODSIPREV: TStringField;
    cdsMovServidLOTMP_MATER_INSS: TSmallintField;
    cdsMovServidLOTMP_MATER_PREVM: TSmallintField;
    cdsMovServidLODIASGEST: TIntegerField;
    Label3: TLabel;
    edSecretMigra: TEdit;
    TabConexao: TTabSheet;
    lblBancoOrigem: TLabel;
    lblBancoDestino: TLabel;
    dbBancoDestino: TEdit;
    btnBancoDestino: TButton;
    btnConectBanco: TButton;
    Panel2: TPanel;
    dbMesAtual: TcxComboBox;
    cbBanco: TcxComboBox;
    dspEventoFB: TDataSetProvider;
    cdsEventoFbID: TIntegerField;
    cdsEventoFbDESCRICAO: TStringField;
    cdsEventoFbCODIGO: TStringField;
    cdsEventoFbTIPO: TStringField;
    cdsEventoFbFORMA_CALC: TStringField;
    cdsEventoFbID_CATEG: TIntegerField;
    cdsEventoFbID_CATEG_TCM: TIntegerField;
    cdsEventoFbPERCENT_HORA_EXTRA: TFMTBCDField;
    cdsEventoFbHE_SOBRE_HORA_NORMAL: TStringField;
    cdsEventoFbTIPO_BASE_CALC: TStringField;
    cdsEventoFbINCIDE_SAL_FAMILIA: TStringField;
    cdsEventoFbINCIDE_ATS: TStringField;
    cdsEventoFbINCIDE_FERIAS: TStringField;
    cdsEventoFbINCIDE_DEC_TERC: TStringField;
    cdsEventoFbINCIDE_FALTA: TStringField;
    cdsEventoFbINCIDE_PREVID: TStringField;
    cdsEventoFbINCIDE_IRRF: TStringField;
    cdsEventoFbINCIDE_OUTRA_BC1: TStringField;
    cdsEventoFbINCIDE_OUTRA_BC2: TStringField;
    cdsEventoFbINCIDE_OUTRA_BC3: TStringField;
    cdsEventoFbVALOR_FIXO: TFMTBCDField;
    cdsEventoFbDIVISOR: TFMTBCDField;
    cdsEventoFbSUBDIVISOR: TFMTBCDField;
    cdsEventoFbGERA_RAIS: TStringField;
    cdsEventoFbCOPIA_MES_ANTERIOR: TStringField;
    cdsEventoFbPERMITIR_USUARIO_ALTER: TStringField;
    cdsEventoFbDESCR_CATEGORIA: TStringField;
    cdsEventoFbDESCR_FORMA_CALC: TStringField;
    cdsEventoFbDESCR_BASE_CALC: TStringField;
    cdsEventoFbDESCR_CATEG_TCM: TStringField;
    cdsEventoFbMAX_X_VENCTO_BASE: TFMTBCDField;
    cdsEventoFbSEM_USO: TStringField;
    cdsEventoFbCONT_COD_ITEM: TStringField;
    cdsEventoFbCONT_SUB_ELEMEN_DESP: TStringField;
    cdsEventoFbCONT_CONTA_CORRENTE: TStringField;
    cdsEventoFbID_SYS_ANTER: TStringField;
    dbgEvento: TDBGrid;
    dtsEventoFolha: TDataSource;
    cdsEventoFolha: TClientDataSet;
    cdsEventoFolhaID_EVENTO: TIntegerField;
    cdsEventoFolhaDESCR_EVENTO: TStringField;
    cdsEventoFolhaX: TStringField;
    chkEventoFixo: TCheckBox;
    btnMigrar: TButton;
    btnAtualizaGens: TButton;
    Label4: TLabel;
    cbTipoOrgao: TcxComboBox;
    speAno: TcxSpinEdit;
    TabSheet1: TTabSheet;
    cdsCompatibEvento: TClientDataSet;
    cdsCompatibEventoretro_hora_extra: TStringField;
    cdsCompatibEventoadicional_noturno: TStringField;
    cdsCompatibEventopo_de_giz: TStringField;
    cdsCompatibEventofaltas: TStringField;
    cdsCompatibEventoadiantamento_salario: TStringField;
    cdsCompatibEventosalario_familia: TStringField;
    cdsCompatibEventoinss: TStringField;
    cdsCompatibEventoirrf: TStringField;
    cdsCompatibEventovale_transporte: TStringField;
    cdsCompatibEventocontrib_sindical: TStringField;
    cdsCompatibEventoresc_aviso_previo: TStringField;
    cdsCompatibEvento13_salario: TStringField;
    cdsCompatibEventoadic_ferias: TStringField;
    cdsCompatibEventoferias_porporc: TStringField;
    cdsCompatibEventoimp_renda_13_sal: TStringField;
    cdsCompatibEventoprevid_municipal: TStringField;
    dsCompatibEvento: TDataSource;
    cdsCompatibEventohoras_extras: TStringField;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox4: TGroupBox;
    cdsCompatibVinculo: TClientDataSet;
    dsVinculos: TDataSource;
    cdsCompatibVinculocodigo: TStringField;
    cdsCompatibVinculodescricao: TStringField;
    cdsCompatibVinculotcm: TIntegerField;
    cdsCompatibVinculoefetivo: TStringField;
    DBGrid1: TDBGrid;
    TabLog: TTabSheet;
    memLog: TMemo;
    Gauge1: TGauge;
    Panel1: TPanel;
    cdsEventoAlt: TClientDataSet;
    qryEventoAlt: TSQLQuery;
    provEventoAlt: TDataSetProvider;
    DBGrid2: TDBGrid;
    dsEventoAlt: TDataSource;
    qryEventoAltID: TIntegerField;
    qryEventoAltDESCRICAO: TStringField;
    qryEventoAltCODIGO: TStringField;
    qryEventoAltTIPO: TStringField;
    qryEventoAltFORMA_CALC: TStringField;
    qryEventoAltID_CATEG: TIntegerField;
    qryEventoAltID_CATEG_TCM: TIntegerField;
    qryEventoAltPERCENT_HORA_EXTRA: TFMTBCDField;
    qryEventoAltHE_SOBRE_HORA_NORMAL: TStringField;
    qryEventoAltTIPO_BASE_CALC: TStringField;
    qryEventoAltINCIDE_SAL_FAMILIA: TStringField;
    qryEventoAltINCIDE_ATS: TStringField;
    qryEventoAltINCIDE_FERIAS: TStringField;
    qryEventoAltINCIDE_DEC_TERC: TStringField;
    qryEventoAltINCIDE_FALTA: TStringField;
    qryEventoAltINCIDE_PREVID: TStringField;
    qryEventoAltINCIDE_IRRF: TStringField;
    qryEventoAltINCIDE_OUTRA_BC1: TStringField;
    qryEventoAltINCIDE_OUTRA_BC2: TStringField;
    qryEventoAltINCIDE_OUTRA_BC3: TStringField;
    qryEventoAltVALOR_FIXO: TFMTBCDField;
    qryEventoAltDIVISOR: TFMTBCDField;
    qryEventoAltSUBDIVISOR: TFMTBCDField;
    qryEventoAltMAX_X_VENCTO_BASE: TFMTBCDField;
    qryEventoAltGERA_RAIS: TStringField;
    qryEventoAltCOPIA_MES_ANTERIOR: TStringField;
    qryEventoAltPERMITIR_USUARIO_ALTER: TStringField;
    qryEventoAltSEM_USO: TStringField;
    qryEventoAltID_SYS_ANTER: TStringField;
    qryEventoAltBC_MARGEM_CONSIG: TStringField;
    cdsEventoAltID: TIntegerField;
    cdsEventoAltDESCRICAO: TStringField;
    cdsEventoAltCODIGO: TStringField;
    cdsEventoAltTIPO: TStringField;
    cdsEventoAltFORMA_CALC: TStringField;
    cdsEventoAltID_CATEG: TIntegerField;
    cdsEventoAltID_CATEG_TCM: TIntegerField;
    cdsEventoAltPERCENT_HORA_EXTRA: TFMTBCDField;
    cdsEventoAltHE_SOBRE_HORA_NORMAL: TStringField;
    cdsEventoAltTIPO_BASE_CALC: TStringField;
    cdsEventoAltINCIDE_SAL_FAMILIA: TStringField;
    cdsEventoAltINCIDE_ATS: TStringField;
    cdsEventoAltINCIDE_FERIAS: TStringField;
    cdsEventoAltINCIDE_DEC_TERC: TStringField;
    cdsEventoAltINCIDE_FALTA: TStringField;
    cdsEventoAltINCIDE_PREVID: TStringField;
    cdsEventoAltINCIDE_IRRF: TStringField;
    cdsEventoAltINCIDE_OUTRA_BC1: TStringField;
    cdsEventoAltINCIDE_OUTRA_BC2: TStringField;
    cdsEventoAltINCIDE_OUTRA_BC3: TStringField;
    cdsEventoAltVALOR_FIXO: TFMTBCDField;
    cdsEventoAltDIVISOR: TFMTBCDField;
    cdsEventoAltSUBDIVISOR: TFMTBCDField;
    cdsEventoAltMAX_X_VENCTO_BASE: TFMTBCDField;
    cdsEventoAltGERA_RAIS: TStringField;
    cdsEventoAltCOPIA_MES_ANTERIOR: TStringField;
    cdsEventoAltPERMITIR_USUARIO_ALTER: TStringField;
    cdsEventoAltSEM_USO: TStringField;
    cdsEventoAltID_SYS_ANTER: TStringField;
    cdsEventoAltBC_MARGEM_CONSIG: TStringField;
    btnGravar: TButton;
    btnDuplicReg: TButton;
    qryEventoCopy: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    FMTBCDField5: TFMTBCDField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    edPesqEvento: TEdit;
    qryQtdServidMigra: TSQLQuery;
    Label11: TLabel;
    qryUltServid: TSQLQuery;
    procedure btnMigrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsPessoaFisicaFBBeforeClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBancoDestinoClick(Sender: TObject);
    procedure btnConectBancoClick(Sender: TObject);
    procedure btnDesabilTriggersClick(Sender: TObject);
    procedure btnAtualizaGensClick(Sender: TObject);
    procedure btnAtualizaMovimEstFuncClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkEventoFixoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbMesAtualClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cdsEventoAltAfterInsert(DataSet: TDataSet);
    procedure cdsEventoAltAfterEdit(DataSet: TDataSet);
    procedure cdsEventoAltAfterPost(DataSet: TDataSet);
    procedure btnDuplicRegClick(Sender: TObject);
    procedure edPesqEventoChange(Sender: TObject);
    procedure edPesqEventoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    // pv_iIdEventoInexist, pv_iId_UO_Temp, pv_iUltIdPagPrestServ: Integer;
    FListaBancoDados: TStringList;
    FListaMesTabela: TStringList;
    pv_lSalvar: Boolean;
    pv_iUltIdPF: Integer;
    pv_iIdPF, pv_iIdDepend: Integer;
    pv_AnoMesAtual: string;
    pv_mes: string;
    pv_banco: string;
    pv_lSalvaEventoAlt: Boolean;

    Procedure MigraTabIRRF;
    Procedure MigraTabAliqPrevidINSS;
    Procedure MigraTabSalFamilia;

    Procedure MigraCargo();

    Procedure MigraTabEventos;        // ok
    //procedure MigraTabSetores; // ok
    //procedure MigraTabMotivosMudaCargo;
    //procedure MigraTabDeptos;  // ok
    Procedure MigraTabUnidLotacao;
    Procedure MigraTabEstFunc; // ok
    Procedure MigraTabSubUnidOrcamentarias; // ok
    //Procedure MigraHistReajusteSal;
    //Procedure MigraTabFatorProgresSal; // ok
    //Procedure MigraTabCategFuncionais; // ok
    //Procedure MigraTabBancos;  // ok
    procedure ImportaCBO; // ok
    Procedure MigraServidor;
    //Procedure MigraPrestadorServico; // falta testar
    Function MigraPessoaFisica(CPF: string): Integer; // falta testar
    function MigraContaBancaria(sIdServid: string): Integer;
    Function MigraMovimEstFuncional(sMatric: String; iIdServidor: Integer): Integer;
    Function MigraServDepedente: Integer;
    //Function MigraHistMudaCargo: Integer;
    //Function MigraDepBancario: Integer;
    //Function MigraHistTransfSubUndOrcam: Integer;
    Function MigraEventosFixos: Integer; // falta testar
    Function MigraEventosMes: Integer; // falta testar
    //Function MigraEventosCalc: Integer; // falta testar
    //Function MigraBCalcMes: Integer; // falta testar
    //Function MigraDeducaoEntidPrevid: Integer;
    //Function MigraAtestadoMedico: Integer; // falta testar
    Function MigraPagtoDiaria: Integer; // falta testar
    //Function MigraPagtoPrestServico: Integer;
    Function MigraHistFerias: Integer;  // falta testar
    //Function MigraEscalaFerias: Integer;
    //Function MigraCargaHorProfessor: Integer;  // falta testar
    //Procedure MigraConfigDepositoBancario;
    //Procedure MigraConfigPortDiaria;
    //Function MigraPF_PrestServico: Integer;
    //Function MigraPJ_PrestServico: Integer;
    function ProxId(sNomeTab: String): integer;
    Function CalcDigito(sCodigo: String): String;
    Function Iif(bExpressao: Boolean; sRet1, sRet2: String): String;
    Function SalvaRegistro(CDS: TClientDataSet): Integer;
    procedure CancelaRegistro(oCDS1: TClientDataSet);
    Function AtribuiField(oCDS1: TClientDataSet; oQRY1: TQuery; sField1,sField2: String): Integer;
    function Pesquisa(Tabela, CampoPesq, TextPesq, CampoRet: string): string;

    Procedure MigraGrupoTabAliquotas;
    Procedure MigraGrupoTabCargos;
    procedure MigraGrupoTabDeptoUnidLotacao;
    procedure MigraGrupoTabEventosEstFunc;
    procedure MigraGrupoEntidFinanc;
    procedure MigraGrupoCCustos;
    procedure AtualizaGenerator(sNomeTab: String; iUltId: Integer);
    function PesquisaPdox(sTabela, sCampoPesq, sTextPesq, sCampoRet: String): String;
    function MigraDependente: Integer;
    //function AddEvento: Integer;
    function ValidaCodTab(sCod, sNomeTab,sCampoCod: String): Boolean;
    procedure DispConteudoTab(oCds1: TClientDataSet);
    procedure MigraGrupoPrestServico;
    //procedure MigraConfigOrgaoSys;
    //procedure MigraControlProcess;
    function PreencheZeros(sTexto: String; iTam: Integer): String;
    //procedure SalvaEnderBanco;
    //function GetEnderBanco(sBanco: string): string;
    function PrimeiroRegistro(sTabela: string): string;
    function Escolaridade(sAtual: string): integer;
    function EstadoCivil(sAtual: string): integer;
    function ParentescoDepend(sAtual: string): string;
    function EstadoFuncional(sMatric: String): String;
    procedure MigraMovimFinanceira;
    function AjustaMatricula(sMatricula: string): string;
    function ConectarBancos: Boolean;
    function DesconectarBancos: Boolean;
    function ExisteEvento(Codigo: Integer): Boolean;
    function ExisteEstadoFuncional(Codigo: Integer): Boolean;
    function PesquisaCargoNome(const Nome: string): Integer;
    function ExecutaSQL(Text: string): Boolean;
    procedure OpenServidorMes(const Mes, Matricula: string);
    procedure AtualizaEventoFolha;
    function OpenSQL(DataSet: TDataSet; SQL: string): Boolean;
    procedure MigraEventoFixoServidor;
    procedure AbreTabCompatibilidade;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses udmPrincipal, dmTabAliquotas, DispTabMigrada, udmTabDiversas, FolhaFuncs,
  udmCadLanctos, StrUtils, DateUtils, dmMovimento;

{$R *.dfm}

function TFrmPrincipal.ExecutaSQL(Text: string): Boolean;
var
  Query: TSQLQuery;
begin

  Query := TSQLQuery.Create(NIL);

  try

    Query.SQLConnection := dmPrincipal.connectionGERA;
    Query.SQL.Text := Text;
    Query.ExecSQL;
    Result := True;

   finally
     Query.Free;
   end;

end;

function TFrmPrincipal.OpenSQL(DataSet: TDataSet; SQL: string): Boolean;
var
  i: Integer;
  s: string;
  Query: TSQLQuery;
begin

  Query := TSQLQuery.Create(NIL);

  try

    Query.SQLConnection := dmPrincipal.connectionGERA;
    Query.SQL.Text := SQL;
    Query.Open;

    while not Query.Eof do
    begin
      DataSet.Append;
      for i := 0 to Query.Fields.Count - 1 do
      begin
        s := Query.Fields[i].FieldName;
        if Assigned(DataSet.FindField(s)) then
          DataSet.FieldByName(s).Value := Query.Fields[i].Value;
      end;
      DataSet.Post;
      Query.Next;
    end;

    Result := True;

   finally
     Query.Free;
   end;

end;

function TFrmPrincipal.PesquisaCargoNome(const Nome: string): Integer;
var
  tDataSet: TSQLQuery;
begin

   tDataSet := TSQLQuery.Create(NIL);
   tDataSet.SQLConnection := dmPrincipal.connectionGERA;
   tDataSet.SQL.Text := 'SELECT ID FROM CARGO_FUNCAO WHERE DESCRICAO = '+QuotedStr(Nome)+' AND ID_CBO IS NOT NULL';

   try

     tDataSet.Open;

     if tDataSet.IsEmpty then
       Result := 0
     else
       Result := tDataSet.Fields[0].AsInteger;

   finally
     tDataSet.Free;
   end;

end;

function TFrmPrincipal.ExisteEvento(Codigo: Integer): Boolean;
var
  tDataSet: TSQLQuery;
begin

  tDataSet := TSQLQuery.Create(NIL);
  tDataSet.SQLConnection := dmPrincipal.connectionGERA;
  tDataSet.SQL.Text := 'SELECT COUNT(*) FROM EVENTO WHERE ID = :1';

  tDataSet.Params[0].Value := Codigo;

  try
    tDataSet.Open;
    Result := (tDataSet.Fields[0].AsInteger > 0);
  finally
    tDataSet.Close;
    tDataSet.Free;
  end;

end;

function TFrmPrincipal.ExisteEstadoFuncional(Codigo: Integer): Boolean;
var
  tDataSet: TSQLQuery;
begin

  tDataSet := TSQLQuery.Create(NIL);
  tDataSet.SQLConnection := dmPrincipal.connectionGERA;
  tDataSet.SQL.Text := 'SELECT COUNT(*) FROM ESTADO_FUNCIONAL WHERE ID = :1';

  tDataSet.Params[0].Value := Codigo;

  try
    tDataSet.Open;
    Result := (tDataSet.Fields[0].AsInteger > 0);
  finally
    tDataSet.Close;
    tDataSet.Free;
  end;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  i, iRemove: Integer;
  sArquivoBanco, sNomeBanco: string;
begin

  iRemove := -1;
  PageControl1.ActivePageIndex := 0;

  kListFiles(FListaBancoDados, '*.fdb');

  cbBanco.Properties.Items.Clear;

  for i := 0 to FListaBancoDados.Count - 1 do
  begin
    sArquivoBanco := FListaBancoDados[i];
    sNomeBanco := ReplaceStr(UpperCase(ExtractFileName(sArquivoBanco)), '.FDB', '');
    if sNomeBanco = 'REMUNERATUS' then
    begin
      dbBancoDestino.Text := sArquivoBanco;
      iRemove := i;
    end else
      cbBanco.Properties.Items.Add(sNomeBanco);
  end;

  cbBanco.ItemIndex := 8;

  if iRemove > -1 then
    FListaBancoDados.Delete(iRemove);

  cbBanco.Properties.DropDownRows := FListaBancoDados.Count;
  cbBanco.ItemIndex := 0;

  //dbBancoDestino.Text := GetEnderBanco('BANCO_GS');
  //dbBancoOrigem.Text := GetEnderBanco('BANCO_EXTERNO');

end;

procedure TFrmPrincipal.btnMigrarClick(Sender: TObject);
begin

  PageControl1.ActivePage := TabLog;

  memLog.Lines.Clear;
  pv_lSalvar := True;

  pv_banco := IntToStr(cbTipoOrgao.ItemIndex+1);

  pv_mes         := Copy(dbMesAtual.Text, 4, 3);

  {
  dmPrincipal.SQLConnection1.Connected := False;
  dmPrincipal.SQLConnection1.Params.Values['Database'] := edEnderBanco.Text;
  dmPrincipal.SQLConnection1.Connected := True;
  }
  //if chkImportTabCBO.Checked    then ImportaCBO;
  //if chkTabAliquotas.Checked    then MigraGrupoTabAliquotas;

  if chkTabCargos.Checked then
    MigraGrupoTabCargos();

  if chkTabDeptos.Checked then
    MigraGrupoTabDeptoUnidLotacao(); {ver com Andrew}

  if chkTabEventos.Checked then
    MigraGrupoTabEventosEstFunc();

  if chkTabEntidFinanc.Checked  then
     MigraGrupoEntidFinanc;

  if chkTabSubUnidOrcam.Checked then
     MigraGrupoCCustos();

  //if chkCadPrestServ.Checked    then MigraGrupoPrestServico;

  if chkCadServidor.Checked then
    MigraServidor();

  if chkMovmFinanc.Checked then
    MigraMovimFinanceira();

  if chkEventoFixo.Checked then
    MigraEventoFixoServidor();

  //btnAtualizaGens.Click;

  Screen.Cursor := crDefault;
  btnFechar.SetFocus;

end;

procedure TFrmPrincipal.btnGravarClick(Sender: TObject);
Var
  sDir: string;
begin
   sDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

   if cdsCompatibEvento.State in [dsInsert,dsEdit] then
   begin
      cdsCompatibEvento.Post;
      cdsCompatibEvento.SaveToFile(sDir+cdsCompatibEvento.Name+'.cds');
   end;

   if cdsCompatibVinculo.State in [dsInsert,dsEdit] then
   begin
      cdsCompatibVinculo.Post;
      cdsCompatibVinculo.SaveToFile(sDir+cdsCompatibVinculo.Name+'.cds');
   end;

   if pv_lSalvaEventoAlt then
   begin
      if cdsEventoAlt.State in [dsInsert,dsEdit] then cdsEventoAlt.Post;
      SalvaTransacao(cdsEventoAlt);
   end;

end;

Procedure TFrmPrincipal.MigraGrupoTabAliquotas;
begin
   MigraTabIRRF;
   MigraTabAliqPrevidINSS;
   MigraTabSalFamilia;
end;

Procedure TFrmPrincipal.MigraGrupoTabCargos;
begin
   //MigraTabMotivosMudaCargo;
   //MigraTabFatorProgresSal;
   //MigraTabCategFuncionais;
   MigraCargo();
   //MigraHistReajusteSal;
end;

Procedure TFrmPrincipal.MigraGrupoTabDeptoUnidLotacao;
begin
   //MigraTabDeptos;
   MigraTabUnidLotacao();
end;

Procedure TFrmPrincipal.MigraGrupoTabEventosEstFunc;
begin
   MigraTabEventos();
   MigraTabEstFunc();
end;

Procedure TFrmPrincipal.MigraGrupoEntidFinanc;
begin
   //MigraTabBancos;
end;

Procedure TFrmPrincipal.MigraGrupoCCustos;
begin
   //MigraTabSetores;
   MigraTabSubUnidOrcamentarias();
   //MigraConfigDepositoBancario;
   //MigraConfigAbonoFUNDEB; obs.: somente pra prefeitura de rondon
   //MigraConfigPortDiaria;
   // a tabela 'orden_despesa' já vai preenchida, mas precisa alterar
   //  os ordens de despesa
end;

Procedure TFrmPrincipal.MigraGrupoPrestServico;
begin
   Screen.Cursor := crHourGlass;
   //MigraPrestadorServico;
   {
   if pv_lSalvar then
   begin
      AtualizaGenerator('PESSOA_FISICA',0);
      AtualizaGenerator('PESSOA_JURIDICA',0);
   end;}
   Screen.Cursor := crDefault;
end;


Procedure TFrmPrincipal.MigraTabIRRF;
Var
   iConta, iConta2, iErro: Integer;
   sAnoMesIni, sAnoMesFim: string;
   crValValFaixaIni, crValTemp: Currency;
Begin

   Screen.Cursor := crHourGlass;

   spLimpaGrupoServidor.ExecProc;

   dmPrincipal.DataSource1.DataSet := dmTabAliquotas_.cdsTabIRRFfb;

   Panel1.Caption:= ' Migrando a Tabela de Alíquotas de Imposto de Renda ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabAliquotas_ do
   begin

      qryTabIRRF.Close;
      qryTabIRRF.Open;
      cdsTabIRRFFB.Close;
      cdsTabIRRFFB.Open;
      cdsDeduzIRRFfb.Close;
      cdsDeduzIRRFfb.Open;

      iErro  := 0;
      iConta := 0;

      While (not qryTabIRRF.eof) and (qryTabIRRFAnoMes.Value <= '201201') do
      begin

         if RightStr(qryTabIRRFAnoMes.Value,2) = '13' then
         begin
            qryTabIRRF.Next;
            Continue;
         end;

         sAnoMesIni       := qryTabIRRFAnoMes.AsString;
         crValValFaixaIni := qryTabIRRFValInicial1.AsCurrency;

         while not qryTabIRRF.eof do
         begin
            crValTemp := qryTabIRRFValInicial1.Value;
            if crValTemp <> crValValFaixaIni then break;
            sAnoMesFim := qryTabIRRFAnoMes.AsString;
            qryTabIRRF.Next;
         end;

         if qryTabIRRFAnoMes.AsString = pv_AnoMesAtual then
           break;

         qryTabIRRF.Prior;
         if RightStr(sAnoMesFim,2) > '12' then
            sAnoMesFim := LeftStr(sAnoMesFim,4)+'12';

         for iConta2 := 1 to 4 do
         begin

            if (qryTabIRRF.FieldByName('Aliquota'+IntToStr(iConta2)).IsNull) or
               (qryTabIRRF.FieldByName('Aliquota'+IntToStr(iConta2)).Value = 0) then Break;

            Inc(iConta);
            cdsTabIRRFFB.Append;

            if pv_lSalvar then
               cdsTabIRRFfbID.Value := ProxId('TAB_IRRF')
            else
               cdsTabIRRFfbID.Value := iConta;
            cdsTabIRRFfbANO_MES_INI_VIG.AsVariant:= sAnoMesIni;
            cdsTabIRRFfbANO_MES_FIM_VIG.AsVariant:= sAnoMesFim;
            cdsTabIRRFfbINI_FAIXA.AsVariant      := qryTabIRRF.FieldByName('ValInicial'+IntToStr(iConta2)).Value;
            cdsTabIRRFfbFIM_FAIXA.AsVariant      := qryTabIRRF.FieldByName('ValFinal'+IntToStr(iConta2)).Value;
            cdsTabIRRFfbALIQUOTA.AsVariant       := qryTabIRRF.FieldByName('Aliquota'+IntToStr(iConta2)).Value;
            cdsTabIRRFfbVAL_DEDUCAO.AsVariant    := qryTabIRRF.FieldByName('Deducao'+IntToStr(iConta2)).Value;

            try
               cdsTabIRRFFB.Post;
            except
               DispConteudoTab(cdsTabIRRFFB);
               iErro := 1;
            end;
            if (iErro = 0) and (pv_lSalvar) then
               iErro := SalvaRegistro(cdsTabIRRFFB);
            if iErro = 1 then Break;

            Application.ProcessMessages;

         end;

         //Inc(iConta);

         cdsDeduzIRRFFB.Append;
         cdsDeduzIRRFfbID.Value                      := iConta;
         cdsDeduzIRRFfbANO_MES_INI_VIG.AsVariant     := sAnoMesIni;
         cdsDeduzIRRFfbANO_MES_FIM_VIG.AsVariant     := sAnoMesFim;
         cdsDeduzIRRFfbVAL_ABONO.AsCurrency          := qryTabIRRFValAbono.AsCurrency;
         cdsDeduzIRRFfbVAL_DEDUCAO_DEPEND.AsCurrency := qryTabIRRFValDeduzDepend.AsCurrency;

         try
            cdsDeduzIRRFFB.Post;
         except
            DispConteudoTab(cdsDeduzIRRFfb);
            iErro := 1;
         end;
         if (iErro = 0) and (pv_lSalvar) then
            iErro := SalvaRegistro(cdsDeduzIRRFFB);
         if iErro = 1 then Break;

         qryTabIRRF.Next;

         if qryTabIRRFAnoMes.Value = '201110' then break;

      end;

      if iErro = 0 then
      begin
         {
         if pv_lSalvar then
         begin
            AtualizaGenerator('TAB_IRRF',iConta);
            AtualizaGenerator('TAB_DEDUCAO_IRRF',iConta);
         end;
         }
         Panel1.Caption := 'Processo concluído ... -> '+
                           IntToStr(cdsTabIRRFFB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      //Screen.Cursor := crDefault;


      frmDispTabMigrada.Executa('ImpRenda','TAB_IRRF');

      cdsTabIRRFFB.Close;
      cdsDeduzIRRFfb.Close;
      qryTabIRRF.Close;

   end;

End;

Procedure TFrmPrincipal.MigraTabAliqPrevidINSS;
Var
   iConta, iConta2: Integer;
   iErro: Integer;
   sAnoMesIni, sAnoMesFim: string;
   crValValFaixaIni, crValTemp: Currency;
Begin

   Screen.Cursor := crHourGlass;

   dmPrincipal.DataSource1.DataSet := dmTabAliquotas_.cdsAliqPrevidINSSfb;

   Panel1.Caption:= ' Migrando a Tabela de Alíquotas de I.N.S.S. ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabAliquotas_ do
   begin

      qryAliqPrevidINSS.Close;
      qryAliqPrevidINSS.Open;
      cdsAliqPrevidINSSFB.Close;
      cdsAliqPrevidINSSFB.Open;
      iErro  := 0;
      iConta := 0;

      While (not qryAliqPrevidINSS.eof) and
            (qryAliqPrevidINSSAnoMes.Value <= '201201') do
      begin

         if RightStr(qryAliqPrevidINSSAnoMes.Value,2) > '12' then
         begin
            qryAliqPrevidINSS.Next;
            Continue;
         end;

         sAnoMesIni := qryAliqPrevidINSSAnoMes.AsString;

         if sAnoMesIni = pv_AnoMesAtual then
           break;

         crValValFaixaIni := qryAliqPrevidINSSValFinal1.AsCurrency;

         while not qryAliqPrevidINSS.eof do
         begin
            crValTemp := qryAliqPrevidINSSValFinal1.Value;
            if crValTemp <> crValValFaixaIni then break;
            sAnoMesFim := qryAliqPrevidINSSAnoMes.AsString;
            qryAliqPrevidINSS.Next;
         end;

         if qryAliqPrevidINSSAnoMes.AsString = pv_AnoMesAtual then
           break;

         qryAliqPrevidINSS.Prior;
         if RightStr(sAnoMesFim,2) > '12' then
         sAnoMesFim := LeftStr(sAnoMesFim,4)+'12';

         for iConta2 := 1 to 4 do
         begin

            if (qryAliqPrevidINSS.FieldByName('Aliquota'+IntToStr(iConta2)).IsNull) or
               (qryAliqPrevidINSS.FieldByName('Aliquota'+IntToStr(iConta2)).Value = 0) then Break;

            Inc(iConta);
            cdsAliqPrevidINSSFB.Append;

            if pv_lSalvar then
               cdsAliqPrevidINSSfbID.Value := ProxId('TAB_ALIQ_PREVID')
            else
               cdsAliqPrevidINSSfbID.Value := iConta;
            cdsAliqPrevidINSSfbTIPO_PREVID.Value        := '1';
            cdsAliqPrevidINSSfbANO_MES_INI_VIG.AsVariant:= sAnoMesIni;
            cdsAliqPrevidINSSfbANO_MES_FIM_VIG.AsVariant:= sAnoMesFim;
            if qryAliqPrevidINSS.FieldByName('ValIni'+IntToStr(iConta2)).IsNull then
               cdsAliqPrevidINSSfbINI_FAIXA.AsVariant   := 0
            else
               cdsAliqPrevidINSSfbINI_FAIXA.AsVariant   := qryAliqPrevidINSS.FieldByName('ValIni'+IntToStr(iConta2)).Value;
            cdsAliqPrevidINSSfbFIM_FAIXA.AsVariant      := qryAliqPrevidINSS.FieldByName('ValFinal'+IntToStr(iConta2)).Value;
            cdsAliqPrevidINSSfbVALOR.AsVariant          := qryAliqPrevidINSS.FieldByName('Aliquota'+IntToStr(iConta2)).Value;

            try
               cdsAliqPrevidINSSFB.Post;
            except
               DispConteudoTab(cdsAliqPrevidINSSfb);
               iErro := 1;
            end;
            if (iErro = 0) and (pv_lSalvar) then
               iErro := SalvaRegistro(cdsAliqPrevidINSSFB);
            if iErro = 1 then Break;

         end;

         qryAliqPrevidINSS.Next;

      end;

      if iErro = 0 then
      begin
         {
         if pv_lSalvar then
            AtualizaGenerator('TAB_ALIQ_PREVID',iConta);
            }
         Panel1.Caption := 'Processo concluído ... -> '+
                           IntToStr(cdsAliqPrevidINSSFB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      //Screen.Cursor := crDefault;
      frmDispTabMigrada.Executa('TabDescINSS','TAB_ALIQ_PREVID');

      cdsAliqPrevidINSSFB.Close;
      qryAliqPrevidINSS.Close;

   end;

End;

Procedure TFrmPrincipal.MigraTabSalFamilia;
Var
   iConta, iConta2: Integer;
   iErro: Integer;
   sAnoMesIni, sAnoMesFim: string;
   crValValFaixaIni, crValTemp: Currency;
Begin

   Screen.Cursor := crHourGlass;

   dmPrincipal.DataSource1.DataSet := dmTabAliquotas_.cdsTabSalFamfb;

   Panel1.Caption:= ' Migrando a Tabela de Salário Família ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabAliquotas_ do
   begin

      qryTabSalFam.Close;
      qryTabSalFam.Open;
      cdsTabSalFamfb.Close;
      cdsTabSalFamFB.Open;
      iErro  := 0;
      iConta := 0;

      While (not qryTabSalFam.eof) and
             (qryTabSalFamAnoMes.Value <= '201201') do
      begin

         if qryTabSalFamAnoMes.AsString = pv_AnoMesAtual then
           break;

         if RightStr(qryTabSalFamAnoMes.Value,2) > '12' then
         begin
            qryTabSalFam.Next;
            Continue;
         end;

         sAnoMesIni       := qryTabSalFamAnoMes.AsString;
         crValValFaixaIni := qryTabSalFamFaixaFim1.AsCurrency;

         while not qryTabSalFam.eof do
         begin
            crValTemp := qryTabSalFamFaixaFim1.Value;
            if crValTemp <> crValValFaixaIni then break;
            qryTabSalFam.Next;
         end;

         if qryTabSalFamAnoMes.AsString = pv_AnoMesAtual then
           break;

         qryTabSalFam.Prior;
         sAnoMesFim := qryTabSalFamAnoMes.AsString;
         if RightStr(sAnoMesFim,2) > '12' then
            sAnoMesFim := LeftStr(sAnoMesFim,4)+'12';

         for iConta2 := 1 to 2 do
         begin

            if (qryTabSalFam.FieldByName('Valor'+IntToStr(iConta2)).IsNull) or
               (qryTabSalFam.FieldByName('Valor'+IntToStr(iConta2)).Value = 0) then Break;

            Inc(iConta);
            cdsTabSalFamfb.Append;

            if pv_lSalvar then
               cdsTabSalFamfbID.Value := ProxId('TAB_SAL_FAMILIA')
            else
               cdsTabSalFamfbID.Value := iConta;
            cdsTabSalFamfbTIPO_PREVID.Value        := '1';
            cdsTabSalFamfbANO_MES_INI_VIG.AsVariant:= sAnoMesIni;
            cdsTabSalFamfbANO_MES_FIM_VIG.AsVariant:= qrytabSalFamAnoMes.Value;
            if qrytabSalFam.FieldByName('FaixaIni'+IntToStr(iConta2)).IsNull then
               cdsTabSalFamfbINI_FAIXA.AsVariant   := 0
            else
               cdsTabSalFamfbINI_FAIXA.AsVariant   := qrytabSalFam.FieldByName('FaixaIni'+IntToStr(iConta2)).Value;
            if qrytabSalFam.FieldByName('FaixaFim'+IntToStr(iConta2)).IsNull then
               cdsTabSalFamfbFIM_FAIXA.AsVariant   := 0
            else
               cdsTabSalFamfbFIM_FAIXA.AsVariant   := qrytabSalFam.FieldByName('FaixaFim'+IntToStr(iConta2)).Value;
            if qrytabSalFam.FieldByName('Valor'+IntToStr(iConta2)).IsNull then
               cdsTabSalFamfbVALOR.AsVariant       := 0
            else
               cdsTabSalFamfbVALOR.AsVariant       := qrytabSalFam.FieldByName('Valor'+IntToStr(iConta2)).Value;

            try
               cdsTabSalFamFB.Post;
            except
               DispConteudoTab(cdsTabSalFamfb);
               iErro := 1;
            end;
            if (iErro = 0) and (pv_lSalvar) then
               iErro := SalvaRegistro(cdsTabSalFamFB);
            if iErro = 1 then Break;

         end;

         qryTabSalFam.Next;

      end;

      if iErro = 0 then
      begin
         {
         if pv_lSalvar then
            AtualizaGenerator('TAB_SAL_FAMILIA',iConta);
            }
         Panel1.Caption := 'Processo concluído ... -> '+
                           IntToStr(cdsTabSalFamFB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      //Screen.Cursor := crDefault;
      frmDispTabMigrada.Executa('TabSalFamilia','TAB_SAL_FAMILIA');

      cdsTabSalFamFB.Close;
      qryTabSalFam.Close;

   end;

End;

Procedure TFrmPrincipal.MigraCargo;
Var
   iErro, iRegistroMigrado: Integer;
   sIdCBO, sCodigo, sSysAnterior: string;
Begin

   Screen.Cursor := crHourGlass;

   Panel1.Caption:= ' Migrando a Tabela de Cargos/Funções ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabDiversas do
   begin

      qryCargo.Close;
      qryCargo.SQL.Text := 'SELECT * FROM SFP005'+pv_mes+' ORDER BY CODIGO';
      qryCargo.Open;

      Gauge1.MaxValue := qryCargo.RecordCount;
      Gauge1.Progress := 0;
      
      cdsCargoFB.Close;
      cdsCargoFB.Open;

      iErro := 0;
      iRegistroMigrado := 0;

      while not qryCargo.Eof do
      begin

         Gauge1.Progress := Gauge1.Progress + 1;
         
         sSysAnterior := qryCargoCODIGO.AsString+';'+pv_banco;

         sCodigo := Pesquisa('CARGO_FUNCAO', 'ID_SYS_ANTER', sSysAnterior, 'ID');
         
         if sCodigo <> EmptyStr then  // O cargo já foi migrado
         begin
           qryCargo.Next;
           Continue;
         end;
         
         cdsCargoFB.Append;
         cdsCargoFBID.AsInteger       := ProxId('CARGO_FUNCAO');
         cdsCargoFBDESCRICAO.AsString := qryCargoCARGO.AsString;

         cdsCargoFBID_CATEG_FUNCIONAL.AsInteger := 1;
         cdsCargoFBID_TIPO_CARGO_TCM.AsInteger  := 20;

         cdsCargoFBVENCTO_BASE.AsCurrency := qryCargoSALARIO.AsCurrency;

         cdsCargoFBTIPO_SAL.AsString   := '1';
         cdsCargoFBFORMA_CALC.AsString := '1';
         cdsCargoFBBASE_CALC_HORA_AULA.AsInteger := 1;
         cdsCargoFBCARGA_HOR_MENSAL.AsInteger    := 1;
         cdsCargoFBQTD_VAGA.AsInteger            := 1;
         cdsCargoFBID_ESCOLARIDADE.AsInteger     := 1;

         sIdCBO := Trim(qryCargoCBO.AsString);

         if sIdCBO <> EmptyStr then
           sIdCBO := Pesquisa('CBO','CODIGO', qryCargoCBO.AsString,'ID');

         if sIdCBO = '0' then
           sIdCBO := EmptyStr;
           
         cdsCargoFBID_CBO.AsString := sIdCBO;

         cdsCargoFBID_FAT_PROG_SAL.AsInteger:= 1;
         cdsCargoFBNUM_ATO_CRIACAO.AsString    := qryCargoLEICRIA.AsString;
         cdsCargoFBDATA_ATO_CRIACAO.AsDateTime := Trunc(qryCargoDATCRIA.AsDateTime);

         cdsCargoFBCALC_ATS.AsVariant := 'S';
         cdsCargoFBCALC_ATS_SOBRE_VENCTO_BASE.AsVariant := 'N';
         cdsCargoFBCALC_DEC_TERC.Value := 'S';
         cdsCargoFBCALC_CONTRIB_SINDICAL.Value := 'N';

         cdsCargoFBOBSERVACAO.AsString := qryCargoOBSRESERVA.AsString;

         cdsCargoFBID_SYS_ANTER.AsString := sSysAnterior;

         if iErro = 0 then
         begin
            try
               cdsCargoFB.Post;
            except
               on E: Exception do
               begin
                 Mensagem('Não foi possível Salvar o seguinte Cargo ...'+#13+'('+E.Message+')', 'E R R O !!!');
                 DispConteudoTab(cdsCargoFB);
                 iErro := 1;
               end;
            end;
         end;

         if iErro = 0 then
            iErro := SalvaRegistro(cdsCargoFB);

         if iErro = 1 then
         begin
            DispConteudoTab(cdsCargoFB);
            Break;
         end;

         iRegistroMigrado := iRegistroMigrado + 1;
         qryCargo.Next;

      end;

      if iErro = 0 then
      begin
         Panel1.Caption :=  ' Processo concluído ... -> '+IntToStr(iRegistroMigrado)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      cdsCargoFB.Close;
      qryCargo.Close;

   end;

   //Screen.Cursor := crDefault;

End;

Procedure TFrmPrincipal.MigraTabSubUnidOrcamentarias;
Var
   iErro: Integer;
   s, sIDAnterior: string;
Begin

   Screen.Cursor := crHourGlass;
   dmPrincipal.DataSource1.DataSet := dmTabDiversas.cdsSubUnidOrcamentFB;

   //MigraTabSetores;

   Panel1.Caption := ' Migrando a Tabela de Sub Unid. Orçamentáris ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   s := Pesquisa('UNID_ORCAMENT', 'ID', '1', 'ID');

   if s = EmptyStr then  // Não há UNIDADE ORÇAMENTÁRIA 1
   begin
     s := 'INSERT INTO UNID_ORCAMENT '+
          ' (ID, DESCRICAO, COD_CONTABIL, ID_UNID_GESTORA, COD_ORGAO_TCM) '+
          ' VALUES (1, '+QuotedStr('GABINETE DO PREFEITO')+', 1, 1, 101)';
     ExecutaSQL(s);
   end;

   with dmTabDiversas do
   begin

      qryCCustos.Close;
      qryCCustos.SQL.Text := 'SELECT * FROM SFP006'+pv_mes;
      qryCCustos.Open;

      cdsSubUnidOrcamentFB.IndexFieldNames := 'ID';
      cdsSubUnidOrcamentFB.Close;
      cdsSubUnidOrcamentFB.Open;

      iErro := 0;

      While not qryCCustos.Eof do
      begin

         if qryCCustosCDSETOR.Value = '000' then
         begin
            qryCCustos.Next;
            Continue;
         end;

         cdsSubUnidOrcamentFB.Append;
         cdsSubUnidOrcamentFBID.AsVariant := ProxId('SUB_UNID_ORCAMENT');
         cdsSubUnidOrcamentFBDESCRICAO.AsVariant := qryCCustosDESCRICAO.Value;
         cdsSubUnidOrcamentFBID_UNID_ORCAMENT.AsVariant  := 1;
         cdsSubUnidOrcamentFBID_SETOR.Value              := 1;
         cdsSubUnidOrcamentFBTIPO_PREVID.AsVariant       := '1';
         cdsSubUnidOrcamentFBCONTRIB_INDIVIDUAL.Value    := 'N';
         cdsSubUnidOrcamentFBCALC_ATS.AsVariant          := 'S';
         cdsSubUnidOrcamentFBCALC_SAL_FAMILIA.AsVariant  := 'S';
         cdsSubUnidOrcamentFBDESC_IRRF.AsVariant         := 'S';
         cdsSubUnidOrcamentFBPAGA_RESCISAO.AsVariant     := 'S';
         cdsSubUnidOrcamentFBINATIVOS.AsVariant          := 'N';
         cdsSubUnidOrcamentFBGERA_RAIS.AsVariant         := 'S';
         cdsSubUnidOrcamentFBEM_USO.AsVariant            := 'S';
         cdsSubUnidOrcamentFBTIPO_VINCULO.AsVariant      := '1';
         cdsSubUnidOrcamentFBTETO_VENCTO_BASE.AsCurrency := 0;
         cdsSubUnidOrcamentFBTETO_SALARIO.AsCurrency     := 0;

         sIDAnterior := qryCCustosCDSECRETA.AsString+qryCCustosCDSETOR.AsString+';'+pv_banco;

         cdsSubUnidOrcamentFBID_SYS_ANTER.AsString := sIDAnterior;

         if iErro = 0 then
         begin
            try
              cdsSubUnidOrcamentFB.Post;
            except
              DispConteudoTab(cdsSubUnidOrcamentFB);
              iErro := 1;
            end;
         end;

         if iErro = 0 then
         begin
            try
               iErro := SalvaRegistro(cdsSubUnidOrcamentFB);
            except
               iErro := 1;
            end;
         end;

         if iErro = 1 then
           Break;

         qryCCustos.Next;

      end;

      if iErro = 0 then
      begin
         Panel1.Caption :=  ' Processo concluído ... -> '+
                           IntToStr(cdsSubUnidOrcamentFB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      //frmDispTabMigrada.Executa('CCustos','SUB_UNID_ORCAMENT');

      cdsSubUnidOrcamentFB.Close;
      qryCCustos.Close;

   end;

   //Screen.Cursor := crDefault;

End;

{
Procedure TfrmPrincipal.MigraTabDeptos;
Var
   iErro  : Integer;
   iUltId : Integer;
Begin

   Screen.Cursor := crHourGlass;

   Panel1.Caption := ' Migrando a Tabela de Departamentos ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabDiversas do
   begin

      dmPrincipal.DataSource1.DataSet := cdsDeptofb;

      qryDepto.Close;
      qryDepto.Open;
      cdsDeptoFB.Close;
      cdsDeptoFB.Open;
      iErro := 0;

      While not qryDepto.eof do
      begin
         cdsDeptoFB.Append;
         cdsDeptoFBID.AsVariant := qryDeptoCodDepart.AsInteger+
            StrToInt(edAddIdDepto.Text);
         cdsDeptofbDESCRICAO.AsVariant := qryDeptoDescricao.Value;
         try
            cdsDeptoFB.Post;
         except
            DispConteudoTab(cdsDeptofb);
            iErro := 1;
         end;
         if (iErro = 0) and (pv_lSalvar) then
            iErro := SalvaRegistro(dmTabDiversas.cdsDeptoFB);
         if iErro = 1 then Break;
         iUltId := cdsDeptofbID.Value;

         qryDepto.Next;
      end;

      if iErro = 0 then
      begin
      {
         if pv_lSalvar then
            AtualizaGenerator('DEPTO',iUltId);}

{
         Panel1.Caption :=  ' Processo concluído ... -> '+
                           IntToStr(cdsDeptoFB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      frmDispTabMigrada.Executa('Departamentos','DEPTO');

      cdsDeptoFB.Close;
      qryDepto.Close;

   end;

   //Screen.Cursor := crDefault;

End;
}

procedure TFrmPrincipal.MigraTabUnidLotacao;
var
   iErro, iMigrado: Integer;
   sNomeLayout, sCodigo, sCodigoAnterior: string;
begin

   Screen.Cursor := crHourGlass;

   Panel1.Caption := ' Migrando a Tabela de Unid. de Lotações ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabDiversas do
   begin

      qryUnidLotacao.Close;
      qryUnidLotacao.Open;

      cdsUnidLotacaoFB.Close;
      cdsUnidLotacaoFB.Open;

      if cdsUnidLotacaofb.IsEmpty then
      begin
         cdsUnidLotacaoFB.Append;
         cdsUnidLotacaoFBID.AsVariant := 1;
         cdsUnidLotacaofbDESCRICAO.AsVariant := 'PRÉDIO DA PREFEITURA';
         cdsUnidLotacaofbID_TIPO_UNID_LOTACAO.AsVariant := 1;
         cdsUnidLotacaofbATIVO.Value := 'S';
         cdsUnidLotacaoFB.Post;
         SalvaRegistro(cdsUnidLotacaoFB);
      end;

      iErro := 0;
      iMigrado := 0;

      while not qryUnidLotacao.eof do
      begin

         sCodigo         := qryUnidLotacaoCODIGO.AsString;
         sNomeLayout     := qryUnidLotacaoESCOLA.AsString;
         sCodigoAnterior := sCodigo+';'+pv_banco;

         if not cdsUnidLotacaofb.Locate('ID_SYS_ANTER', sCodigoAnterior, [])  then
         begin

           cdsUnidLotacaoFB.Append;
           cdsUnidLotacaoFBID.AsVariant := ProxId('UNID_LOTACAO');
           cdsUnidLotacaofbDESCRICAO.AsString := sNomeLayout;

           if StrUtils.StartsStr('SMS', sNomeLayout) then
             cdsUnidLotacaofbID_TIPO_UNID_LOTACAO.AsInteger := 3    // Posto de saúde
           else if StrUtils.StartsStr('EMEF', sNomeLayout) then
             cdsUnidLotacaofbID_TIPO_UNID_LOTACAO.AsInteger := 4    // Escola
           else
             cdsUnidLotacaofbID_TIPO_UNID_LOTACAO.AsInteger := 99;  // Outros

           cdsUnidLotacaofbATIVO.AsString := 'S';
           cdsUnidLotacaofbID_SYS_ANTER.AsString := sCodigoAnterior;

           try
             cdsUnidLotacaoFB.Post;
           except
             DispConteudoTab(cdsUnidLotacaofb);
             iErro := 1;
           end;

           if iErro = 0 then
             iErro := SalvaRegistro(cdsUnidLotacaoFB);

           if iErro = 1 then Break;

           iMigrado := iMigrado + 1;

         end;

         qryUnidLotacao.Next;

      end;

      if iErro = 0 then
      begin
         Panel1.Caption :=  ' Processo concluído ... -> '+IntToStr(iMigrado)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      cdsUnidLotacaoFB.Close;
      qryUnidLotacao.Close;

   end;

end;

Procedure TFrmPrincipal.MigraTabEstFunc;
Var
   iErro, iCodigo: Integer;
Begin

   Screen.Cursor := crHourGlass;

   Panel1.Caption := ' Migrando a Tabela de Estados Funcionais ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabDiversas do
   begin

     dmPrincipal.DataSource1.DataSet := cdsEstFuncfb;

     qrySituacoes.Close;
     qrySituacoes.Open;

     cdsEstFuncfb.Close;
     cdsEstFuncfb.Open;

     if not ExisteEstadoFuncional(1) then
     begin

        cdsEstFuncfb.Append;
        cdsEstFuncfbID.AsVariant        := 1;
        cdsEstFuncfbDESCRICAO.AsVariant := 'ATIVO';
        cdsEstFuncfbTIPO_MOVIM.AsString := '1';
        cdsEstFuncfbINICIA_SERVIDOR.AsVariant := 'S';
        cdsEstFuncfbCALC_SAL.AsVariant := 'S';
        cdsEstFuncfbEM_ATIVIDADE.Value := 'S';
        cdsEstFuncfbATIVO.Value := 'S';
        cdsEstFuncfb.Post;
        SalvaRegistro(cdsEstFuncfb);

     end;

     iErro := 0;

     while not qrySituacoes.eof do
     begin

        iCodigo := qrySituacoesCODIGO.AsInteger;

        if iCodigo = 1 then  // Afastamento
          iCodigo := 5;

        if ExisteEstadoFuncional(iCodigo) then
        begin
          qrySituacoes.Next;
          Continue;
        end;

        cdsEstFuncfb.Append;
        cdsEstFuncfbID.AsInteger        := iCodigo;
        cdsEstFuncfbDESCRICAO.AsVariant := qrySituacoesDescricao.Value;
        cdsEstFuncfbTIPO_MOVIM.AsString := 'A';
        cdsEstFuncfbINICIA_SERVIDOR.AsVariant := 'N';
        cdsEstFuncfbCALC_SAL.AsVariant := 'N';
        //cdsEstFuncfbCOD_AFAST_PREVID.AsVariant := qrySituacoesCodAfast_INSS.Value;
        //cdsEstFuncfbCOD_RETORNO_PREVID.AsVariant := qrySituacoesCodRetorno_INSS.Value;
        //cdsEstFuncfbMOVIM_DEFINITIVA.AsVariant
        cdsEstFuncfbEM_ATIVIDADE.AsString := 'N';
        cdsEstFuncfbATIVO.AsString := 'S';
        cdsEstFuncfbId_sys_anter.AsString := qrySituacoesCODIGO.AsString;

        try
           cdsEstFuncfb.Post;
        except
           DispConteudoTab(cdsEstFuncfb);
           iErro := 1;
        end;
        if (iErro = 0) then
           iErro := SalvaRegistro(cdsEstFuncfb);

        if iErro = 1 then Break;

        qrySituacoes.Next;

     end;

     if iErro = 0 then
     begin
        Panel1.Caption :=  ' Processo concluído ... -> '+
                          IntToStr(cdsEstFuncfb.RecordCount)+' registros migrados ...';
        memLog.Lines.Add(Panel1.Caption);
        Application.ProcessMessages;
     end;

     //frmDispTabMigrada.Executa('Situacoes','ESTADO_FUNCIONAL');

     cdsEstFuncfb.Close;
     qrySituacoes.Close;

   end;

   //Screen.Cursor := crDefault;

End;

procedure TFrmPrincipal.MigraTabEventos;
var
  sCodigoEventoLayout: string;
  iErro, iCodigo, iMigrado: Integer;
Begin

  Screen.Cursor := crHourGlass;

  Panel1.Caption := ' Migrando a Tabela de Eventos (Venc/Desc.Db) ...';
  memLog.Lines.Add(Panel1.Caption);
  Application.ProcessMessages;

  qryEvento.Close;
  qryEvento.SQL.Text := 'SELECT * FROM SFP010'+pv_mes;
  qryEvento.Open;

  cdsEventoFB.Close;
  cdsEventoFB.Open;

  iErro    := 0;
  iMigrado := 0;

  while not qryEvento.eof do
  begin

    if qryEventoCodigo.IsNull then
    begin
      qryEvento.Next;
      Continue;
    end;

    sCodigoEventoLayout := qryEventoCodigo.AsString;

    if sCodigoEventoLayout = 'K1' then
    begin
      iCodigo := 1;
      if ExisteEvento(iCodigo) then
      begin
        qryEvento.Next;
        Continue;
      end;
    end else
    begin
      iCodigo := ProxId('EVENTO');
      if iCodigo = 1 then
        iCodigo := iCodigo + 1;
    end;

    cdsEventoFB.Close;
    cdsEventoFb.Params[0].AsInteger := 0;
    cdsEventoFb.Open;

    cdsEventoFB.Append;

    cdsEventoFBID.AsInteger       := iCodigo;
    cdsEventoFBDESCRICAO.AsString := qryEventoDESCRICAO.AsString;
    cdsEventoFBCODIGO.AsString    := sCodigoEventoLayout;
    cdsEventoFBTIPO.AsString      := qryEventoNATUREZA.AsString;
    if cdsEventoFBTIPO.AsString = 'P' then
      cdsEventoFBTIPO.AsString := 'V';
    cdsEventoFBFORMA_CALC.AsVariant:= '1';
    cdsEventoFbID_CATEG.Value := 1;
    cdsEventoFBID_CATEG_TCM.AsVariant := 10;
    cdsEventoFBPERCENT_HORA_EXTRA.AsVariant   := 0;
    cdsEventoFBHE_SOBRE_HORA_NORMAL.AsVariant := 'N';
    cdsEventoFBTIPO_BASE_CALC.AsString := '1';

    cdsEventoFBINCIDE_SAL_FAMILIA.AsString := qryEventoBASESALFAMPREV.AsString;
    cdsEventoFBINCIDE_ATS.AsString         := qryEventoINCIDETRI.AsString;
    cdsEventoFBINCIDE_FERIAS.AsString      := qryEventoINCIDEFER.AsString;
    cdsEventoFBINCIDE_DEC_TERC.AsString    := qryEventoINCIDE13.AsString;
    cdsEventoFBINCIDE_FALTA.AsString       := qryEventoBASEFALTAS.AsString;
    cdsEventoFBINCIDE_PREVID.AsString      := qryEventoINCIDEPREV.AsString;
    cdsEventoFBINCIDE_IRRF.AsString        := qryEventoINCIDEIRRF.AsString;

    cdsEventoFBINCIDE_OUTRA_BC1.AsString := 'N';
    cdsEventoFBINCIDE_OUTRA_BC2.AsString := 'N';
    cdsEventoFBINCIDE_OUTRA_BC3.AsString := 'N';

    cdsEventoFBVALOR_FIXO.AsCurrency        := 0;
    cdsEventoFBDIVISOR.AsCurrency           := 0;
    cdsEventoFBSUBDIVISOR.AsCurrency        := 0;
    cdsEventoFBGERA_RAIS.AsString           := 'S';
    cdsEventoFBCOPIA_MES_ANTERIOR.AsString  := 'N';
    cdsEventoFbPERMITIR_USUARIO_ALTER.AsString := 'S';
    cdsEventoFbSEM_USO.AsString := 'N';
    cdsEventoFbID_SYS_ANTER.AsString := sCodigoEventoLayout+';'+pv_banco;

    try
      cdsEventoFB.Post;
    except
      DispConteudoTab(cdsEventoFb);
      iErro := 1;
      memLog.Lines.Add('Erro no Evento '+sCodigoEventoLayout+' ...');
    end;

    if iErro = 0 then
      iErro := SalvaRegistro(cdsEventoFb);

    if iErro = 1 then
      Break;

    iMigrado := iMigrado + 1;
    qryEvento.Next;

  end;

  if iErro = 0 then
  begin
    Panel1.Caption := ' Processo concluído ... -> '+IntToStr(iMigrado)+' registros migrados ...';
    memLog.Lines.Add(Panel1.Caption);
    Application.ProcessMessages;
  end;

  cdsEventoFB.Close;
  qryEvento.Close;

end;

procedure TFrmPrincipal.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmPrincipal.ImportaCBO;
Var
   tfArqTemp: TextFile;
   sLinCBO, sCodCBO, sDescrCBO: string;
   iErro, iConta: Integer;
begin
   //if not OpenDialog1.Execute then exit;
   //if OpenDialog1.FileName = '' then exit;

   iErro := 0;
   iConta:= 0;
   Panel1.Caption :=  ' Importando a Tabela de C.B.O. ... -> ';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmTabDiversas do
   begin

      dmPrincipal.DataSource1.DataSet := cdsCBO_FB;

      cdsCBO_FB.Close;
      cdsCBO_FB.Open;

      AssignFile(tfArqTemp,OpenDialog1.FileName);
      Reset(tfArqTemp);
      Readln(tfArqTemp,sLinCBO);
      Readln(tfArqTemp,sLinCBO);
      While Not EOF(tfArqTemp) Do
      Begin
         Readln(tfArqTemp,sLinCBO);
         sCodCBO  := LeftStr(sLinCBO,6);
         sDescrCBO:= Copy(sLinCBO,8,255);
         cdsCBO_FB.Append;
         Inc(iConta);
         cdsCBO_FBID.Value           := iConta;
         cdsCBO_FBDESCRICAO.AsString := dmPrincipal.Maiusculas(sDescrCBO);
         cdsCBO_FBCODIGO.AsString    := sCodCBO;
         try
            cdsCBO_FB.Post;
         except
            DispConteudoTab(cdsCBO_FB);
            iErro := 1;
         end;

         if (iErro = 0) then
            iErro := SalvaRegistro(cdsCBO_FB);
         if iErro = 1 then Break;

      end;

      if iErro = 1 then
         cdsCBO_FB.CancelUpdates
      else begin
         {
         if pv_lSalvar then
            AtualizaGenerator('CBO',iConta);
            }
         Panel1.Caption :=  ' Processo concluído ... -> '+
                           IntToStr(cdsCBO_FB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      frmDispTabMigrada.Executa('<Não existia>','CBO');

      cdsCBO_FB.Close;

   end;

end;

procedure TFrmPrincipal.MigraServidor;
var
  iIdServidor, iErro, iSituacaoTCM, iFuncaoProfessorGera, iRegistroMigrado: Integer;
  sSQL, sSecretaria, sCodigoSecretariaLayout, sUnidadeLotacaoLayout, sEfetivo,
  sSistemaLayout, sIdSubUnidOrcam,
  sCPF, sMatriculaOld, sNewMatric, sEstFuncTemp, sFuncaoLayout, sFuncaoGera,
  sCodigo, sSysAnterior: string;

  sUltIdServid: string[7];
  sDig        : string[1];

  sIdCompleto : string[7];

begin

  Screen.Cursor  := crHourGlass;

  Panel1.Caption := 'CadFuncionarios';
  Gauge1.Progress:= 0;

  dmPrincipal.DataSource1.DataSet := dmCadLanctos.cdsServidorFB;

  pv_iIdDepend := ProxId('SERVIDOR_DEPENDENTE');
  pv_iUltIdPF  := ProxId('PESSOA_FISICA');

  Panel1.Caption := ' Migrando a Tabela de Servidores ...';
  memLog.Lines.Add(Panel1.Caption);
  Application.ProcessMessages;

  sSecretaria := Trim(edSecretMigra.Text);

  // para servidores sem cargo ou que o cargo não foi localizado na tabela CARGO_FUNCAO
  iFuncaoProfessorGera := PesquisaCargoNome('PROFESSOR');

  qryUltServid.Close;
  qryUltServid.Open;
  sUltIdServid := PreencheZeros(qryUltServid.Fields[0].AsString,7);
  iIdServidor  := StrToInt(sUltIdServid);
  if iIdServidor = 0 then
     iIdServidor := 1;

  qryUltServid.Close;

  with dmCadLanctos do
  begin

    qryServidor.Close;

    sSQL := 'SELECT * FROM SFP001' + pv_mes;

    if sSecretaria <> EmptyStr then
      sSQL := sSQL + ' WHERE (CDSECRETA >= '+QuotedStr(sSecretaria)+') AND (CDSECRETA <= '+QuotedStr(sSecretaria)+')';

    qryServidor.SQL.Text := sSQL;
    qryServidor.Open;

    Gauge1.MaxValue  := qryServidor.RecordCount;
    Gauge1.Progress  := 0;
    iRegistroMigrado := 0;

    iErro := 0;

    while not qryServidor.eof do
    begin

      if (sSecretaria <> EmptyStr) and (qryServidorCDSECRETA.AsString <> sSecretaria) then
      begin
        qryServidor.Next;
        Continue;
      end;

      sCPF           := Trim(qryServidorCPF.AsString);
      sMatriculaOld  := qryServidorMatricula.AsString;
      sSistemaLayout := qryServidorSISTEMA.AsString;

      sSysAnterior   := sMatriculaOld+';'+pv_banco;

      if (sCPF = '') and (Trim(qryServidorNome.AsString) = '') then
      begin
         memLog.Lines.Add('Não foi possível migrar o Servidor de Matrícula '+sMatriculaOld+'(s/ CPF e s/ Nome) ...');
         qryServidor.Next;
         Gauge1.Progress := Gauge1.Progress + 1;
         Continue;
      end;

      sCodigo := Pesquisa('SERVIDOR', 'ID_SYS_ANTER', sSysAnterior, 'ID');

      sIdCompleto    := IntToStr(iIdServidor);
      sIdCompleto    := sIdCompleto + CalcDigito(PreencheZeros(sIdCompleto,6));

      memLog.Lines.Add('+ Migrando o Servidor de Matrícula '+sMatriculaOld);

      if sCodigo = EmptyStr then  // No
      begin

        sMatriculaOld := ExtraiPonto(sMatriculaOld);

        if sCPF = '' then
          sCPF := PreencheZeros(sMatriculaOld, 11);

        cdsServidorFB.Close;
        cdsServidorFB.Open;
        cdsServidorFB.Append;
        cdsServidorFBID.AsVariant := StrToInt(sIdCompleto);

        iErro := MigraPessoaFisica(sCPF);

        cdsServidorFBMATRICULA.AsVariant    := sMatriculaOld;
        cdsServidorFBID_PESSOA_FISICA.Value := pv_iIdPF;

      end else
      begin

        cdsServidorFB.Close;
        cdsServidorFB.Params[0].AsInteger := StrToInt(sCodigo);
        cdsServidorFB.Open;

        cdsServidorFB.Edit;

      end;

      iErro := 0;
      if cdsServidorFB.State in [dsInsert,dsEdit] then
      begin

      sEfetivo := 'N';
      if cdsCompatibVinculo.FindKey([qryServidorSISTEMA.AsString]) then
      begin
         iSituacaoTCM := cdsCompatibVinculotcm.Value;
         sEfetivo     := cdsCompatibVinculoefetivo.Value;
      end else
      begin
         iSituacaoTCM := 61;
         sEfetivo     := 'S';
      end;

      cdsServidorFBEFETIVO.AsString          := sEfetivo;
      cdsServidorFBID_SITUACAO_TCM.AsInteger := iSituacaoTCM;
      if qryServidorDtAdmissao.IsNull then
        cdsServidorFBDT_ADMISSAO.AsDateTime := EncodeDate(1900, 1, 1)
      else
        cdsServidorFBDT_ADMISSAO.AsDateTime := Trunc(qryServidorDtAdmissao.AsDateTime);

      cdsServidorFBDOCTO_ADMISSAO.AsString := qryServidorNUMDECRETO.AsString;

      sCodigoSecretariaLayout := qryServidorCDSECRETA.AsString+qryServidorCDSETOR.AsString;

      sIdSubUnidOrcam := Pesquisa('SUB_UNID_ORCAMENT','ID_SYS_ANTER', sCodigoSecretariaLayout+';'+pv_banco,'ID');

      if sIdSubUnidOrcam = '' then
        cdsServidorFBID_SUB_UNID_ORCAMENT.AsVariant := 1
      else
        cdsServidorFBID_SUB_UNID_ORCAMENT.AsVariant := sIdSubUnidOrcam;

      sUnidadeLotacaoLayout := Trim(qryServidorCODESC.AsString);

      if sUnidadeLotacaoLayout <>  EmptyStr then
        sUnidadeLotacaoLayout := Pesquisa('UNID_LOTACAO','ID_SYS_ANTER', sUnidadeLotacaoLayout+';'+pv_banco, 'ID');

      cdsServidorFBID_UNID_LOTACAO.AsInteger := StrToIntDef(sUnidadeLotacaoLayout, 1);

      if qryServidorCDDEPART.IsNull then
        cdsServidorFBID_DEPTO.AsVariant := 1
      else
        cdsServidorFBID_DEPTO.AsVariant := qryServidorCDDEPART.AsInteger;

      if cdsServidorFBID_DEPTO.IsNull then
        cdsServidorFBID_DEPTO.AsVariant := 1;

      if cdsServidorFBID_UNID_LOTACAO.IsNull then
        cdsServidorFBID_UNID_LOTACAO.AsVariant := 1;  // prédio da prefeitura

      sFuncaoLayout := Trim(qryServidorFUNCAO2.AsString);

      if sFuncaoLayout = EmptyStr then
        sFuncaoLayout := Trim(qryServidorFUNCAO.AsString);

      sFuncaoGera := Pesquisa('CARGO_FUNCAO','ID_SYS_ANTER', sFuncaoLayout+';'+pv_banco,'ID');

      if sFuncaoGera = EmptyStr then
        cdsServidorFBID_CARGO_ATUAL.AsInteger := iFuncaoProfessorGera  // Professor
      else
        cdsServidorFBID_CARGO_ATUAL.AsInteger := StrToInt(sFuncaoGera);

      cdsServidorFBID_CARGO_ORIGEM.AsInteger := cdsServidorFBID_CARGO_ATUAL.AsInteger;

      if not qryServidorDTCONCURS2.IsNull then
        cdsServidorFBDT_CONCURSO.AsDateTime := Trunc(qryServidorDTCONCURS2.AsDateTime)
      else if not qryServidorDTCONCURSO.IsNull then
        cdsServidorFBDT_CONCURSO.AsDateTime := Trunc(qryServidorDTCONCURSO.AsDateTime);

      cdsServidorFBID_ESCOLARIDADE.AsVariant := 1;

      if Trim(qryServidorGRINSTR.AsString) <> EmptyStr then
      begin
         if pos(qryServidorGRINSTR.AsString,'1;2;3;4;5;6;7;8;9;0') > 0 then
            if qryServidorGRINSTR.AsInteger > 2 then
              cdsServidorFBID_ESCOLARIDADE.AsVariant := qryServidorGRINSTR.AsInteger-1;
      end;

      cdsServidorFBFORMACAO.AsVariant := qryServidorFORMACAO.Value;
      //cdsServidorFBCONSELHO_REGISTRO.AsVariant   := qryServidorNumRegConselho.Value;

      sEstFuncTemp := EstadoFuncional(qryServidorMATRICULA.AsString);

      if sEstFuncTemp <> '1' then
        sEstFuncTemp := Pesquisa('ESTADO_FUNCIONAL', 'ID_SYS_ANTER', sEstFuncTemp, 'ID');

      if sEstFuncTemp = EmptyStr then
        cdsServidorFBID_EST_FUNCIONAL.AsInteger := 1  // ATIVO
      else
        cdsServidorFBID_EST_FUNCIONAL.AsInteger := StrToInt(sEstFuncTemp);

      cdsServidorFBCARGA_HOR_MENSAL.AsInteger := 0;
      cdsServidorFBQTD_DEPEND_IRRF.Value := qryServidorNUMDEPIR.Value;
      cdsServidorFBCALC_VENCTO_BASE.Value   := 'S';
      cdsServidorFBBLOQ_LANCTO_EVENTO_AUTO.Value:= 'N';
      cdsServidorFBCALC_PREVID.Value        := 'S';
      cdsServidorFBCALC_IRRF.Value          := 'S';
      //cdsServidorFBOBSERVACAO.AsVariant     := qryServidorObservacao.Value;

      if cdsServidorFBID_EST_FUNCIONAL.AsInteger = 22 then // Demissao
        cdsServidorFBSTATUS.AsString := '3'
      else
        cdsServidorFBSTATUS.AsString := '1';

      if not cdsServidorFBDT_CONCURSO.IsNull then
        cdsServidorFBDT_CONCURSO.AsDateTime := Trunc(cdsServidorFBDT_CONCURSO.AsDateTime);

      cdsServidorFBID_SYS_ANTER.AsString := sSysAnterior;

      try
        cdsServidorFB.Post;
      except
        DispConteudoTab(cdsServidorFB);
        iErro := 1;
      end;

      if (iErro = 0) then
      begin
         try
            iErro := SalvaRegistro(cdsServidorFB);
         except
            on E: Exception do
            begin
               memLog.Lines.Add(E.Message);
               DispConteudoTab(cdsServidorFB);
               iErro := 0;
            end;
         end;
      end;

      end; // if cdsServidorFB.State in [dsInsert,dsEdit] then

      if (iErro = 0) and (Trim(qryServidorBANCO.AsString) <> EmptyStr)  then
         iErro := MigraContaBancaria(sIdCompleto); // ok

      if iErro = 0 then
        iErro := MigraDependente(); // ok}

      //if (iErro = 0) then
      //   iErro := MigraEventosFixos; // ok

      {if (iErro = 0) then
         iErro := MigraEscalaFerias;}

      if iErro = 0 then
        iErro := MigraHistFerias(); // ok //

      if iErro = 0 then
        iErro := MigraMovimEstFuncional(qryServidorMATRICULA.AsString, StrToInt(sIdCompleto));

      //if (iErro = 0) then
      //   iErro := MigraHistMudaCargo; // ok

       //if (iErro = 0) then
       //   iErro := MigraHistTransfSubUndOrcam; // ok

      {if (iErro = 0) then
         iErro := MigraAtestadoMedico;}

      {if (iErro = 0) then
         iErro := MigraBCalcMes;}

      //if (iErro = 0) then
      //  iErro := MigraEventosMes; // ok

      {
      if (iErro = 0) then
        iErro := MigraCargaHorProfessor;}

      {if (iErro = 0) then
         iErro := MigraEventosCalc;}

      {
      if (iErro = 0) then
        iErro := MigraDeducaoEntidPrevid;}

      {if (iErro = 0) then
         iErro := MigraDepBancario;}

      if (iErro = 0) then
        iErro := MigraPagtoDiaria; // ok

      if iErro = 1 then Break;

      iRegistroMigrado := iRegistroMigrado + 1;
      Gauge1.Progress := Gauge1.Progress + 1;

      Inc(iIdServidor);
      qryServidor.Next;

    end;

    if iErro = 0 then
    begin
      {
      if pv_lSalvar then
         AtualizaGenerator('SERVIDOR',iUltId);
      }
      Panel1.Caption := ' Processo concluído ... -> '+IntToStr(iRegistroMigrado)+' registros migrados ...';
      memLog.Lines.Add(Panel1.Caption);
      Application.ProcessMessages;
    end;

    //frmDispTabMigrada.Executa('CadFuncionarios', 'SERVIDOR');

    cdsServidorFB.Close;
    qryServidor.Close;

  end;

  Panel1.Caption := 'Processo concluído ...';
  Application.ProcessMessages;
  Gauge1.Progress := 0;
  Panel1.Caption := '';

end;

procedure TFrmPrincipal.MigraEventoFixoServidor;
var
  Qry, qryInsert: TSQLQuery;
  iServidor, iEvento, iErro, iRegistroMigrado: Integer;
  sSQL, sCPF, sMatriculaOld, sNewMatric, sEstFuncTemp, sFuncaoLayout, sFuncaoGera,
  sCodigo, sSysAnterior: string;
begin

  Screen.Cursor  := crHourGlass;

  Qry := TSQLQuery.Create(NIL);
  qryInsert := TSQLQuery.Create(NIL);

  try

    Qry.SQLConnection := dmPrincipal.connectionGERA;
    qryInsert.SQLConnection := dmPrincipal.connectionGERA;

    iRegistroMigrado := 0;

    Gauge1.Progress := 0;
    Gauge1.Progress := cdsEventoFolha.RecordCount;
    Panel1.Caption := ' Processando Eventos da Folha para Eventos Fixos do Servidor ...';
    memLog.Lines.Add(Panel1.Caption);
    Application.ProcessMessages;

    cdsEventoFolha.First;

    while not cdsEventoFolha.Eof do
    begin

      Gauge1.Progress := Gauge1.Progress + 1;

      if cdsEventoFolhaX.AsString = EmptyStr then
      begin
        cdsEventoFolha.Next;
        Continue;
      end;

      iEvento := cdsEventoFolhaID_EVENTO.AsInteger;

      Qry.Close;
      Qry.SQL.Text := 'SELECT * FROM LANCTO_EVENTO_CALC WHERE ANO_MES = '+QuotedStr(pv_AnoMesAtual)+
         ' AND ID_EVENTO = '+IntToStr(iEvento);
      Qry.Open;

      while not qry.Eof do
      begin

        Inc(iRegistroMigrado);
        iServidor := Qry.FieldByName('ID_SERVIDOR').AsInteger;

        sSQL := 'DELETE FROM SERVIDOR_EVENTO_FIXO WHERE ID_SERVIDOR = '+IntToStr(iServidor)+
           ' AND ID_EVENTO = '+IntToStr(iEvento);
        ExecutaSQL(sSQL);

        sSQL := 'INSERT INTO SERVIDOR_EVENTO_FIXO (ID_SERVIDOR, ID_EVENTO, QTD, VALOR, PARTICIPA) '+
           'VALUES (:1, :2, :3, :4, :5)';

        qryInsert.SQL.Text := sSQL;

        qryInsert.Params[0].AsInteger := iServidor;
        qryInsert.Params[1].AsInteger := iEvento;
        qryInsert.Params[2].AsFloat := Qry.FieldByName('QTD').AsFloat;
        qryInsert.Params[3].AsFloat := Qry.FieldByName('VALOR').AsFloat;
        qryInsert.Params[4].AsString := 'N';

        qryInsert.ExecSQL();

        Qry.Next;

      end;

      cdsEventoFolha.Next;

    end;

    if iErro = 0 then
    begin
      Panel1.Caption := ' Processo concluído ... -> '+IntToStr(iRegistroMigrado)+' registros migrados ...';
      memLog.Lines.Add(Panel1.Caption);
      Application.ProcessMessages;
    end;


  finally
    Qry.Free;
    qryInsert.Free;
  end;

  Panel1.Caption := 'Processo concluído ...';
  Application.ProcessMessages;
  Gauge1.Progress := 0;

end;

function  TFrmPrincipal.MigraPessoaFisica(CPF: string): Integer;
begin

   Panel1.Caption := ' Migrando a Pessoa Física ...';
   Application.ProcessMessages;

   Result := 0;

   with dmCadLanctos do
   begin

      pv_iIdPF := 0;

      cdsPessoaFisicaFB.Close;
      qryPessoaFisicaFB.Params[0].Value := CPF;
      cdsPessoaFisicaFB.Open;

      if cdsPessoaFisicaFB.RecordCount = 0 then
      begin
         cdsPessoaFisicaFB.Append;
         cdsPessoaFisicaFBID.AsVariant := pv_iUltIdPF;
         cdsPessoaFisicaFBCPF.AsVariant:= CPF;
         Inc(pv_iUltIdPF);
      end else
         cdsPessoaFisicaFB.Edit;

      pv_iIdPF := cdsPessoaFisicaFBID.Value;

      if (qryServidorNome.IsNull) or (Trim(qryServidorNome.AsString)='') then
         cdsPessoaFisicaFBNOME.AsVariant := 'A'
      else
         cdsPessoaFisicaFBNOME.AsVariant := qryServidorNome.Value;
      //cdsPessoaFisicaFBAPELIDO.AsVariant := qryServidorApelido.Value;

      if (qryServidorSEXO.AsString = '') or (qryServidorSEXO.AsString = '1') then
         cdsPessoaFisicaFBSEXO.AsString := 'M'
      else
         cdsPessoaFisicaFBSEXO.AsString := 'F';

      if not qryServidorDTNASC.IsNull then
         cdsPessoaFisicaFBDT_NASCIMENTO.AsVariant := LeftStr(qryServidorDTNASC.AsString,10);

      if qryServidorCIDNASC.AsString <> EmptyStr then
      begin
        cdsPessoaFisicaFBNATURAL_CIDADE.AsVariant := qryServidorCIDNASC.Value;
        cdsPessoaFisicaFBNATURAL_UF.AsVariant := qryServidorUFNASC.Value;
      end;

      cdsPessoaFisicaFBRG_NUM.AsVariant := qryServidorIDENTIDADE.Value;
      cdsPessoaFisicaFBRG_ORGAO_EMISSOR.AsVariant := qryServidorORGAOIDENT.Value;
      cdsPessoaFisicaFBRG_UF.AsVariant := qryServidorUFIDENT.Value;

      if not qryServidorDTIDENT.IsNull then
         cdsPessoaFisicaFBRG_DT_EMISSAO.AsVariant := LeftStr(qryServidorDTIDENT.AsString,10);

      if not qryServidorCNH.IsNull then
         cdsPessoaFisicaFBCNH_NUM.AsString := qryServidorCNH.AsString;

      cdsPessoaFisicaFBPIS_PASEP.AsVariant := qryServidorPISPASEP.Value;
      cdsPessoaFisicaFBCNH_NUM.AsVariant := qryServidorCNH.Value;
      //cdsPessoaFisicaFBCNH_DT_VENCTO.AsVariant := qryServidordtCNH_DTVALIDADE.Value;
      cdsPessoaFisicaFBTIT_ELEITOR_NUM.AsVariant := PreencheZeros(Trim(qryServidorTITELEITOR.AsString),12);
      cdsPessoaFisicaFBTIT_ELEITOR_ZONA.AsVariant := qryServidorZONA.Value;
      cdsPessoaFisicaFBTIT_ELEITOR_SECAO.AsVariant := qryServidorSECAO.Value;
      cdsPessoaFisicaFBRESERVISTA.AsVariant := qryServidorCERTMILIT.Value;
      //cdsPessoaFisicaFBRESERVISTA.AsVariant := qryServidorRESERVISTA.Value;
      if qryServidorESTCIVIL.IsNull then
         cdsPessoaFisicaFBID_ESTADO_CIVIL.AsVariant := 6
      else
         cdsPessoaFisicaFBID_ESTADO_CIVIL.AsVariant := EstadoCivil(qryServidorESTCIVIL.AsString);
      //cdsPessoaFisicaFBCONJUGE_NOME.AsVariant :=
      //cdsPessoaFisicaFBCONJUGE_CPF.AsVariant := qryServidorCPFConjuge.Value;

      cdsPessoaFisicaFBFILIACAO_PAI.AsVariant := qryServidorNOMEPAI.Value;
      cdsPessoaFisicaFBFILIACAO_MAE.AsVariant := qryServidorNOMEMAE.Value;
      cdsPessoaFisicaFBENDER_LOGRAD.AsVariant := qryServidorENDERECO.Value;
      cdsPessoaFisicaFBENDER_NUM.AsVariant := qryServidorENDNUM.Value ;
      cdsPessoaFisicaFBENDER_BAIRRO.AsVariant:= qryServidorBAIRRO.Value;
      cdsPessoaFisicaFBENDER_CIDADE.AsVariant:= qryServidorCIDADE.Value;
      cdsPessoaFisicaFBENDER_CEP.AsVariant   := qryServidorCEP.Value;
      if Trim(qryServidorRAISCOR.AsString) <> EmptyStr then
         cdsPessoaFisicaFBID_RACA_COR.AsInteger := StrToInt(Trim(qryServidorRAISCOR.AsString));
      if qryServidorEMAIL.AsString <> EmptyStr then
         cdsPessoaFisicaFBE_MAIL.AsString := qryServidorEMAIL.AsString;
      cdsPessoaFisicaFBTELEFONE.AsVariant    := qryServidorFONE.Value+'/'+qryServidorFONE2.Value+'/'+
         qryServidorFONECEL.Value;
      try
         cdsPessoaFisicaFB.Post;
      Except
         DispConteudoTab(cdsPessoaFisicaFB);
         Result := 1;
      end;

      if Result = 0 then
         SalvaRegistro(cdsPessoaFisicaFB);

      cdsPessoaFisicaFB.Close;

   end;

end;

{
Procedure TfrmPrincipal.MigraPrestadorServico;
Var
   iConta,
   iErro,
   iErroPF,
   iErroPJ: Integer;
   sIdCBO : String[6];
   iIdPrestServTemp: Integer;
   iUltId : Integer;
   sTipoPessoa: string[1];
   sCPF: string[11];
Begin

   pv_iUltIdPF   := 0;
   pv_iUltIdPJ   := 0;
   Screen.Cursor := crHourGlass;
   pv_iUltIdPagPrestServ := 0;

   Panel1.Caption := 'Migrando a Pessoa Física dos Prestadores de Serviços ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   with dmCadLanctos do
   begin

      qryPrestServico.Close;
      qryPrestServico.Open;
      MigraPF_PrestServico;

      cdsPrestServicoFB.Close;
      cdsPrestServicoFB.Open;
      iErro := 0;
      iConta:= 0;

      Panel1.Caption := 'Migrando a Tabela de Prestadores de Serviços ...';
      memLog.Lines.Add(Panel1.Caption);
      Application.ProcessMessages;

      qryPrestServico.Close;
      qryPrestServico.Open;
      qryPrestServico.First;
      dmPrincipal.DataSource1.DataSet := cdsPrestServicofb;

      While not qryPrestServico.eof do
      begin

         if (qryPrestServicoCPF_CNPJ.IsNull) or
            (Trim(qryPrestServicoCPF_CNPJ.Value)='') or
            (qryPrestServicoPessoa.Value <> 'F') then
         begin
            qryPrestServico.Next;
            Continue;
         end;
         sCPF := qryPrestServicoCPF_CNPJ.Value;
         cdsPessoaFisicaFB.Close;
         qryPessoaFisicaFB.Params[0].Value := Trim(sCPF);
         cdsPessoaFisicaFB.Open;
         if cdsPessoaFisicaFB.RecordCount = 0 Then
         begin
            qryPrestServico.Next;
            Continue;
         end;

         cdsPrestServicoFB.Append;
         cdsPrestServicoFBID.AsVariant :=
           qryPrestServicoMatricula.Value+CalcDigito(qryPrestServicoMatricula.Value);
         iIdPrestServTemp := cdsPrestServicoFBID.Value;
         cdsPrestServicofbID_PESSOA.AsVariant:= cdsPessoaFisicaFBID.Value;
         cdsPrestServicofbTIPO_PESSOA.Value  := qryPrestServicoPessoa.Value;
         if (qryPrestServicoTipo.IsNull) or (Trim(qryPrestServicoTipo.Value)='') then
            cdsPrestServicofbTIPO_SERVICO.Value := '4'
         else
            cdsPrestServicofbTIPO_SERVICO.Value := qryPrestServicoTipo.Value;
         sIdCBO := Pesquisa('CBO','CODIGO',qryPrestServicoCBO.Value,'ID','');
         if sIdCBO <> '' then
            cdsPrestServicofbID_CBO.AsVariant := sIdCBO;
         cdsPrestServicofbFUNCAO.Value       := qryPrestServicoFuncao.Value;
         if (qryPrestServicoNumDependIRRF.IsNull) or
            (Trim(qryPrestServicoNumDependIRRF.Value)='') then
            cdsPrestServicofbQTD_DEPEND_IRRF.AsVariant:= 0
         else
            cdsPrestServicofbQTD_DEPEND_IRRF.AsVariant:= qryPrestServicoNumDependIRRF.Value;
         cdsPrestServicofbOBSERVACAO.AsVariant   := qryPrestServicoObservacao.Value;
         try
            cdsPrestServicoFB.Post;
         except
            DispConteudoTab(cdsPrestServicofb);
            iErro := 1;
         end;

         if (iErro = 0) and (pv_lSalvar) then
            iErro := SalvaRegistro(dmCadLanctos.cdsPrestServicoFB);

         if iErro = 0 then
            iErro := MigraPagtoPrestServico;

         qryPrestServico.Next;

      end;

      if iErro = 0 then
      begin
      {
         if pv_lSalvar then
            AtualizaGenerator('PRESTADOR_SERVICO',iUltId);
            }

{
         Panel1.Caption :=  ' Processo concluído ... -> '+
                           IntToStr(cdsPrestServicoFB.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      frmDispTabMigrada.Executa('CadPrestadoresServicos','PRESTADOR_SERVICO');

      cdsPrestServicoFB.Close;
      qryPrestServico.Close;

   end;

   //Screen.Cursor := crDefault;

End;
}

{
Function TfrmPrincipal.MigraPF_PrestServico: Integer;
Var
   iConta: Integer;
Begin

   with dmCadLanctos do
   begin

      cdsPessoaFisicaFB.Open;
      qryPrestServico.First;
      while not qryPrestServico.eof do
      begin

         if qryPrestServicoPessoa.Value <> 'F' then
         begin
            qryPrestServico.Next;
            Continue;
         end;

         cdsPessoaFisicaFB.Append;
         cdsPessoaFisicaFBID.AsVariant              := ProxId('PESSOA_FISICA');
         cdsPessoaFisicaFBNOME.AsVariant            := qryPrestServicoNome.Value;
         if (qryPrestServicoSexo.IsNull) or (Trim(qryPrestServicoSexo.Value)='') then
            cdsPessoaFisicaFBSEXO.AsVariant         := 'M'
         else
            cdsPessoaFisicaFBSEXO.AsVariant         := qryPrestServicoSexo.Value;
         if not qryPrestServicoDataNascimento.IsNull then
            cdsPessoaFisicaFBDT_NASCIMENTO.AsVariant:= qryPrestServicoDataNascimento.AsString;
         cdsPessoaFisicaFBRG_NUM.AsVariant          := qryPrestServicoNumIdentidade.AsString;
         cdsPessoaFisicaFBRG_ORGAO_EMISSOR.AsVariant:= qryPrestServicoOrgEmissorIdentidade.AsString;
         cdsPessoaFisicaFBRG_UF.AsVariant           := qryPrestServicoUFOrgEmissorIdentidade.AsString;
         if not qryPrestServicoDataEmissaoIdentidade.IsNull then
            cdsPessoaFisicaFBRG_DT_EMISSAO.AsVariant:= qryPrestServicoDataEmissaoIdentidade.AsString;
         cdsPessoaFisicaFBCPF.AsVariant             := qryPrestServicoCPF_CNPJ.AsString;
         cdsPessoaFisicaFBPIS_PASEP.AsVariant       := qryPrestServicoPIS_PASEP.AsString;
         cdsPessoaFisicaFBENDER_LOGRAD.AsVariant    := qryPrestServicoEndereco.AsString;
         cdsPessoaFisicaFBENDER_NUM.AsVariant       := '';
         cdsPessoaFisicaFBENDER_CIDADE.AsVariant    := qryPrestServicoCidade_UF.AsString;
         cdsPessoaFisicaFBENDER_UF.AsVariant        := '';
         cdsPessoaFisicaFBTELEFONE.AsVariant        := qryPrestServicoTelefones.AsString;
         Result := 0;
         try
            cdsPessoaFisicaFB.Post;
         except
            DispConteudoTab(cdsPessoaFisicaFB);
         end;
         if pv_lSalvar then
            try
               SalvaRegistro(dmCadLanctos.cdsPessoaFisicaFB);
            except
               Result := 1;
            end;
            {
         if (Result = 0) and (pv_lSalvar) then
            AtualizaGenerator('PESSOA_FISICA',cdsPessoaFisicaFBID.Value);
            }

         //   Result := cdsPessoaFisicaFBID.Value;


{
         qryPrestServico.Next;

      end;

      cdsPessoaFisicaFB.Close;

   end;

end;
}


{
Function TfrmPrincipal.MigraPJ_PrestServico: Integer;
Var
   iConta: Integer;
begin

   result := 1;
   exit;

   with dmCadLanctos do
   begin

      cdsPessoaJuridicaFB.Close;
      qryPessoaJuridicaFB.Params[0].Value := qryPrestServicoCPF_CNPJ.Value;
      cdsPessoaJuridicaFB.Open;
      if cdsPessoaJuridicaFB.RecordCount > 0 Then
      begin
         pv_iIdPJ := cdsPessoaJuridicaFBID.Value;
         Exit;
      end;

      pv_iIdPJ := pv_iIdPJ + 1;
      pv_iIdPJ := pv_iUltIdPF;
      Result   := 0;
      cdsPessoaJuridicaFB.Append;
      if pv_lSalvar then
         cdsPessoaJuridicaFBID.AsVariant           := ProxId('PESS0A_JURIDICA')
      else
         cdsPessoaJuridicaFBID.AsVariant           := pv_iIdPJ;
      cdsPessoaJuridicaFBRAZAO_SOCIAL.AsVariant    := qryPrestServicoNome.Value;
      cdsPessoaJuridicaFBNOME_FANTASIA.AsVariant   := qryPrestServicoNome.Value;
      cdsPessoaJuridicaFBCNPJ.AsVariant            := qryPrestServicoCPF_CNPJ.AsString;
      cdsPessoaJuridicaFBNOME_RESPONSAVEL.AsVariant:= '';
      cdsPessoaJuridicaFBINSCR_ESTADUAL.AsVariant  := 0;
      cdsPessoaJuridicaFBINSCR_MUNICIPAL.AsVariant := 0;
      cdsPessoaJuridicaFBENDER_LOGRAD.AsVariant    := qryPrestServicoEndereco.AsString;
      cdsPessoaJuridicaFBENDER_NUM.AsVariant       := '';
      cdsPessoaJuridicaFBENDER_CIDADE.AsVariant    := qryPrestServicoCidade_UF.AsString;
      cdsPessoaJuridicaFBENDER_UF.AsVariant        := '';
      cdsPessoaJuridicaFBTELEFONE.AsVariant        := qryPrestServicoTelefones.AsString;
      try
         cdsPessoaJuridicaFB.Post;
      except
         DispConteudoTab(cdsPessoaJuridicaFB);
         Result := 1;
      end;
      if (Result = 0) and (pv_lSalvar) then
         Try
            SalvaRegistro(dmCadLanctos.cdsPessoaJuridicaFB);
         except
            Result := 1;
         end;

         {
      if (Result = 0) and (pv_lSalvar) then
         AtualizaGenerator('PESSOA_JURIDICA',cdsPessoaJuridicaFBID.Value);
         }


{
      cdsPessoaJuridicaFB.Close;

   end;

end;
}

function TFrmPrincipal.MigraContaBancaria(sIdServid: string): Integer;
var
   sIdEntidFinanc: string;
   sNumConta     : string[11];
Begin

   result := 0;

   if sIdServid = '0' then exit;

   with dmCadLanctos do
   begin

      try

         sIdEntidFinanc := Pesquisa('ENTID_FINANC', 'COD_BANCO',qryServidorBANCO.AsString, 'ID');

         if sIdEntidFinanc = EmptyStr then Exit;

         cdsContaBancServid.Close;
         cdsContaBancServid.Params[0].AsInteger := StrToInt(sIdServid);
         cdsContaBancServid.Open;

         if cdsContaBancServid.RecordCount > 0 then
           Exit;

         memLog.Lines.Add('Migrando a Conta Bancária do Servidor ...');

         cdsContaBancServid.Append;
         cdsContaBancServidID.Value             := ProxId('SERVIDOR_CONTA_BANC');
         cdsContaBancServidID_SERVIDOR.Value    := StrToInt(sIdServid);
         cdsContaBancServidTIPO_CONTA.Value     := 1;

         cdsContaBancServidID_ENTID_FINANC.AsVariant := sIdEntidFinanc;

         if (Trim(qryServidorAGENCIA.AsString) <> EmptyStr) then
            cdsContaBancServidAGENCIA.AsVariant := Trim(qryServidorAGENCIA.Value)+'-'+Trim(qryServidorDVAGENCIA.Value);

         if (Trim(qryServidorCONTA.AsString) = EmptyStr) then
         begin
            if qryServidorBANCO.Value = '037' then
               sNumConta := '8888888-8'
            else
               sNumConta := '0';
         end else
            sNumConta := Trim(qryServidorCONTA.Value)+'-'+Trim(qryServidorDVCONTA.Value);
         cdsContaBancServidNUM_CONTA.AsVariant := sNumConta;

         if cdsContaBancServidNUM_CONTA.Value <> '0' then
            cdsContaBancServidATIVA.Value := 'S'
         else
            cdsContaBancServidATIVA.Value := 'N';

         try
            cdsContaBancServid.Post;
         except
            DispConteudoTab(cdsContaBancServid);
            Result := 1;
         end;

         if (Result = 0) then
            try
               Result := SalvaRegistro(cdsContaBancServid);
            except
               Result := 1;
            end;


      finally
         cdsContaBancServid.Close;
      end;
   end;
end;

Function TFrmPrincipal.MigraMovimEstFuncional(sMatric: string; iIdServidor: Integer): Integer;
Var
   sIdMovimPrevid, sEstadoFuncional: string;
   iUltId: Integer;
   dTemp: TDate;
Begin

   result := 0;

   with dmCadLanctos do
   begin

      cdsMovimEstFuncRetFb.Close;
      qryMovimEstFuncRetFb.Params[0].Value := iIdServidor;
      cdsMovimEstFuncRetFb.Open;

      if cdsMovimEstFuncRetFb.RecordCount > 0 then
        Exit;

      cdsHistMovimEstFuncFB.Close;
      qryHistMovimEstFuncFB.Params[0].Value := iIdServidor;
      cdsHistMovimEstFuncFB.Open;

      memLog.Lines.Add('Migrando os Lançamentos de Movim. de Est. Funcional ...');

      while not cdsMovServidLO.eof do
      begin

         sIdMovimPrevid := '';
         cdsHistMovimEstFuncfb.Append;
         cdsHistMovimEstFuncfbID.AsVariant          := ProxId('HIST_MOVIM_EST_FUNC');
         cdsHistMovimEstFuncfbID_SERVIDOR.AsInteger := cdsServidorFBID.AsInteger;

         sEstadoFuncional := Trim(cdsMovServidLOCODFOL.AsString);

         if sEstadoFuncional <> EmptyStr then
           sEstadoFuncional := Pesquisa('ESTADO_FUNCIONAL', 'ID_SYS_ANTER', sEstadoFuncional, 'ID');

         if sEstadoFuncional = EmptyStr then
           sEstadoFuncional := '1';

         cdsHistMovimEstFuncfbID_EST_FUNC_ATUAL.AsString := sEstadoFuncional;

         cdsHistMovimEstFuncfbDT_MOVIM.AsVariant := LeftStr(cdsMovServidLODTINICIO.AsString,10);
         sIdMovimPrevid := Trim(cdsMovServidLOCODGFIP.AsString);

         if sIdMovimPrevid <> '' then
         begin
            sIdMovimPrevid := Pesquisa('TAB_MOVIM_PREVID','COD_MOVIM',sIdMovimPrevid,'ID');
            if sIdMovimPrevid <> '' then
               cdsHistMovimEstFuncfbID_MOVIM_PREVID.AsVariant  := sIdMovimPrevid;
         end;
         cdsHistMovimEstFuncFBOBSERVACAO.Value     := cdsMovServidLOOBS.Value;
         cdsHistMovimEstFuncfbMOVIM_READMISSAO.Value   := 'N';
         cdsHistMovimEstFuncfbORIGEM_LANCTO.Value      := '1';

         iUltId := cdsHistMovimEstFuncfbID.Value;

         try
            cdsHistMovimEstFuncfb.Post;
         except
            memLog.Lines.Add('Servidor: '+qryServidorMATRICULA.AsString);
            DispConteudoTab(cdsHistMovimEstFuncfb);
            Result := 1;
         end;

         if (Result = 0) then
         begin

            try
               SalvaRegistro(cdsHistMovimEstFuncfb);
            except
               DispConteudoTab(cdsHistMovimEstFuncfb);
               Result := 1;
            end;

            if Result = 0 then
            begin
               if not cdsMovServidLODTFIM.IsNull then
               begin
                 dTemp := Trunc(cdsMovServidLODTFIM.AsDateTime);
                 if ExtraiAnoMesData(DateToStr(dTemp)) < pv_AnoMesAtual then
                 begin
                    cdsHistMovimEstFuncfb.Append;
                    cdsHistMovimEstFuncfbID.AsVariant               := ProxId('HIST_MOVIM_EST_FUNC');
                    cdsHistMovimEstFuncfbID_SERVIDOR.Value          := cdsServidorFBID.AsInteger;
                    //cdsHistMovimEstFuncfbID_EST_FUNC_ANTER.AsVariant:= qryHistMovimEstFuncCodSituacao.Value;
                    cdsHistMovimEstFuncfbID_EST_FUNC_ATUAL.AsVariant:= 1;
                    cdsHistMovimEstFuncfbDT_MOVIM.AsVariant         := LeftStr(cdsMovServidLODTFIM.AsString,10);
                    cdsHistMovimEstFuncFBOBSERVACAO.Value     := cdsMovServidLOOBS.Value;
                    cdsHistMovimEstFuncfbMOVIM_READMISSAO.Value   := 'N';
                    cdsHistMovimEstFuncfbORIGEM_LANCTO.Value      := '1';
                    try
                       SalvaRegistro(cdsHistMovimEstFuncfb);
                    except
                       DispConteudoTab(cdsHistMovimEstFuncfb);
                       Result := 1;
                    end;

                 end else
                 begin
                    cdsMovimEstFuncRetFb.Append;
                    cdsMovimEstFuncRetFbID_SERVIDOR.Value := cdsServidorFBID.AsInteger;
                    cdsMovimEstFuncRetFbID.AsVariant      := iUltId;
                    cdsMovimEstFuncRetFbDT_MOVIM.AsString := LeftStr(cdsMovServidLODTFIM.AsString,10);
                    try
                       cdsMovimEstFuncRetFb.Post;
                    except
                       DispConteudoTab(cdsMovimEstFuncRetFb);
                       Result := 1;
                    end;
                    if Result = 0 then
                       Result := SalvaRegistro(cdsMovimEstFuncRetFb);
                 end;
               end;

            end;

            if Result <> 0 then break;

            cdsMovServidLO.Next;

         end;

         if Result = 0 then
            memLog.Lines.Add(IntToStr(cdsHistMovimEstFuncfb.RecordCount)+' Registros migrados ...');

         cdsMovimEstFuncRetFb.Close;
         cdsHistMovimEstFuncFB.Close;
         cdsMovServidLO.Close;

      end;

   end;

End;


function TFrmPrincipal.MigraServDepedente: Integer;
begin

   result := 0;

   with dmCadLanctos do
   begin

      cdsServDependenteFB.Close;
      qryServDependenteFB.Params[0].Value := cdsServidorFBID.Value;
      cdsServDependenteFB.Open;

      qryServDependente.Close;
      qryServDependente.Params[0].Value := qryServidorMatricula.Value;
      qryServDependente.Open;

      try
         while not qryServDependente.eof do
         begin

            cdsServDependentefb.Append;
            cdsServDependentefbID.AsVariant         := ProxId('SERVIDOR_DEPENDENTE');
            cdsServDependentefbID_SERVIDOR.Value       := cdsServidorFBID.Value;
            cdsServDependentefbNOME.AsVariant          := qryServDependenteNOMEDEP.Value;
            if qryServDependenteSexo.IsNull or (trim(qryServDependenteSexo.AsString) = '') then
               cdsServDependentefbSEXO.AsString := 'M'
            else
               qryServDependentefbSEXO.AsVariant := qryServDependenteSEXO.Value;
            if (qryServDependenteParent.IsNull) or
               (trim(qryServDependenteParent.AsString) = '') or
               (qryServDependenteParent.AsString = '3') then
               cdsServDependentefbPARENTESCO.AsVariant    := 5
            else
               cdsServDependentefbPARENTESCO.AsVariant    := qryServDependentePARENT.Value;
            if (qryServDependenteNASCDEP.IsNull) or
               (trim(qryServDependenteNASCDEP.AsString) = '') then
               cdsServDependentefbDT_NASCIMENTO.AsVariant := '01/01/1900'
            else
               cdsServDependentefbDT_NASCIMENTO.AsVariant := qryServDependenteNASCDEP.AsString;
            //sServDependentefbNATURAL_CIDADE.AsVariant:= qryServDependenteCIDNASC.Value;
            //sServDependentefbNATURAL_UF.Value        := qryServDependenteUF.Value;
            //sServDependentefbCARTORIO_NOME.Value     := qryServDependenteNOMECARTORIO.Value;
            //cdsServDependentefbCARTORIO_CIDADE.Value   := qryServDependenteCidade.Value;
            cdsServDependentefbCARTORIO_UF.Value       := '';
            //cdsServDependentefbREGISTRO_NUM.Value      := qryServDependenteNumRegistro.Value;
            //cdsServDependentefbREGISTRO_LIVRO.Value    := qryServDependenteNumLivro.Value;
            //cdsServDependentefbREGISTRO_FOLHA.Value    := qryServDependenteNumFolha.Value;
            cdsServDependentefbATIVO_SAL_FAMILIA.Value := 'S';
            cdsServDependentefbATIVO_IRRF.Value        := 'S';
            try
               cdsServDependentefb.Post;
            except
               DispConteudoTab(cdsServDependentefb);
               Result := 1;
            end;
            if (Result = 0) then
            begin
               Result := SalvaRegistro(cdsServDependentefb);
               if Result = 1 then
                  DispConteudoTab(dmCadLanctos.cdsServDependentefb);
            end;
            qryServDependente.Next;
         end;
      finally
         cdsServDependenteFB.Close;
         qryServDependente.Close;
      end;

   end;

end;

{
Function TfrmPrincipal.MigraHistMudaCargo: Integer;
Var
  iUltId: integer;
Begin

   result := 0;
   {

   with dmCadLanctos do
   begin

      memLog.Lines.Add('Migrando os Lançtos de Mudança de Cargo ...');

      cdsHistMudaCargoFB.Close;
      qryHistMudaCargoFB.Params[0].Value := cdsServidorFBID.Value;
      cdsHistMudaCargoFB.Open;

      qryHistMudaCargo.Close;
      qryHistMudaCargo.Params[0].Value := qryServidorREGISTRO.Value;
      qryHistMudaCargo.Open;

      try
         while not qryHistMudaCargo.eof do
         begin
            cdsHistMudaCargofb.Append;
            cdsHistMudaCargofbID.AsVariant            := ProxId('HIST_MUDA_CARGO');
            cdsHistMudaCargofbID_SERVIDOR.Value       := cdsServidorFBID.Value;
            cdsHistMudaCargofbID_CARGO_ANTER.AsVariant:= qryHistMudaCargoANTERIOR.AsInteger+
               StrToInt(edAddIdCargo.Text);
            cdsHistMudaCargofbID_CARGO_ATUAL.AsVariant:= qryHistMudaCargoCARGO.AsInteger+
               StrToInt(edAddIdCargo.Text);
            cdsHistMudaCargofbDT_MUDANCA.AsVariant    := LeftStr(qryHistMudaCargoDHTRANSF.AsString,10);
            cdsHistMudaCargofbID_MOTIVO.AsVariant     := 1+StrToInt(edAddIdMotivoMuda.Text);
            cdsHistMudaCargofbOBSERVACAO.AsVariant    := qryHistMudaCargoNUMDOC.Value;
            try
               cdsHistMudaCargofb.Post;
            except
               DispConteudoTab(cdsHistMudaCargofb);
               Result := 1;
            end;
            if (Result = 0) and (pv_lSalvar) then
            begin
               Result := SalvaRegistro(dmCadLanctos.cdsHistMudaCargofb);
               if Result = 1 then
                  DispConteudoTab(dmCadLanctos.cdsHistMudaCargofb);
            end;
            iUltId := dmCadLanctos.cdsHistMudaCargofbID.Value;
            qryHistMudaCargo.Next;
         end;
      finally
         if Result = 0 then
         begin
            memLog.Lines.Add(IntToStr(cdsHistMudaCargofb.RecordCount)+
               ' Registros migrados ...');
               {
            if pv_lSalvar then
               AtualizaGenerator('HIST_MUDA_CARGO',iUltId);
               }
   {     end;
         cdsHistMudaCargoFB.Close;
         qryHistMudaCargo.Close;
      end;

   end;}

//end;

{
Function TfrmPrincipal.MigraDepBancario: Integer;
Var
   sIdEntidFinanc: String[3];
Begin

   result := 0;

   with dmCadLanctos do
   begin

      cdsDepBancarioFB.Close;
      qryDepBancarioFB.Params[0].Value := cdsServidorFBID.Value;
      cdsDepBancarioFB.Open;

      qryDepBancario.Close;
      qryDepBancario.Params[0].Value := qryServidorMatricula.Value;
      qryDepBancario.Open;

      memLog.Lines.Add('Migrandos os Registros dos Depósitos Bancários ...');

      while not qryDepBancario.eof do
      begin
         sIdEntidFinanc := Pesquisa('ENTID_FINANC','COD_BANCO',qryDepBancarioCodBanco.Value,'ID','');
         if sIdEntidFinanc = '' then
         begin
            memLog.Lines.Add('Não foi possível migrar o Dep. Bancário do Mês '+qryDepBancarioAnoMes.Value+
              'Cód. do Banco, inválido ('+qryDepBancarioCodBanco.Value+')');
         end else
         begin
            cdsDepBancariofb.Append;
            cdsDepBancariofbANO_MES.AsVariant        := NovoAnoMes(qryDepBancarioAnoMes.Value);
            cdsDepBancariofbPARCELA.Value            := '0';
            cdsDepBancariofbID_SERVIDOR.AsVariant    := cdsServidorFBID.Value;
            cdsDepBancariofbID_ENTID_FINANC.AsVariant:= sIdEntidFinanc;
            cdsDepBancariofbBANCO_AGENCIA.AsVariant  := qryDepBancarioAgencia.Value;
            cdsDepBancariofbBANCO_NUM_CONTA.AsVariant:= qryDepBancarioNumConta.Value;
            cdsDepBancariofbVALOR.AsVariant          := qryDepBancarioValor.Value;
            try
               cdsDepBancariofb.Post;
            except
               on E: Exception do
               begin
                  memLog.Lines.add('Não foi possível Gravar na Tabela Config_Deposito_Bancario ...'+#13+
                   '('+E.Message+')');
                  DispConteudoTab(cdsDepBancariofb);
                  Result := 1;
                  break;
               end;
            end;   
            if (Result = 0) and (pv_lSalvar) then
            begin
               Result := SalvaRegistro(cdsDepBancariofb);
               if Result = 1 then
               begin
                  DispConteudoTab(cdsDepBancariofb);
                  break;
               end;
            end;
            qryDepBancario.Next;
         end;
      end;
      if Result = 0 then
         memLog.Lines.Add(IntToStr(cdsDepBancariofb.RecordCount)+' Registros migrados ...');
      cdsDepBancarioFB.Close;
      qryDepBancario.Close;
   end;

end;
}

{
Function TfrmPrincipal.MigraHistTransfSubUndOrcam: Integer;
Var
   iUltId: Integer;
Begin
   result := 0;
{
   with dmCadLanctos do
   begin

      cdsHistTrasfSubUndOrcfb.Close;
      qryHistTrasfSubUndOrcfb.Params[0].Value := cdsServidorFBID.Value;
      cdsHistTrasfSubUndOrcFB.Open;

      qryHistTrasfSubUndOrc.Close;
      qryHistTrasfSubUndOrc.Params[0].Value := qryServidorREGISTRO.Value;
      qryHistTrasfSubUndOrc.Open;

      memLog.Lines.Add('Migrando os Lançamentos de Transf. de C. de Custos ...');

      try
         while not qryHistTrasfSubUndOrc.eof do
         begin
            cdsHistTrasfSubUndOrcfb.Append;
            cdsHistTrasfSubUndOrcfbID.AsVariant            := ProxId('HIST_TRANSF_SUB_UND_ORCAM');
            cdsHistTrasfSubUndOrcfbID_SERVIDOR.Value       := cdsServidorFBID.Value;
            cdsHistTrasfSubUndOrcfbID_SUB_UND_ORCAM_ANTER.AsVariant:= qryHistTrasfSubUndOrcANTERIOR.AsInteger+
               StrToInt(edAddIdSubUnidOrcam.Text);
            cdsHistTrasfSubUndOrcfbID_SUB_UND_ORCAM_ATUAL.AsVariant:= qryHistTrasfSubUndOrcUNIDADE.AsInteger+
               StrToInt(edAddIdSubUnidOrcam.Text);
            cdsHistTrasfSubUndOrcfbDT_TRANSF.AsVariant     := LeftStr(qryHistTrasfSubUndOrcDHTRANSF.AsString,10);
            cdsHistTrasfSubUndOrcfbOBSERVACAO.AsVariant    := qryHistTrasfSubUndOrcOBS.Value;
            iUltId := cdsHistTrasfSubUndOrcfbID.Value;
            try
               cdsHistTrasfSubUndOrcfb.Post;
            except
               DispConteudoTab(cdsHistTrasfSubUndOrcfb);
               Result := 1;
            end;
            if (Result = 0) and (pv_lSalvar) then
            begin
               Result := SalvaRegistro(dmCadLanctos.cdsHistTrasfSubUndOrcfb);
               if Result = 1 then
                  DispConteudoTab(dmCadLanctos.cdsHistTrasfSubUndOrcfb);
            end;
            qryHistTrasfSubUndOrc.Next;
         end;
      finally
         if Result = 0 then
         begin
         {
            if pv_lSalvar then
               AtualizaGenerator('HIST_TRANSF_SUB_UND_ORC',iUltId);
               }
{           memLog.Lines.Add(IntToStr(cdsHistTrasfSubUndOrcfb.RecordCount)+' Registros migrados ...');
         end;
         cdsHistTrasfSubUndOrcFB.Close;
         qryHistTrasfSubUndOrc.Close;
      end;

   end;   }

//end;

Function TFrmPrincipal.MigraEventosFixos: Integer;
Begin
   result := 0;
{
   with dmCadLanctos do
   begin

     cdsServEventoFixoFB.Close;
     qryServEventoFixoFB.Params[0].Value := cdsServidorFBID.Value;
     cdsServEventoFixoFB.Open;
     cdsServEventoFixoFB.IndexFieldNames := 'id_servidor;id_evento';

     qryEventoFixo.Close;
     qryEventoFixo.Params[0].Value := qryServidorREGISTRO.Value;
     qryEventoFixo.Open;

     memLog.Lines.Add('Migrando os Eventos Fixos do Servidor ...');

     try
        while not qryEventoFixo.eof do
        begin

           if qryEventoFixoEVENTO.Value = '001' then
           begin
              qryEventoFixo.Next;
              Continue;
           end;

           if not cdsServEventoFixofb.FindKey([cdsServidorFBID.Value,
              qryEventoFixoEVENTO.AsInteger+StrToInt(edAddIdEvento.Text)]) then
           begin
              cdsServEventoFixofb.Append;
              cdsServEventoFixofbID_SERVIDOR.Value     := cdsServidorFBID.Value;
              cdsServEventoFixoFBID_EVENTO.AsVariant   := qryEventoFixoEVENTO.AsInteger+
                 StrToInt(edAddIdEvento.Text);
           end else
              cdsServEventoFixofb.Edit;
           if qryEventoFixoQTDE.IsNull then
              cdsServEventoFixoFBQTD.AsVariant         := 0
           else
              cdsServEventoFixoFBQTD.AsVariant         := qryEventoFixoQTDE.Value;
           if (qryEventoFixoPERC.Value > 1) and (qryEventoFixoQTDE.Value = 1) then
              cdsServEventoFixoFBQTD.AsVariant := qryEventoFixoPERC.Value;
           cdsServEventoFixoFBVALOR.AsVariant          := qryEventoFixoValor.Value;
           //cdsServEventoFixoFBOBSERVACAO.AsVariant     := qryEventoFixoObservacao.Value;
           //cdsServEventoFixoFBINI_VALIDADE.AsVariant   :=
           //cdsServEventoFixoFBFIM_VALIDADE.AsVariant   :=
           //if not qryEventoFixoDecTerceiro.IsNull then
           //   cdsServEventoFixoFBCALC_DEC_TERC.AsVariant:= qryEventoFixoDecTerceiro.Value
           //else
           cdsServEventoFixoFBCALC_DEC_TERC.AsVariant:= 'S';
           cdsServEventoFixoFBPARTICIPA.Value           := 'S';
           try
              cdsServEventoFixofb.Post;
           except
              DispConteudoTab(cdsServEventoFixoFB);
              Result := 1;
           end;
           if (Result = 0) and (pv_lSalvar) then
           begin
              Result := SalvaRegistro(dmCadLanctos.cdsServEventoFixofb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsServEventoFixofb);
           end;
           qryEventoFixo.Next;
        end;
     finally
        if Result = 0 then
           memLog.Lines.Add(IntToStr(cdsServEventoFixoFB.RecordCount)+' Registros migrados ...');
        cdsServEventoFixoFB.Close;
        qryEventoFixo.Close;
     end;
   end;
}
end;

Function TFrmPrincipal.MigraEventosMes: Integer;
Begin
   result := 0;
{
   with dmCadLanctos do
   begin

     cdsEventoMesFB.Close;
     qryEventoMesFB.Params[0].Value := cdsServidorFBID.Value;
     cdsEventoMesFB.Open;
     cdsEventoMesFB.IndexFieldNames := 'ANO_MES;PARCELA;ID_SERVIDOR;ID_EVENTO';

     qryLanctoMes.Close;
     qryLanctoMes.Params[0].Value := qryServidorREGISTRO.Value;
     qryLanctoMes.Open;

     memLog.Lines.Add('Migrando os Eventos do Mês do Servidor...');

     try
       while not qryLanctoMes.eof do
       begin
          if ((qryLanctoMesANO_MES.IsNull) or (Trim(qryLanctoMesANO_MES.Value)='')) or
             ((qryLanctoMesEVENTO.IsNull) or (Trim(qryLanctoMesEVENTO.Value)='')) then
          begin
             qryLanctoMes.Next;
             Continue;
          end;

          if not cdsEventoMesfb.FindKey([NovoAnoMes(qryLanctoMesANO_MES.Value),
             '0',cdsServidorFBID.Value,
             qryLanctoMesEVENTO.AsInteger+StrToInt(edAddIdEvento.Text)]) then
          begin
             cdsEventoMesfb.Append;
             cdsEventoMesfbANO_MES.Value            := NovoAnoMes(qryLanctoMesANO_MES.Value);
             cdsEventoMesfbPARCELA.Value            := '0';
             cdsEventoMesfbID_SERVIDOR.Value        := cdsServidorFBID.Value;
             cdsEventoMesFBID_EVENTO.AsVariant      := qryLanctoMesEVENTO.AsInteger+
                StrToInt(edAddIdEvento.Text);
          end else
             cdsEventoMesfb.Edit;
          if (qryLanctoMesQTDE.Value = 0) and (qryLanctoMesPERCENTUAL.Value = 0) then
             cdsEventoMesFBQTD.AsVariant         := 0
          else if (qryLanctoMesQTDE.Value = 0) and (qryLanctoMesPERCENTUAL.Value > 0) then
             cdsEventoMesFBQTD.AsVariant         := qryLanctoMesPERCENTUAL.Value
          else if (qryLanctoMesQTDE.Value > 0) then
             cdsEventoMesFBQTD.AsVariant         := qryLanctoMesQTDE.Value;
          cdsEventoMesFBVALOR.AsVariant          := qryLanctoMesVALORUNI.Value;
          cdsEventoMesFBOBSERVACAO.AsVariant     := qryLanctoMesREFERENCIA.Value;
          cdsEventoMesFBPARTICIPA.Value          := 'S';
          try
             cdsEventoMesfb.Post;
          except
             DispConteudoTab(cdsEventoMesfb);
             Result := 1;
          end;
          if (Result = 0) and (pv_lSalvar) then
          begin
             Result := SalvaRegistro(dmCadLanctos.cdsEventoMesfb);
             if Result = 1 then
                DispConteudoTab(dmCadLanctos.cdsEventoMesfb);
          end;
          if Result = 1 then
          begin
             memLog.Lines.Add('Erro na tabela de Eventos do Mês (Ano/Mês: '+
                              qryLanctoMesANO_MES.Value+' / Evento: '+qryLanctoMesEVENTO.Value+')');
             Break;
          end;
          qryLanctoMes.Next;
       end;
     finally
       if Result = 0 then
          memLog.Lines.Add(IntToStr(cdsEventoMesfb.RecordCount)+' Registros migrados ...');
       cdsEventoMesfb.Close;
       qryLanctoMes.Close;
     end;

   end;
}
end;

{
Function TfrmPrincipal.MigraEventosCalc: Integer;
Var
   iUltIdEventoInexist: Integer;
   sCodEventoAnter: string[3];
Begin
   result := 0;

   with dmCadLanctos do
   begin

      cdsLanctoCalcfb.Close;
      qryLanctoCalcfb.Params[0].Value := cdsServidorFBID.Value;
      cdsLanctoCalcFB.Open;

      qryEventoCalc.Close;
      qryEventoCalc.Params[0].Value := qryServidorMatricula.Value;
      qryEventoCalc.Open;

      iUltIdEventoInexist := IdEventoInexist;
      sCodEventoAnter:= '';

      memLog.Lines.Add('Migrando os Eventos Calculados do Servidor ...');

      try
        while not qryEventoCalc.eof do
        begin
           if ((qryEventoCalcAnoMes.IsNull) or (Trim(qryEventoCalcAnoMes.Value)='')) or
              ((qryEventoCalcCodVencDesc.IsNull) or (Trim(qryEventoCalcCodVencDesc.Value)='')) then
           begin
              qryEventoCalc.Next;
              Continue;
           end;

           if not frmPrincipal.cdsBCMesServidor.FindKey([qryEventoCalcAnoMes.Value,
              qryEventoCalcMatricula.Value]) then
           begin
              qryEventoCalc.Next;
              Continue;
           end;

           cdsLanctoCalcfb.Append;
           cdsLanctoCalcfbANO_MES.Value            := NovoAnoMes(qryEventoCalcAnoMes.Value);
           cdsLanctoCalcfbPARCELA.Value            := '0';
           cdsLanctoCalcfbID_SERVIDOR.Value        := cdsServidorFBID.Value;
           if ((qryEventoCalcCodVencDesc.IsNull) or (Trim(qryEventoCalcCodVencDesc.Value)='')) or
              (PesquisaPdox('VencDesc','Codigo',qryEventoCalcCodVencDesc.Value,'Codigo')='') then
           begin
              cdsLanctoCalcFBID_EVENTO.AsVariant   := iUltIdEventoInexist;
              Inc(iUltIdEventoInexist);
           end else
              cdsLanctoCalcFBID_EVENTO.AsVariant   := qryEventoCalcCodVencDesc.AsInteger+
                StrToInt(edAddIdEvento.Text);
           if qryEventoCalcQuantidade.IsNull then
              cdsLanctoCalcFBQTD.AsVariant         := 0
           else
              cdsLanctoCalcFBQTD.AsVariant         := qryEventoCalcQuantidade.Value;
           if qryEventoCalcValor.IsNull then
              cdsLanctoCalcFBVALOR.AsVariant       := 0
           else
              cdsLanctoCalcFBVALOR.AsVariant       := qryEventoCalcValor.Value;
           cdsLanctoCalcfbOBSERVACAO.AsVariant     := qryEventoCalcObservacao.Value;
           try
              cdsLanctoCalcfb.Post;
           except
              DispConteudoTab(cdsLanctoCalcfb);
              Result := 1;
           end;
           if (Result = 0) and (pv_lSalvar) then
           begin
              Result := SalvaRegistro(dmCadLanctos.cdsLanctoCalcfb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsLanctoCalcfb);
           end;
           if Result = 1 then
           begin
              memLog.Lines.Add('Erro na tabela de Eventos Calculados (Ano/Mês'+
                qryEventoCalcAnoMes.Value+' / '+qryEventoCalcCodVencDesc.Value+')');
              Break;
           end;
           qryEventoCalc.Next;
        end;
      finally
        if Result = 0 then
           memLog.Lines.Add(IntToStr(cdsLanctoCalcfb.RecordCount)+' Registros Migrados ...');;
        cdsLanctoCalcfb.Close;
        qryEventoCalc.Close;
      end;

   end;

end;
}


{
Function TfrmPrincipal.MigraDeducaoEntidPrevid: Integer;
Begin
   result := 0;

   with dmCadLanctos do
   begin

      cdsDeduzEntidPrevidfb.Close;
      qryDeduzEntidPrevidfb.Params[0].Value := cdsServidorFBID.Value;
      cdsDeduzEntidPrevidFB.Open;

      qryDeduzEntidPrevid.Close;
      qryDeduzEntidPrevid.Params[0].Value := qryServidorMatricula.Value;
      qryDeduzEntidPrevid.Open;

      memLog.Lines.Add('Migrando os Registros de Cálculo de Licença Maternidade ...');

      try
        while not qryDeduzEntidPrevid.eof do
        begin
           if (qryDeduzEntidPrevidAnoMes.IsNull) or (Trim(qryDeduzEntidPrevidAnoMes.Value)='') then
           begin
              qryDeduzEntidPrevid.Next;
              Continue;
           end;
           cdsDeduzEntidPrevidfb.Append;
           cdsDeduzEntidPrevidfbANO_MES.Value             := NovoAnoMes(qryDeduzEntidPrevidAnoMes.Value);
           cdsDeduzEntidPrevidfbID_SERVIDOR.Value         := cdsServidorFBID.Value;
           cdsDeduzEntidPrevidfbID_EST_FUNCIONAL.AsVariant:= StrToInt(edAddIdEstFunc.Text)+14; // Verificar p/ cada Órgão ...
           cdsDeduzEntidPrevidfbQTD_DIA.AsVariant         := qryDeduzEntidPrevidQuantidade.Value;
           cdsDeduzEntidPrevidfbVALOR.AsVariant           := qryDeduzEntidPrevidValor.Value; // verificar as datas admissão / readmissão
           try
              cdsDeduzEntidPrevidfb.Post;
           except
              DispConteudoTab(cdsDeduzEntidPrevidfb);
              Result := 1;
           end;
           if (Result = 0) and (pv_lSalvar) then
           begin
              Result := SalvaRegistro(dmCadLanctos.cdsDeduzEntidPrevidfb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsDeduzEntidPrevidfb);
           end;
           if Result = 1 then Break;
           qryDeduzEntidPrevid.Next;
        end;
      finally
        if Result = 0 then
           memLog.Lines.Add(IntToStr(cdsDeduzEntidPrevidfb.RecordCount)+' Registros migrados ...');
        cdsDeduzEntidPrevidfb.Close;
        qryDeduzEntidPrevid.Close;
      end;
   end;

end;
}

{
Function TfrmPrincipal.MigraAtestadoMedico: Integer;
Var
   iUltAtestao: integer;
Begin
   result := 0;

   with dmCadLanctos do
   begin

      cdsAtestadoMedicofb.Close;
      qryAtestadoMedicofb.Params[0].Value := cdsServidorFBID.Value;
      cdsAtestadoMedicofb.Open;

      qryAtestadoMedico.Close;
      qryAtestadoMedico.Params[0].Value := qryServidorMatricula.Value;
      qryAtestadoMedico.Open;

      memLog.Lines.Add('Migrando os Lançamentos de Atestados Médicos ...');

      while not qryAtestadoMedico.eof do
      begin
         cdsAtestadoMedicofb.Insert;
         cdsAtestadoMedicofbID.AsVariant              := ProxId('ATESTADO_MEDICO');
         cdsAtestadoMedicofbID_SERVIDOR.Value         := dmCadLanctos.cdsServidorFBID.Value;
         cdsAtestadoMedicofbINI_PERIODO.AsVariant     := qryAtestadoMedicoData_Inicial.Value;
         cdsAtestadoMedicofbFIM_PERIODO.AsVariant     := qryAtestadoMedicoData_Final.Value;
         cdsAtestadoMedicofbMEDICO_NOME.AsVariant     := qryAtestadoMedicoNome_Medico.Value;
         cdsAtestadoMedicofbMEDICO_CRM.AsVariant      := qryAtestadoMedicoNum_CRM.Value;
         cdsAtestadoMedicofbMEDICO_CIDADE.AsVariant   := qryAtestadoMedicoCidade.Value;
         //cdsAtestadoMedicofbMEDICO_UF.AsVariant       := ; na bela anterior era cidade + uf
         cdsAtestadoMedicofbOBSERVACAO.AsVariant      := qryAtestadoMedicoObservacao.Value;
         try
            cdsAtestadoMedicofb.Post;
         except
            DispConteudoTab(cdsAtestadoMedicofb);
            Result := 1;
         end;
         if (Result = 0) and (pv_lSalvar) then
         begin
            Result := SalvaRegistro(cdsAtestadoMedicofb);
            if Result = 1 then
               DispConteudoTab(cdsAtestadoMedicofb);
         end;
         if Result = 1 then Break;
         iUltAtestao := cdsAtestadoMedicofbID.Value;
         qryAtestadoMedico.Next;
      end;
      if Result = 0 then
      begin
         memLog.Lines.Add(IntToStr(cdsAtestadoMedicofb.RecordCount)+' Registros migrados ...');
         {
         if (Result = 0) and (pv_lSalvar) then
            AtualizaGenerator('ATESTADO_MEDICO',iUltAtestao);
            }


{
      end;
      cdsAtestadoMedicofb.Close;
      qryAtestadoMedico.Close;

   end;

end;
}

Function TFrmPrincipal.MigraDependente: Integer;
Begin

   result := 0;

   with dmCadLanctos do
   begin

      cdsServDependentefb.Close;
      qryServDependentefb.Params[0].Value := cdsServidorFBID.Value;
      cdsServDependentefb.Open;

      if cdsServDependentefb.RecordCount > 0 then
        Exit;

      qryServDependente.Close;
      qryServDependente.Params[0].Value := qryServidorMATRICULA.Value;
      qryServDependente.Open;

      memLog.Lines.Add('Migrando os Dependentes ...');

      try

        while not qryServDependente.eof do
        begin
           if ((qryServDependenteNOMEDEP.IsNull) and (qryServDependenteNASCDEP.IsNull)) or
              ((Trim(qryServDependenteNOMEDEP.AsString)='') and (Trim(qryServDependenteNASCDEP.AsString)='')) then
           begin
              memLog.Lines.Add(qryServDependenteSECDEP.AsString+' não migrado (s/ Nome e s/ Data de Nascimento) ...');
              qryServDependente.Next;
              Continue;
           end;
           Inc(pv_iIdDepend);
           cdsServDependentefb.Append;
           cdsServDependentefbID.AsVariant             := pv_iIdDepend;
           cdsServDependentefbID_SERVIDOR.Value        := cdsServidorFBID.Value;
           if (qryServDependenteNOMEDEP.IsNull) or (Trim(qryServDependenteNOMEDEP.AsString)='') then
              cdsServDependentefbNOME.AsVariant        := 'SEM NOME'
           else
              cdsServDependentefbNOME.AsVariant        := qryServDependenteNOMEDEP.Value;
           if (qryServDependenteSEXO.IsNull) or (Trim(qryServDependenteSexo.AsString)='') then
              cdsServDependentefbSEXO.AsVariant        := 'M'
           else
              cdsServDependentefbSEXO.AsVariant        := iIf(qryServDependenteSEXO.Value='1','M','F');
           if (qryServDependentePARENT.IsNull) or (Trim(qryServDependentePARENT.AsString)='') then
              cdsServDependentefbPARENTESCO.AsVariant  := '5'
           else
           if qryServDependentePARENT.Value = 'F' then
              cdsServDependentefbPARENTESCO.AsVariant  := '1'
           else
              cdsServDependentefbPARENTESCO.AsVariant  := '5';
           if (qryServDependenteNASCDEP.IsNull) or (Trim(qryServDependenteNASCDEP.AsString)='') then
              cdsServDependentefbDT_NASCIMENTO.AsVariant := '01/01/1900'
           else
              cdsServDependentefbDT_NASCIMENTO.AsVariant := LeftStr(qryServDependenteNASCDEP.AsString,10);
           //cdsServDependentefbNATURAL_CIDADE.AsVariant := qryServDependenteLOCALNASC.Value;
           //cdsServDependentefbNATURAL_UF.AsVariant   := qryServDependenteLOCALNASCUF.Value;
           //cdsServDependentefbCARTORIO_NOME.AsVariant  := qryServDependenteNOMECARTORIO.Value;
           //cdsServDependentefbCARTORIO_CIDADE.AsVariant:= qryServDependenteCidade.Value;
           //cdsServDependentefbCARTORIO_UF.AsVariant  :=
           //cdsServDependentefbREGISTRO_NUM.AsVariant   := qryServDependenteNUMREGISTRO.Value;
           //cdsServDependentefbREGISTRO_LIVRO.AsVariant := qryServDependenteNUMLIVRO.Value;
           //cdsServDependentefbREGISTRO_FOLHA.AsVariant := qryServDependenteNUMFOLHA.Value;
           cdsServDependentefbATIVO_SAL_FAMILIA.AsVariant := 'S';
           cdsServDependentefbATIVO_IRRF.AsVariant := 'S';

           try
              cdsServDependentefb.Post;
           except
              DispConteudoTab(cdsServDependentefb);
              Result := 1;
           end;
           if (Result = 0) then
           begin
              Result := SalvaRegistro(cdsServDependentefb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsServDependentefb);
           end;
           if Result = 1 then Break;
           qryServDependente.Next;
        end;
      finally
        cdsServDependentefb.Close;
        qryServDependente.Close;
      end;

   end;

end;

Function TFrmPrincipal.MigraPagtoDiaria: Integer;
Var
   xQtdDias : Extended;
   crValUnit: Currency;
   sDtTemp: string[10];
   dDtTemp: TDate;
Begin

   result := 0;

   with dmCadLanctos do
   begin

      cdsPagtoDiariafb.Close;
      qryPagtoDiariafb.Params[0].Value := cdsServidorFBID.Value;
      cdsPagtoDiariafb.Open;

      if cdsPagtoDiariafb.RecordCount > 0 then
        Exit;

      qryPagtoDiaria.Close;
      qryPagtoDiaria.Params[0].Value := qryServidorMATRICULA.Value;
      qryPagtoDiaria.Open;

      memLog.Lines.Add('Migrando os Lançamentos de Pagtos de Diárias ...');

      try
        while not qryPagtoDiaria.eof do
        begin

           if (qryPagtoDiariaMatricula.IsNull) or (Trim(qryPagtoDiariaMatricula.AsString)='') then
           begin
              qryPagtoDiaria.Next;
              Continue;
           end;

           cdsPagtoDiariafb.Append;
           cdsPagtoDiariafbID.AsVariant             := ProxId('PAGTO_DIARIA');
           cdsPagtoDiariafbID_SERVIDOR.Value        := cdsServidorFBID.Value;
           cdsPagtoDiariafbPORTARIA_NUMERO.AsVariant:= qryPagtoDiariaNUMATO.Value;
           if qryPagtoDiariaDTATO.IsNull then
              cdsPagtoDiariafbPORTARIA_DATA.AsString := '01/01/1901'
           else
              try
                 cdsPagtoDiariafbPORTARIA_DATA.AsVariant  := qryPagtoDiariaDTATO.AsString;
              except
                 cdsPagtoDiariafbPORTARIA_DATA.AsString := '01/01/1901';
              end;

           if qryPagtoDiariaMOTIVO.AsString = EmptyStr then
              cdsPagtoDiariafbMOTIVO.AsString := 'NÃO INFORMADO'
           else
              cdsPagtoDiariafbMOTIVO.AsString := qryPagtoDiariaMOTIVO.AsString;

           if qryPagtoDiariaDESTINO.IsNull then
              cdsPagtoDiariafbDESTINO.AsString := 'NÃO INFORMADO'
           else
              cdsPagtoDiariafbDESTINO.AsString := qryPagtoDiariaDESTINO.AsString;

           if qryPagtoDiariaDTINICIO.IsNull then
              cdsPagtoDiariafbINI_PERIODO.AsString := '01/01/1901'
           else
              try
                 cdsPagtoDiariafbINI_PERIODO.AsVariant    := Trunc(qryPagtoDiariaDTINICIO.AsDateTime);
              except
                 cdsPagtoDiariafbINI_PERIODO.AsString := '01/01/1901';
              end;
           if qryPagtoDiariaDTFIM.IsNull then
              cdsPagtoDiariafbFIM_PERIODO.AsString := '01/01/1901'
           else
              try
                 cdsPagtoDiariafbFIM_PERIODO.AsVariant := Trunc(qryPagtoDiariaDTFIM.AsDateTime);
              except
                 cdsPagtoDiariafbFIM_PERIODO.AsString := '01/01/1901';
              end;
           try
              xQtdDias := ((cdsPagtoDiariafbFIM_PERIODO.Value - cdsPagtoDiariafbINI_PERIODO.Value)+1);
           except
              xQtdDias := 1;
           end;
           try
              crValUnit := qryPagtoDiariaVALOR.AsCurrency / xQtdDias;
           except
              crValUnit := 0;
           end;

           cdsPagtoDiariafbVALOR_UNITARIO.AsVariant := crValUnit;
           try
              cdsPagtoDiariafbDATA_PAGTO.AsVariant := Trunc(qryPagtoDiariaDTATO.AsDateTime);
           except
              cdsPagtoDiariafbDATA_PAGTO.Value     := cdsPagtoDiariafbPORTARIA_DATA.Value
           end;
            cdsPagtoDiariafbANO_MES.AsVariant        :=
              ExtraiAnoMesData(cdsPagtoDiariafbDATA_PAGTO.AsString);
           try
              cdsPagtoDiariafb.Post;
           except
              DispConteudoTab(cdsPagtoDiariafb);
              Result := 1;
           end;
           if (Result = 0) and (pv_lSalvar) then
           begin
              Result := SalvaRegistro(cdsPagtoDiariafb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsPagtoDiariafb);
           end;
           if Result = 1 then Break;
           qryPagtoDiaria.Next;
        end;
      finally
        if Result = 0 then
        begin
           memLog.Lines.Add(IntToStr(cdsPagtoDiariafb.RecordCount)+' Registros migrados ...');
        end;
        cdsPagtoDiariafb.Close;
        qryPagtoDiaria.Close;
      end;

   end;

end;

{
Function TfrmPrincipal.MigraPagtoPrestServico: Integer;
Var
   sIdUnidOrcam: String[5];
   iUltIdPagto: Integer;
Begin
   result := 0;

   with dmCadLanctos do
   begin

      cdsPagtoPrestServicofb.Close;
      qryPagtoPrestServicofb.Params[0].Value := cdsPrestServicofbID.Value;
      cdsPagtoPrestServicofb.Open;

      qryPagtoPrestServico.Close;
      qryPagtoPrestServico.Params[0].Value := qryPrestServicoMatricula.Value;
      qryPagtoPrestServico.Open;

      while not qryPagtoPrestServico.eof do
      begin

         if (
             (qryPagtoPrestServicoAnoMes.IsNull) or
             (Empty(qryPagtoPrestServicoAnoMes.Value))
            ) or
            (
             (qryPagtoPrestServicoDataPagto.IsNull) or
             (EmptyData(qryPagtoPrestServicoDataPagto.AsString))
            ) or
            (
             (qryPagtoPrestServicoMatricula.IsNull) or
             (Empty(qryPagtoPrestServicoMatricula.Value))
            ) then
         begin
            qryPagtoPrestServico.Next;
            Continue;
         end;

         Inc(pv_iUltIdPagPrestServ);
         cdsPagtoPrestServicofb.Append;
         if pv_lSalvar then
            cdsPagtoPrestServicofbID.AsVariant                := ProxId('PAGTO_PREST_SERVICO')
         else
            cdsPagtoPrestServicofbID.AsVariant                := pv_iUltIdPagPrestServ;
         cdsPagtoPrestServicoFBID_PREST_SERVICO.Value         := cdsPrestServicofbID.Value;
         cdsPagtoPrestServicoFBANO_MES.AsVariant              := qryPagtoPrestServicoAnoMes.Value;
         cdsPagtoPrestServicoFBID_ORDEM.AsVariant             := qryPagtoPrestServicoOrdem.AsString;
         cdsPagtoPrestServicoFBDATA_PAGTO.AsVariant           := qryPagtoPrestServicoDataPagto.Value;
         sIdUnidOrcam := Pesquisa('UNID_ORCAMENT','COD_CONTABIL',qryPagtoPrestServicoCodUnidOrcament.Value,'ID','');
         if sIdUnidOrcam = '' then
            cdsPagtoPrestServicoFBID_UNID_ORCAMENT.AsVariant  := 1
         else
            cdsPagtoPrestServicoFBID_UNID_ORCAMENT.AsVariant  := sIdUnidOrcam;
         cdsPagtoPrestServicoFBVALOR_BRUTO.AsVariant          := qryPagtoPrestServicoValorBruto.Value;
         cdsPagtoPrestServicoFBALIQUOTA_ISS.AsVariant         := qryPagtoPrestServicoAliquotaISS.Value;
         cdsPagtoPrestServicoFBVALOR_ISS.AsVariant            := qryPagtoPrestServicoValorISS.Value;
         cdsPagtoPrestServicoFBDEDUZ_ISS_B_CALC_IRRF.AsVariant:= qryPagtoPrestServicoDeduzISS.Value;
         cdsPagtoPrestServicoFBBASE_CALC_PREVID.AsVariant     := qryPagtoPrestServicoBaseCalcIRRF.Value;
         cdsPagtoPrestServicoFBVALOR_PREVID.AsVariant         := qryPagtoPrestServicoValorINSS.Value;
         cdsPagtoPrestServicoFBBASE_CALC_IRRF.AsVariant       := qryPagtoPrestServicoBaseCalcIRRF.Value;
         if (qryPagtoPrestServicoNumDependIRRF.IsNull) or
            (Trim(qryPagtoPrestServicoNumDependIRRF.Value)='') then
            cdsPagtoPrestServicoFBQTD_DEPEND_IRRF.AsVariant   := 0
         else
            cdsPagtoPrestServicoFBQTD_DEPEND_IRRF.AsVariant   := qryPagtoPrestServicoNumDependIRRF.Value;
         cdsPagtoPrestServicoFBVALOR_IRRF.AsVariant           := qryPagtoPrestServicoValIRRF.Value;
         cdsPagtoPrestServicoFBVALOR_LIQUIDO.AsVariant        := qryPagtoPrestServicoValorLiquido.Value;
         cdsPagtoPrestServicoFBVALOR_MAO_OBRA.AsVariant       := 0;
         cdsPagtoPrestServicoFBHISTORICO.AsVariant            := qryPagtoPrestServicoHistorico.Value;
         if (qryPagtoPrestServicoReciboIndividual.IsNull) or
            (trim(qryPagtoPrestServicoReciboIndividual.Value)='') then
            cdsPagtoPrestServicoFBRECIBO_INDIVIDUAL.AsVariant    := 'S'
         else
            cdsPagtoPrestServicoFBRECIBO_INDIVIDUAL.AsVariant    := qryPagtoPrestServicoReciboIndividual.Value;
         try
            cdsPagtoPrestServicofb.Post;
         except
            DispConteudoTab(cdsPagtoPrestServicoFB);
            Result := 1;
         end;
         if (Result = 0) and (pv_lSalvar) then
         begin
            Result := SalvaRegistro(dmCadLanctos.cdsPagtoPrestServicofb);
            if Result = 1 then
               DispConteudoTab(dmCadLanctos.cdsPagtoPrestServicofb);
         end;
         if Result = 1 then Break;

         iUltIdPagto := cdsPagtoPrestServicoFBID.Value;
         qryPagtoPrestServico.Next;

      end;

      cdsPagtoPrestServicofb.Close;
      qryPagtoPrestServico.Close;

{
      if (Result = 0) and (pv_lSalvar) then
         AtualizaGenerator('PAGTO_PREST_SERVICO',iUltIdPagto);
         }

//   end;

//end;


function TFrmPrincipal.MigraHistFerias: Integer;
begin

   Result := 0;

   with dmCadLanctos do
   begin

      cdsHistFeriasfb.Close;
      cdsHistFeriasfb.Params[0].AsInteger := cdsServidorFBID.AsInteger;
      cdsHistFeriasfb.Open;

      if cdsHistFeriasfb.RecordCount > 0 then
        Exit;

      qryHistFerias.Close;
      qryHistFerias.Params[0].AsString := qryServidorMatricula.AsString;
      qryHistFerias.Open;

      memLog.Lines.Add('Migrando os Lançamentos do Histórico de Férias ...');

      try

        while not qryHistFerias.eof do
        begin

           if qryHistFeriasGOZO1.IsNull then  // Desconsiderar see o gozo inicial das férias for nulo
           begin
             qryHistFerias.Next;
             Continue;
           end;

           cdsHistFeriasfb.Append;

           cdsHistFeriasfbID.AsVariant := ProxId('HIST_FERIAS');

           cdsHistFeriasfbID_SERVIDOR.Value   := cdsServidorFBID.Value;
           cdsHistFeriasfbINI_PERIODO_AQUISIT.AsVariant := LeftStr(qryHistFeriasAQUIS1.AsString,10);
           cdsHistFeriasfbFIM_PERIODO_AQUISIT.AsVariant := LeftStr(qryHistFeriasAQUIS2.AsString,10);

           cdsHistFeriasfbINI_PERIODO_GOZO.AsDateTime := Trunc(qryHistFeriasGOZO1.AsDateTime);

           if qryHistFeriasGOZO2.IsNull then
             cdsHistFeriasfbFIM_PERIODO_GOZO.AsDateTime := DateUtils.EndOfTheMonth(cdsHistFeriasfbINI_PERIODO_GOZO.AsDateTime)
           else
             cdsHistFeriasfbFIM_PERIODO_GOZO.AsDateTime := Trunc(qryHistFeriasGOZO2.AsDateTime);

           //if (not qryHistFeriasANOFERIAS.IsNull) and (not qryHistFeriasMESFERIAS.IsNull) then
           //   cdsHistFeriasfbANO_MES_PAGTO.AsVariant  := qryHistFeriasANOFERIAS.Value+qryHistFeriasMESFERIAS.Value;

           {if (not qryHistFeriasNUMDOC.IsNull) and (qryHistFeriasNUMDOC.Value<>'') then
              cdsHistFeriasfbNUM_PORTARIA.AsVariant   := qryHistFeriasNUMDOC.Value;
           if (not qryHistFeriasDATADOC.IsNull) and (qryHistFeriasDATADOC.AsString<>'') then
              cdsHistFeriasfbDT_PORTARIA.AsVariant    := qryHistFeriasDATADOC.Value;}

           try
              cdsHistFeriasfb.Post;
           except
              DispConteudoTab(cdsHistFeriasfb);
              Result := 1;
           end;

           if (Result = 0) then
           begin
              Result := SalvaRegistro(cdsHistFeriasfb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsHistFeriasfb);
           end;

           if Result = 1 then
           begin
              memLog.Lines.Add('Erro na tabela de Histórico de Férias (Lançto '+
                 qryHistFeriasANOFERIAS.AsString+'/'+qryHistFeriasMESFERIAS.AsString+')');
              Break;
           end;

           qryHistFerias.Next;

        end;

      finally
        cdsHistFeriasfb.Close;
        qryHistFerias.Close;
      end;

   end;

end;

{
Function TfrmPrincipal.MigraEscalaFerias: Integer;
Begin
   result := 0;

   with dmCadLanctos do
   begin

      cdsEscalaFeriasfb.Close;
      qryEscalaFeriasfb.Params[0].Value := cdsServidorFBID.Value;
      cdsEscalaFeriasfb.Open;

      qryEscalaFerias.Close;
      qryEscalaFerias.Params[0].Value := qryServidorMatricula.Value;
      qryEscalaFerias.Open;

      memLog.Lines.Add('Migrando os Lançamentos da Escala de Férias ...');

      try
        while not qryEscalaFerias.eof do
        begin
           if (qryEscalaFeriasAno.IsNull) or (Trim(qryEscalaFeriasAno.Value)='') then
           begin
              qryEscalaFerias.Next;
              Continue;
           end;
           cdsEscalaFeriasfb.Append;
           cdsEscalaFeriasfbANO.AsVariant                := qryEscalaFeriasAno.Value;
           cdsEscalaFeriasfbID_SERVIDOR.Value            := cdsServidorFBID.Value;
           cdsEscalaFeriasfbID_SUB_UNID_ORCAMENT.Value   := cdsServidorFBID_SUB_UNID_ORCAMENT.Value;
           cdsEscalaFeriasfbINI_PERIODO_AQUISIT.AsVariant:= qryEscalaFeriasIniPerAquisitivo.Value;
           cdsEscalaFeriasfbFIM_PERIODO_AQUISIT.AsVariant:= qryEscalaFeriasFimPerAquisitivo.AsString;
           cdsEscalaFeriasfbINI_PERIODO_GOZO.AsVariant   := qryEscalaFeriasIniPerGozo.Value;
           cdsEscalaFeriasfbFIM_PERIODO_GOZO.AsVariant   := qryEscalaFeriasFimPerGozo.Value;
           try
              cdsEscalaFeriasfb.Post;
           except
              DispConteudoTab(cdsEscalaFeriasfb);
              Result := 1;
           end;
           if (Result = 0) and (pv_lSalvar) then
           begin
              Result := SalvaRegistro(dmCadLanctos.cdsEscalaFeriasfb);
              if Result = 1 then
                 DispConteudoTab(dmCadLanctos.cdsEscalaFeriasfb);
           end;
           if Result = 1 then Break;
           qryEscalaFerias.Next;
        end;
      finally
        if Result = 0 then
           memLog.Lines.Add(IntToStr(cdsEscalaFeriasfb.RecordCount)+' Registros migrados ...');
        cdsEscalaFeriasfb.Close;
        qryEscalaFerias.Close;
      end;

   end;

end;
}

{
Procedure TfrmPrincipal.MigraConfigDepositoBancario;
Var
   iErro: Integer;
   sIdEntidFinanc: String[3];
Begin

   Panel1.Caption := ' Migrando a Tabela de Configuração dos Depósitos Bancários ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;
   iErro := 0;

   with dmTabDiversas do
   begin

      dmPrincipal.DataSource1.DataSet := cdsConfigDepBancariofb;

      cdsConfigDepBancariofb.Close;
      cdsConfigDepBancariofb.Open;
      qryConfigDepBancario.Close;
      qryConfigDepBancario.Open;

      while not qryConfigDepBancario.eof do
      begin
         cdsConfigDepBancariofb.Append;
         cdsConfigDepBancariofbANO_MES.AsVariant            := NovoAnoMes(qryConfigDepBancarioAnoMes.Value);
         cdsConfigDepBancariofbPARCELA.AsVariant            := '0';
         sIdEntidFinanc := Pesquisa('ENTID_FINANC','COD_BANCO',qryConfigDepBancarioCodBanco.Value,'ID','');
         if sIdEntidFinanc = '' then
            cdsConfigDepBancariofbID_ENTID_FINANC.AsVariant := 1
         else
            cdsConfigDepBancariofbID_ENTID_FINANC.AsVariant := sIdEntidFinanc;
         cdsConfigDepBancariofbID_REMESSA.Value := '000000001';
         cdsConfigDepBancariofbID_SUB_UNID_ORCAMENT.AsVariant:= qryConfigDepBancarioCodCCusto.AsInteger+
           StrToInt(edAddIdSubUnidOrcam.Text);
         cdsConfigDepBancariofbDT_GERACAO_REMESSA.AsVariant := qryConfigDepBancarioDtProcessamento.Value;
         cdsConfigDepBancariofbDT_EFETIVACAO_PAGTO.AsVariant:= qryConfigDepBancarioDtProcessamento.Value;
         try
            cdsConfigDepBancariofb.Post;
         except
            DispConteudoTab(cdsConfigDepBancariofb);
            iErro := 1;
         end;
         if (iErro = 0) and (pv_lSalvar) then
         begin
            iErro := SalvaRegistro(dmTabDiversas.cdsConfigDepBancariofb);
            if iErro = 1 then
               DispConteudoTab(dmTabDiversas.cdsConfigDepBancariofb);
         end;
         if iErro = 1 then Break;
         qryConfigDepBancario.Next;
      end;

      if iErro = 0 then
      begin
         Panel1.Caption :=  ' Processo concluído ... -> '+
                           IntToStr(cdsConfigDepBancariofb.RecordCount)+' registros migrados ...';
         memLog.Lines.Add(Panel1.Caption);
         Application.ProcessMessages;
      end;

      frmDispTabMigrada.Executa('DatasDepositos','CONFIG_DEPOSITO_BANCARIO');

      cdsConfigDepBancariofb.Open;
      qryConfigDepBancario.Close;

   end;

end;
}

function TFrmPrincipal.CalcDigito(sCodigo: String): String;
var
   iTotNum: Integer;
begin
   Try
     iTotNum  := (StrToInt(sCodigo[6]) * 3) +
                 (StrToInt(sCodigo[5]) * 4) +
                 (StrToInt(sCodigo[4]) * 5) +
                 (StrToInt(sCodigo[3]) * 6) +
                 (StrToInt(sCodigo[2]) * 7) +
                 (StrToInt(sCodigo[1]) * 8);
     Result  := IntToStr(iTotNum Mod 10);
   Except
     Result   := '0';
   End;
end;

function TFrmPrincipal.Iif(bExpressao: Boolean; sRet1, sRet2: String): String;
begin
  Result := IfThen(bExpressao, sRet1, sRet2);
end;

function TFrmPrincipal.SalvaRegistro(CDS: TClientDataSet): Integer;
var
  i: integer;
begin

   Result := 0;

   try
      if CDS.ApplyUpdates(0) > 0 then
      begin
         memLog.Lines.Add('Erro na Tabela '+CDS.Name);
         for i := 0 to CDS.FieldCount-1 do
            memLog.Lines.Add(CDS.Fields[i].FieldName+': '+CDS.Fields[i].AsString);
         CDS.CancelUpdates;
         Result := 1;
      end;
   except
      on E: Exception do
        Mensagem('Erro ao Gravar ...'+#13+'('+E.Message+')', 'E R R O !!!');
   end;

end;

procedure TFrmPrincipal.CancelaRegistro(oCDS1: TClientDataSet);
begin
   if oCDS1.State in [dsInsert,dsEdit] then
   begin
      oCDS1.Cancel;
      try
         oCDS1.CancelUpdates;
      except
      end;
   end;
end;

Function TFrmPrincipal.AtribuiField(oCDS1: TClientDataSet; oQRY1: TQuery; sField1,sField2: String): Integer;
begin
   Result := 0;
   try
      oCDS1.FieldByName(sField1).AsVariant := oQRY1.FieldByName(sField2).Value;
   except
      Result := 1;
   end;
end;

procedure TFrmPrincipal.cdsEventoAltAfterEdit(DataSet: TDataSet);
begin
   pv_lSalvaEventoAlt := True;
end;

procedure TFrmPrincipal.cdsEventoAltAfterInsert(DataSet: TDataSet);
begin
   pv_lSalvaEventoAlt := True;
end;

procedure TFrmPrincipal.cdsEventoAltAfterPost(DataSet: TDataSet);
begin
   pv_lSalvaEventoAlt := True;
end;

procedure TFrmPrincipal.cdsPessoaFisicaFBBeforeClose(DataSet: TDataSet);
begin
  //if DataSet.State in [dsInsert,dsEdit] Then CancelaRegistro(TClientDataSet(DataSet.Name));
end;

procedure TFrmPrincipal.chkEventoFixoClick(Sender: TObject);
begin
  dbgEvento.Visible := chkEventoFixo.Checked;
  if dbgEvento.Visible then
    AtualizaEventoFolha();
end;

function TFrmPrincipal.ProxId(sNomeTab: String): integer;
Var
  oQry1: TSQLQuery;
begin

  oQry1:= TSQLQuery.Create(Self);
  oQry1.SQLConnection := dmPrincipal.connectionGERA;
  oQry1.SQL.Clear;
  oQry1.SQL.Add('select max(id) from '+sNomeTab);

  try
     try
        oQry1.Open;
        Result := oQry1.Fields[0].AsInteger+1;
     except
        Result := 1;
     end;
  finally
     oQry1.Close;
     FreeAndNil(oQry1);
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Panel1.Caption := '';
  memLog.Lines.Clear;
  FListaBancoDados := TStringList.Create;
  FListaMesTabela  := TStringList.Create;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListaBancoDados.Free;
  FListaMesTabela.Free;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (ActiveControl = dbgEvento) and
     ((Key = VK_SPACE) or CharInSet(Chr(Key), ['X','x'])) and (not cdsEventoFolha.IsEmpty) then

  begin

    Key := 0;
    cdsEventoFolha.Edit;

    if cdsEventoFolha.FieldByName('X').AsString = '' then
      cdsEventoFolha.FieldByName('X').AsString := 'X'
    else
      cdsEventoFolha.FieldByName('X').AsString := '';

    cdsEventoFolha.Post;

  end;

  inherited;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   {
   qrySituacao.Close;
   qryUnidOrcament.Close;
   qryCCustos.Close;
   qrySetor.Close;
   qryProgSalarial.Close;
   qryCargo.Close;
   qryCategFuncional.Close;
   qryServidor.Close;
   qryEvento.Close;
   }
   {
   cdsEventoFB.Close;
   cdsServidorFB.Close;
   cdsPessoaFisicaFB.Close;
   cdsUnidOrcamentFB.Close;
   cdsSubUnidOrcamentFB.Close;
   cdsSetorFB.Close;
   cdsCargoFB.Close;
   cdsCategFuncFB.Close;
   cdsFatorProgresSalFB.Close;
   cdsCBO_FB.Close;
   }

   if dmPrincipal.connectionGERA.Connected then
     dmPrincipal.connectionGERA.Close();

   if dmPrincipal.connectionLayOut.Connected then
     dmPrincipal.connectionLayOut.Close();

end;

function TFrmPrincipal.Pesquisa(Tabela, CampoPesq, TextPesq, CampoRet: string): string;
var
   qry: TSQLQuery;
begin

   qry := TSQLQuery.Create(NIL);
   qry.SQLConnection := dmPrincipal.connectionGERA;
   qry.SQL.Text := 'SELECT '+CampoRet+' FROM '+Tabela+' WHERE '+CampoPesq+' = :1';

   qry.Params[0].Value := TextPesq;

   try
     qry.Open;
     if qry.IsEmpty then
       Result := EmptyStr
     else
       Result := qry.Fields[0].AsString;
   finally
     qry.Close;
     qry.Free;
   end;

end;

Function TFrmPrincipal.PesquisaPdox(sTabela, sCampoPesq, sTextPesq, sCampoRet: String): String;
Var
   tDataSet: TQuery;
Begin
   tDataSet := TQuery.Create(Nil);
   tDataSet.DatabaseName := 'Folha_de_pagamento';
   tDataSet.SQL.Clear;
   tDataSet.SQL.Add('SELECT '+sCampoRet+' FROM '+sTabela+
                          ' WHERE '+sCampoPesq+' = :Param1');
   tDataSet.Params[0].Value := sTextPesq;
   Try
     tDataSet.Open;
     Try
        Result := tDataSet.FieldByName(sCampoRet).AsString;
     Except
     End;
   Finally
     tDataSet.Close;
     tDataSet.Free;
   End;
End;

procedure TFrmPrincipal.AtualizaGenerator(sNomeTab: String; iUltId: Integer);
var
   sNomeGen, sIdTemp: string;
begin
   sNomeGen := 'GEN_ID_'+sNomeTab;
   if sNomeTab = 'HIST_TRANSF_SUB_UND_ORC' then
      sNomeTab := 'HIST_TRANSF_SUB_UND_ORCAM';
   qryUltID.Close;
   qryUltID.SQL.Clear;
   qryUltID.SQL.Add('SELECT max(ID) as UltID FROM '+sNomeTab);
   try
      qryUltID.Open;
      if qryUltID.Fields[0].IsNull then
         iUltId := 0
      else begin
         if (sNomeTab = 'SERVIDOR') or (sNomeTab = 'PRESTADOR_SERVICO') then
         begin
            sIdTemp := IntToStr(qryUltID.Fields[0].AsInteger+1000000);
            sIdTemp := Copy(sIdTemp,2,5);
            iUltId  := StrToInt(sIdTemp);
         end else
            iUltId := qryUltID.Fields[0].Value;
      end;
   except
      iUltId := 0;
   end;

   spAutlizaGen.Close;
   spAutlizaGen.ParamByName('pe_nome_gen').Value:= sNomeGen;
   spAutlizaGen.ParamByName('pe_id').Value      := iUltId;
   try
      try
        spAutlizaGen.ExecProc;
      except
        Application.MessageBox(PChar('Gererator '+sNomeTab+' ...'),PChar('E r r o !!!'),mb_Ok);
      end;
   finally
      spAutlizaGen.Close;
   end;
end;

function TFrmPrincipal.ValidaCodTab(sCod,sNomeTab,sCampoCod: String): Boolean;
begin
  if (sCod = Null) or (Trim(sCod) = '') then
     Result := False
  else if PesquisaPdox(sNomeTab,sCampoCod,sCod,sCampoCod) <> '' then
     Result := True
  else
     Result := False;
end;

procedure TFrmPrincipal.DispConteudoTab(oCds1: TClientDataSet);
var
  i: Integer;
begin
  memLog.Lines.add('Erro na Tabela: '+oCds1.Name);
  for i := 0 to oCds1.FieldCount - 1 do
     if not oCds1.Fields[i].IsBlob then
        memLog.Lines.add(oCds1.Fields[i].DisplayLabel+' - '+oCds1.Fields[i].AsString);
end;

procedure TFrmPrincipal.edPesqEventoChange(Sender: TObject);
begin
   cdsEventoAlt.FindNearest([edPesqEvento.Text]);
end;

procedure TFrmPrincipal.edPesqEventoKeyPress(Sender: TObject; var Key: Char);
begin

end;

{
procedure TfrmPrincipal.btnVerEventosInexistClick(Sender: TObject);
begin

   Screen.Cursor := crHourGlass;

   memLog.Lines.Clear;
   Application.ProcessMessages;
   memLog.Lines.Add('Verificação de Eventos Inexistentes ...');
   memLog.Lines.Add('');
   Gauge1.Progress := 0;

   tbEventoCalc.Open;
   tbBCalcMes.Open;
   tbBCalcMes2.Open;

   Gauge1.MaxValue := tbEventoCalc.RecordCount;

   tbEvento.Open;
   while not tbEventoCalc.eof do
   begin
      if not tbEvento.FindKey([tbEventoCalcCodVencDesc.Value]) then
      begin
         memLog.Lines.Add('Servidor: '+tbEventoCalcMatricula.Value+' - '+
                          'Ano/Mes: '+tbEventoCalcAnoMes.Value+' - '+
                          'Evento: '+tbEventoCalcCodVencDesc.Value+' - '+
                          'Valor: '+tbEventoCalcValor.AsString);
      end;
      if not tbBCalcMes.FindKey([tbEventoCalcAnoMes.Value,tbEventoCalcMatricula.Value]) then
      begin
         if tbBCalcMes2.FindKey([tbEventoCalcAnoMes.Value,
               tbEventoCalcMatricula.Value]) then
         begin
            tbBCalcMes.Insert;
            tbBCalcMesAnoMes.Value        := tbBCalcMes2AnoMes.Value;
            tbBCalcMesMatricula.Value     := tbBCalcMes2Matricula.Value;
            tbBCalcMesCodCCusto.Value     := tbBCalcMes2CodCCusto.Value;
            tbBCalcMesCodCargo.Value      := tbBCalcMes2CodCargo.Value;
            tbBCalcMesCodDepto.Value      := tbBCalcMes2CodDepto.Value;
            tbBCalcMesSituacao.Value      := tbBCalcMes2Situacao.Value;
            tbBCalcMesCodSituacao.Value   := tbBCalcMes2CodSituacao.Value;
            tbBCalcMesCodSituacaoTCM.Value:= tbBCalcMes2CodSituacaoTCM.Value;
            tbBCalcMesCalcINSS.Value      := tbBCalcMes2CalcINSS.Value;
            tbBCalcMesTempoServico.Value  := tbBCalcMes2TempoServico.Value;
            tbBCalcMesNumDep_SF.Value     := tbBCalcMes2NumDep_SF.Value;
            tbBCalcMesNumDep_IR.Value     := tbBCalcMes2NumDep_IR.Value;
            tbBCalcMesSalBase.Value       := tbBCalcMes2SalBase.Value;
            tbBCalcMesTipoSalario.Value   := tbBCalcMes2TipoSalario.Value;
            tbBCalcMesBCQuinquenio.Value  := tbBCalcMes2BCQuinquenio.Value;
            tbBCalcMesBCFerias.Value      := tbBCalcMes2BCFerias.Value;
            tbBCalcMesBCDecTerceiro.Value := tbBCalcMes2BCDecTerceiro.Value;
            tbBCalcMesBCFaltas.Value      := tbBCalcMes2BCFaltas.Value;
            tbBCalcMesBCPrevidencia.Value := tbBCalcMes2BCPrevidencia.Value;
            tbBCalcMesBCImpRenda.Value    := tbBCalcMes2BCImpRenda.Value;
            tbBCalcMesTotVencimentos.Value:= tbBCalcMes2TotVencimentos.Value;
            tbBCalcMesTotDescontos.Value  := tbBCalcMes2TotDescontos.Value;
            tbBCalcMesSalLiquido.Value    := tbBCalcMes2SalLiquido.Value;
            tbBCalcMesSemVenctoBase.Value := tbBCalcMes2SemVenctoBase.Value;
            tbBCalcMes.Post;
         end else
            memLog.Lines.Add('Servidor: '+tbEventoCalcMatricula.Value+' - '+
                             'Ano/Mes: '+tbEventoCalcAnoMes.Value);
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      tbEventoCalc.Next;
   end;

   tbBCalcMes.Close;
   tbBCalcMes2.Close;
   tbEventoCalc.Close;
   tbEvento.Close;

   memLog.Lines.Add('');
   memLog.Lines.Add('Fim da Verificação ...');
   memLog.Lines.Add('');
   Gauge1.Progress := 0;

   memLog.SetFocus;

   Screen.Cursor := crDefault;

end;
}

{
procedure TfrmPrincipal.MigraConfigOrgaoSys;
begin

   Screen.Cursor := crHourGlass;
   dmPrincipal.DataSource1.DataSet := cdsConfigOrgaoFb;
   Panel1.Caption:= ' Migrando a Tabela de Configurações do Órgão ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   qryEmpresa.Close;
   qryEmpresa.Open;
   cdsConfigOrgaoFb.Close;
   cdsConfigOrgaoFb.Open;
   cdsConfigOrgaoFb.Edit;
   cdsConfigOrgaoFbRAZAO_SOCIAL.Value         := qryEmpresaNomeEmpresa.Value;
   cdsConfigOrgaoFbSIGLA.Value                := qryEmpresaSigla.Value;
   cdsConfigOrgaoFbCNPJ.Value                 := qryEmpresaCGC.Value;
   cdsConfigOrgaoFbTIPO_ORGAO.Value           := qryEmpresaTipoDeOrgao.AsInteger;
   cdsConfigOrgaoFbENDER_LOGRAD.Value         := qryEmpresaEndereco.Value;
   cdsConfigOrgaoFbENDER_NUM.Value            := qryEmpresaNumeroNoLogradouro.Value;
   cdsConfigOrgaoFbENDER_BAIRRO.Value         := qryEmpresaBairro.Value;
   cdsConfigOrgaoFbENDER_CIDADE.Value         := qryEmpresaCidade.Value;
   cdsConfigOrgaoFbENDER_CEP.Value            := qryEmpresaCEP.Value;
   cdsConfigOrgaoFbENDER_UF.Value             := qryEmpresaEstado.Value;
   cdsConfigOrgaoFbTELEFONE.Value             := qryEmpresaTelefone.Value;
   cdsConfigOrgaoFbNOME_DIR_DRH.Value         := qryEmpresaContato.Value;
   cdsConfigOrgaoFbCOD_CNAE.Value             := qryEmpresaCodCNAE.AsInteger;
   cdsConfigOrgaoFbCOD_FPAS.Value             := qryEmpresaCodFPAS.AsInteger;
   cdsConfigOrgaoFbCOD_NATUREZA_JURIDICA.Value:= qryEmpresaCodNaturezaJuridica.AsInteger;
   cdsConfigOrgaoFbCOD_MUNICIPIO_RAIS.Value   := qryEmpresaCodMunicipioRAIS.AsInteger;
   cdsConfigOrgaoFbCOD_MUNICIPIO_TCM.Value    := qryEmpresaCodMunicipio.AsInteger;
   cdsConfigOrgaoFbBRASAO.Value               := qryEmpresaBrasao.Value;
   cdsConfigOrgaoFb.Post;
   SalvaRegistro(cdsConfigOrgaoFb);

   Panel1.Caption := 'Processo concluído ... ';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;
   Screen.Cursor := crDefault;

   frmDispTabMigrada.Executa('Outros','CONFIG_ORGAO');

   Screen.Cursor := crHourGlass;
   dmPrincipal.DataSource1.DataSet := cdsConfigSysFb;
   Panel1.Caption:= ' Migrando a Tabela de Configurações do Órgão ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   cdsConfigSysFb.Close;
   cdsConfigSysFb.Open;
   cdsConfigSysFb.Edit;
   if Trim(qryEmpresaCodSalarioFamilia.Value) <> '' then
      cdsConfigSysFbID_EV_SAL_FAMILIA.Value       := qryEmpresaCodSalarioFamilia.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodDescPrevidencia.Value) <> '' then
      cdsConfigSysFbID_EV_PREVID_INSS.Value       := qryEmpresaCodDescPrevidencia.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodDescIPM.Value) <> '' then
      cdsConfigSysFbID_EV_PREVID_IPM.Value        := qryEmpresaCodDescIPM.AsInteger+
        StrToInt(edAddIdEvento.Text);
   //cdsConfigSysFbID_EV_PREVID_ESTADUAL.Value   :=
   if Trim(qryEmpresaCodDescIRRF.Value) <> '' then
      cdsConfigSysFbID_EV_IRRF.Value              := qryEmpresaCodDescIRRF.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodDescFaltas.Value) <> '' then
      cdsConfigSysFbID_EV_FALTA_DIA.Value         := qryEmpresaCodDescFaltas.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodDescFaltasHA.Value) <> '' then
      cdsConfigSysFbID_EV_FALTA_HORA.Value        := qryEmpresaCodDescFaltasHA.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodTercFerias.Value) <> '' then
      cdsConfigSysFbID_EV_TERCO_FERIAS.Value      := qryEmpresaCodTercFerias.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodAdiantamentoFerias.Value) <> '' then
      cdsConfigSysFbID_EV_ADIANT_FERIAS.Value     := qryEmpresaCodAdiantamentoFerias.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodAbonoPecunFerias.Value) <> '' then
      cdsConfigSysFbID_EV_ABONO_PECUN_FERIAS.Value:= qryEmpresaCodAbonoPecunFerias.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodTercFeriasProporc.Value) <> '' then
      cdsConfigSysFbID_EV_TERCO_FERIAS_PROP.Value := qryEmpresaCodTercFeriasProporc.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodFeriasProporcional.Value) <> '' then
      cdsConfigSysFbID_EV_FERIAS_PROP.Value       := qryEmpresaCodFeriasProporcional.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCod13SalProporc.Value) <> '' then
      cdsConfigSysFbID_EV_DEC_TERC_PROP.Value     := qryEmpresaCod13SalProporc.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodPensaoAlimenticia.Value) <> '' then
      cdsConfigSysFbID_EV_PENSAO_ALIMENTICIA.Value:= qryEmpresaCodPensaoAlimenticia.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodHoraSuplementar.Value) <> '' then
      cdsConfigSysFbID_EV_H_AULA_SUPLEM.Value     := qryEmpresaCodHoraSuplementar.AsInteger+
        StrToInt(edAddIdEvento.Text);
   if Trim(qryEmpresaCodHASubstituicao.Value) <> '' then
      cdsConfigSysFbID_EV_H_AULA_SUBSTIT.Value    := qryEmpresaCodHASubstituicao.AsInteger+
        StrToInt(edAddIdEvento.Text);
   //cdsConfigSysFbID_EV_OUTRA_H_AULA.Value      := ;
   if Trim(qryEmpresaCodigoATS.Value) <> '' then
      cdsConfigSysFbID_EV_ATS.Value               := qryEmpresaCodigoATS.AsInteger+
        StrToInt(edAddIdEvento.Text);
   cdsConfigSysFbQTD_ANO_ATS.Value             := qryEmpresaTempoATS.AsInteger;
   cdsConfigSysFbPERCENT_ATS.AsCurrency        := qryEmpresaPercentualATS.AsCurrency;
   if Trim(qryEmpresaCodSituacFeriasPagAdiant.Value) <> '' then
      cdsConfigSysFbID_EF_FERIAS_PAG_ADIANT.Value := qryEmpresaCodSituacFeriasPagAdiant.AsInteger+
        StrToInt(edAddIdEstFunc.Text);
   //cdsConfigSysFbLIMITE_HORAS_PROF.Value       := ;
   cdsConfigSysFb.Post;
   SalvaRegistro(cdsConfigSysFb);

   Panel1.Caption := 'Processo concluído ... ';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;
   Screen.Cursor := crDefault;

   frmDispTabMigrada.Executa('Outros','CONFIG_SISTEMA');

end;
}

{
procedure TfrmPrincipal.MigraControlProcess;
begin

   Screen.Cursor := crHourGlass;
   dmPrincipal.DataSource1.DataSet := cdsControlProcesGeralFb;
   Panel1.Caption:= ' Migrando a Tabela de Controle de Processamentos ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   qryControlProces1.Close;
   qryControlProces1.Open;
   cdsControlProcesGeralFb.Close;
   cdsControlProcesGeralFb.IndexFieldNames := 'ANO_MES;PARCELA';
   cdsControlProcesGeralFb.Open;
   while not qryControlProces1.eof do
   begin

      if (cdsControlProcesGeralFb.FindKey([qryControlProces1ANOMES.Value,'0'])) or
         (Empty(qryControlProces1ANOMES.Value))  then
      begin
         qryControlProces1.Next;
         Continue;
      end;

      cdsControlProcesGeralFb.Insert;
      cdsControlProcesGeralFbANO_MES.Value     := qryControlProces1ANOMES.Value;
      cdsControlProcesGeralFbPARCELA.Value     := '0';
      cdsControlProcesGeralFbINICIALIZADO.Value:= 'S';
      cdsControlProcesGeralFbCALCULADO.Value   := 'S';
      cdsControlProcesGeralFbENCERRADO.Value   := 'S';
      try
         cdsControlProcesGeralFb.Post;
         SalvaRegistro(cdsControlProcesGeralFb);
      except
         DispConteudoTab(cdsControlProcesGeralFb);
      end;
      qryControlProces1.Next;
   end;

   Panel1.Caption := 'Processo concluído. - '+IntToStr(cdsControlProcesGeralFb.RecordCount)+
     ' registros migrados ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;
   frmDispTabMigrada.Executa('TabProcessamentos','CTRL_PROCESS_GERAL');

   qryControlProces1.Close;
   cdsControlProcesGeralFb.Close;
   Screen.Cursor := crDefault;

   Screen.Cursor := crHourGlass;
   dmPrincipal.DataSource1.DataSet := cdsControlProcesSUOFb;
   Panel1.Caption:= ' Migrando a Tabela de Controle de Processamentos por Sub. Unid. Orçamentária...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;

   qryControlProcesCCustos.Close;
   qryControlProcesCCustos.Open;
   cdsControlProcesSUOFb.Close;
   //cdsControlProcesSUOFb.IndexFieldNames := 'ANO_MES;PARCELA;ID_SUB_UNID_ORCAM';
   cdsControlProcesSUOFb.Open;
   while not qryControlProcesCCustos.eof do
   begin

      cdsControlProcesSUOFb.Insert;
      cdsControlProcesSUOFbANO_MES.Value          := qryControlProcesCCustosAnoMes.Value;
      cdsControlProcesSUOFbPARCELA.Value          := '0';
      cdsControlProcesSUOFbID_SUB_UNID_ORCAM.Value:= qryControlProcesCCustosCodCCustos.AsInteger+
         StrToInt(edAddIdSubUnidOrcam.Text);
      cdsControlProcesSUOFbINICIALIZADO.Value     := 'S';
      //cdsControlProcesSUOFbDATA_INICIALIZ.Value :=
      //cdsControlProcesSUOFbHORA_INICIALIZ.Value :=
      cdsControlProcesSUOFbCALCULADO.Value        := 'S';
      //cdsControlProcesSUOFbDATA_CALC.Value
      //cdsControlProcesSUOFbHORA_CALC.Value
      cdsControlProcesSUOFbPROCESS_CONCLUIDO.Value:= 'S';
      cdsControlProcesSUOFbENCERRADO.Value        := 'S';
      cdsControlProcesSUOFbDATA_ENCERRA.Value     := Date;
      cdsControlProcesSUOFbHORA_ENCERRA.Value     := Time;
      try
         cdsControlProcesSUOFb.Post;
            SalvaRegistro(cdsControlProcesSUOFb);
      except
         DispConteudoTab(cdsControlProcesSUOFb);
      end;
      qryControlProcesCCustos.Next;
   end;

   Panel1.Caption := 'Processo concluído. - '+IntToStr(cdsControlProcesSUOFb.RecordCount)+
     ' registros migrados ...';
   memLog.Lines.Add(Panel1.Caption);
   Application.ProcessMessages;
   Screen.Cursor := crDefault;

   frmDispTabMigrada.Executa('TabProcesscCCustos','CTRL_PROCES_SUB_UND_ORCAM');

   qryControlProcesCCustos.Close;
   cdsControlProcesSUOFb.Close;

end;
}

Function TFrmPrincipal.PreencheZeros(sTexto: String; iTam: Integer): String;
Begin
   While Length(sTexto) < iTam do
      sTexto := '0' + sTexto;
   Result := sTexto;
End;

procedure TFrmPrincipal.btnBancoDestinoClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
     dbBancoDestino.Text := OpenDialog1.FileName;
end;

procedure TFrmPrincipal.btnConectBancoClick(Sender: TObject);
begin

  pv_banco := '';
  pv_lSalvaEventoAlt := False;

  if lblBancoOrigem.Enabled then
  begin

    if ConectarBancos() then
    begin

      AbreTabCompatibilidade;

      PageControl1.ActivePage := tsConfig;

      btnAtualizaGens.Enabled      := True;
      btnMigrar.Enabled            := True;

      //SalvaEnderBanco;

      edMatricServidIni.SetFocus;

      btnConectBanco.Caption := 'Desconectar';

      lblBancoOrigem.Enabled := False;
      cbBanco.Enabled  := False;

      lblBancoDestino.Enabled := False;
      dbBancoDestino.Enabled  := False;
      btnBancoDestino.Enabled := False;

      dbMesAtual.ItemIndex := 11;

    end;

  end else
  begin

    if DesconectarBancos() then
    begin

      btnConectBanco.Caption := 'Conectar';

      btnAtualizaGens.Enabled      := False;
      btnMigrar.Enabled            := False;

      lblBancoOrigem.Enabled := True;
      cbBanco.Enabled  := True;

      lblBancoDestino.Enabled := True;
      dbBancoDestino.Enabled  := True;
      btnBancoDestino.Enabled := True;

      cbBanco.SetFocus;

    end;

  end;

end;

function TFrmPrincipal.ConectarBancos: Boolean;
var
  sBancoOrigem: string;
begin

  Result := False;

  dmPrincipal.connectionGERA.Params.Values['Database'] := dbBancoDestino.Text;

  try
    dmPrincipal.connectionGERA.Connected := True;
  except
    on E: Exception do
    begin
      Mensagem('Falha na conexão: Banco de Dados GERASYS ...'+#13+'('+E.Message+')', 'E R R O !!!');
      exit;
    end;
  end;

  if cbBanco.ItemIndex < 0 then  // O banco de dados não foi selecionado
    sBancoOrigem := cbBanco.Text
  else
    sBancoOrigem := FListaBancoDados[cbBanco.ItemIndex];

  dmPrincipal.connectionLayOut.Params.Values['Database'] := sBancoOrigem;

  try
    dmPrincipal.connectionLayOut.Connected := True;
  except
    on E: Exception do
    begin
      Mensagem('Falha na conexão: Banco de Dados LAYOUT ...'+#13+'('+E.Message+')','E R R O !!!');
      exit;
    end;
  end;

  dmPrincipal.ListaMesTabela(FListaMesTabela);
  dbMesAtual.Properties.Items.Assign(FListaMesTabela);

  Result := True;

end;

procedure TFrmPrincipal.dbMesAtualClick(Sender: TObject);
begin
  pv_AnoMesAtual := speAno.Text + LeftStr(dbMesAtual.Text, 2);
  if dbgEvento.Visible then
    AtualizaEventoFolha();
end;

procedure TFrmPrincipal.AtualizaEventoFolha;
var
  sSQL: string;
begin

  sSQL := 'SELECT DISTINCT ID_EVENTO, DESCR_EVENTO FROM LANCTO_EVENTO_CALC WHERE ANO_MES = '+QuotedStr(pv_AnoMesAtual);

  cdsEventoFolha.Close;
  cdsEventoFolha.CreateDataSet;

  OpenSQL(cdsEventoFolha, sSQL);

  cdsEventoFolha.First;

end;

function TFrmPrincipal.DesconectarBancos: Boolean;
begin

  Result := False;

  try
    dmPrincipal.connectionGERA.Close;
    dmPrincipal.connectionLayOut.Close;
  except
    Exit;
  end;

  Result := True;

end;

{
procedure TFrmPrincipal.SalvaEnderBanco;
var
   slEnderBanco: TStringList;
begin
   slEnderBanco := TStringList.Create;
   slEnderBanco.Add('[BANCO_GS]');
   slEnderBanco.Add(dbBancoDestino.Text);
   slEnderBanco.Add('[BANCO_EXTERNO]');
   slEnderBanco.Add(dbBancoOrigem.Text);
   slEnderBanco.SaveToFile(ExtractFilePath(Application.ExeName)+'\enderbanco.ini');
end;

Function TFrmPrincipal.GetEnderBanco(sBanco: string): string;
var
   slEnderBanco: TStringList;
   iConta: integer;
begin
   slEnderBanco := TStringList.Create;
   try
      slEnderBanco.LoadFromFile(ExtractFilePath(Application.ExeName)+'\enderbanco.ini');
      for iConta := 0 to slEnderBanco.Count - 1 do
      begin
         if slEnderBanco[iConta] = '['+sBanco+']' then
         begin
            Result := slEnderBanco[iConta+1];
            break;
         end;
      end;
   except
      Result := 'F:\Aplicativos\Delphi 2010\Gestor_RH\Dados\_REMUN_PMDE_II.FDB';
   end;
end;
}

Function TFrmPrincipal.PrimeiroRegistro(sTabela: string): string;
Var
   tDataSet: TSQLQuery;
Begin
   tDataSet := TSQLQuery.Create(Nil);
   tDataSet.SQLConnection := dmPrincipal.connectionGERA;
   tDataSet.SQL.Clear;
   tDataSet.SQL.Add('SELECT FIRST 1 ID FROM '+sTabela);
   Try
     tDataSet.Open;
     Try
        Result := tDataSet.FieldByName('ID').AsString;
     Except
     End;
   Finally
     tDataSet.Close;
     tDataSet.Free;
   End;
end;

procedure TFrmPrincipal.btnDesabilTriggersClick(Sender: TObject);
//var
//  sl1: TStringList;
begin
{
  sl1 := TStringList.Create;
  sl1.add('CREATE OR ALTER trigger lancto_evento_calc_aiu0 for lancto_evento_calc');
  sl1.add('active after insert position 0');
  sl1.add('AS');
  sl1.add('begin');
  sl1.add('/*   ');
  sl1.add('   execute procedure sp_update_b_calc_mes_servid(');
  sl1.add('      '+',new.id_servidor, new.ano_mes, new.parcela, new.id_evento, new.valor);');
  sl1.add('*/  ');
  sl1.add('   execute procedure sp_update_tot_evento_mes(
  sl1.add('      '+',new.id_servidor, new.ano_mes, new.parcela, new.id_evento, new.valor);');
  sl1.add('end');
  try
     dmPrincipal.SQLConnection1.ExecuteDirect(sl1.Text);
  except

  end;
}
end;

procedure TFrmPrincipal.btnDuplicRegClick(Sender: TObject);
Var
   iconta: Integer;
begin
   qryEventoCopy.Close;
   qryEventoCopy.Params[0].Value := cdsEventoAltID.Value;
   qryEventoCopy.Open;
   cdsEventoAlt.Append;
   cdsEventoAltID.Value := ProxId('EVENTO');
   for iconta := 1 to cdsEventoAlt.Fields.Count - 1 do
       cdsEventoAlt.Fields[iconta].Value := qryEventoCopy.Fields[iConta].Value;
   cdsEventoAlt.Post;
   SalvaRegistro(cdsEventoAlt);
   cdsEventoAlt.Last;
end;

function TFrmPrincipal.Escolaridade(sAtual: string): integer;
begin
       if sAtual = '01' then Result := 1
  else if sAtual = '02' then Result := 2
  else if sAtual = '03' then Result := 2
  else if sAtual = '04' then Result := 3
  else if sAtual = '05' then Result := 4
  else if sAtual = '06' then Result := 5
  else if sAtual = '07' then Result := 6
  else if sAtual = '08' then Result := 7
  else if sAtual = '09' then Result := 8
  else if sAtual = '10' then Result := 9
  else if sAtual = '11' then Result := 10
  else                       Result := 1;
end;

function TFrmPrincipal.EstadoCivil(sAtual: string): integer;
begin
   if sAtual = '0' then
      Result := 1
   else
   if sAtual <= '4' then
      Result := StrToInt(sAtual)
   else if (sAtual = '5') or (sAtual = '6') then
      Result := 6
   else
      Result := 6;
end;

function TFrmPrincipal.ParentescoDepend(sAtual: string): string;
begin
   if Trim(sAtual) = 'F' then
      Result := '1'
   else
   if Pos(sAtual,'00_06_07_08_09_10_11') > 0 then
      Result := '5'
   else if Pos(sAtual,'05_12_13') > 0 then
      Result := '4'
   else if Pos(sAtual,'01_02') > 0 then
      Result := '2'
   else if Pos(sAtual,'03_04') > 0 then
      Result := '1'
   else
      Result := '5';
end;

procedure TFrmPrincipal.btnAtualizaGensClick(Sender: TObject);
begin
  try
    dmPrincipal.connectionGERA.ExecuteDirect('execute procedure sp_atualiza_generators');
  except
    on E: Exception do
    begin
      Mensagem('Não foi possível Executar esta Operação ...'+#13+'('+E.Message+')', 'E R R O !!!');
     end;
  end;
end;

procedure TFrmPrincipal.btnAtualizaMovimEstFuncClick(Sender: TObject);
//var
//  iErro, iConta, iIdTemp, iIdServidor: integer;
//  sNewMatric: string;
begin
{
  Gauge1.Progress:=0;

  pv_lSalvar := True;

  with dmCadLanctos do
  begin

     qryServidor.Close;
     qryServidor.ParamByName('pMatricIni').AsString := PreencheZeros(edMatricServidIni.Text,6);
     qryServidor.ParamByName('pMatricFim').AsString := PreencheZeros(edMatricServidFim.Text,6);
     qryServidor.Open;

     qryContaServidor.Close;
     qryContaServidor.ParamByName('pMatricIni').AsString := PreencheZeros(edMatricServidIni.Text,6);
     qryContaServidor.ParamByName('pMatricFim').AsString := PreencheZeros(edMatricServidFim.Text,6);
     qryContaServidor.Open;
     try
        Gauge1.MaxValue := qryContaServidorQTD_SERVID.Value;
     except
        Gauge1.MaxValue := 0;
     end;

     iErro := 0;
     iConta:= 0;

     While not qryServidor.eof do
     begin

        if (Trim(qryServidorCPF.Value)='') and (Trim(qryServidorNome.Value)='') or
           (qryServidorDEPDESPESA.IsNull) then
        begin
            memLog.Lines.Add('Não foi possível migrar o Servidor de Matrícula '+qryServidorMatricula.AsString+
               '(s/ CPF e s/ Nome) ...');
           qryServidor.Next;
           Gauge1.Progress := Gauge1.Progress + 1;
           Continue;
        end;

        memLog.Lines.Add('');
        memLog.Lines.Add('***');
        memLog.Lines.Add('Migrando o Servidor de Matrícula '+qryServidorMatricula.AsString);

        Inc(iConta);
        iIdTemp := qryServidorMatricula.AsInteger+StrToInt(edAddIdServid.Text);
        sNewMatric := PreencheZeros(IntToStr(iIdTemp),6);

        iIdServidor := StrToInt((sNewMatric+CalcDigito(sNewMatric)));

        iErro := MigraMovimEstFuncional(qryServidorREGISTRO.Value,iIdServidor);

        if iErro = 1 then Break;

        Gauge1.Progress := Gauge1.Progress + 1;
        qryServidor.Next;

    end;

    memLog.Lines.Add('Movimentos do Servidor de Matrícula '+qryServidorREGISTRO.Value+
      ' ('+IntToStr(iIdServidor)+') (Migrado c/ sucesso) ...');
  end;
  }

end;

Function TFrmPrincipal.EstadoFuncional(sMatric: String): String;
Var
  iTemp: Integer;
begin
  cdsMovServidLO.Close;
  qryMovServidLO.ParamByName('pMatric').Value:= sMatric;
  cdsMovServidLO.Open;
  cdsMovServidLO.Last;
  iTemp := 1;
  if not cdsMovServidLOMATRICULA.IsNull then
     iTemp := cdsMovServidLOCODFOL.AsInteger;
  cdsMovServidLO.Close;
  Result := IntToStr(iTemp)
end;

procedure TFrmPrincipal.MigraMovimFinanceira;
var
  lEventos: TStringList;
  DataModule: TdtmMovimento;
  s, sEventoCodigo, sMatriculaAntiga, sAnoMes, sBanco, sCPF: string;
  cEventoValor, cEventoQtde: Currency;
  i, iServidorID, iEventoID, iCampo, iOrdem: Integer;
begin

  sAnoMes  := pv_AnoMesAtual;
  lEventos := TStringList.Create;
  DataModule := TdtmMovimento.Create(NIL);

  try

     Panel1.Caption:= ' Migrando a Movimentação Financeira';
     memLog.Lines.Add(Panel1.Caption);
     Application.ProcessMessages;

     with DataModule do
     begin

        // qryFolhaServidor: Tabela SFPDXX02JUN, contém a movimentação do servidor/mes

        qryFolhaServidor_LAYOUT.Close;
        qryFolhaServidor_LAYOUT.SQL.Clear;
        qryFolhaServidor_LAYOUT.SQL.Add('SELECT E.*, S.CPF FROM SFPDXX02'+pv_mes+' E, SFP001'+pv_mes+' S');
        qryFolhaServidor_LAYOUT.SQL.Add('WHERE (E.MATRICULA >= :1) AND (S.MATRICULA = E.MATRICULA)');
        qryFolhaServidor_LAYOUT.SQL.Add('ORDER BY E.MATRICULA');
        qryFolhaServidor_LAYOUT.Params[0].Value := Trim(edMatricServidIni.Text);
        qryFolhaServidor_LAYOUT.Open;

        Gauge1.Progress := 0;

        //qryFolhaServidor_LAYOUT.First;

        while not qryFolhaServidor_LAYOUT.Eof do
        begin

          Gauge1.Progress := Gauge1.Progress + 1;

          sMatriculaAntiga := qryFolhaServidor_LAYOUTMATRICULA.AsString;
          sCPF := qryFolhaServidor_LAYOUTCPF.AsString;

          try
            OpenServidorMes(pv_mes, sMatriculaAntiga);
          except
            Mensagem('OpenServidorMes - Servidor: '+sMatriculaAntiga,'ERRO !!!');
          end;

          iServidorID := dmCadLanctos.cdsServidorFBID.AsInteger;

          Panel1.Caption:= 'Servidor: matricula: '+sMatriculaAntiga+' - CPF: '+sCPF+' - ID: '+IntToStr(iServidorID);
          memLog.Lines.Add(Panel1.Caption);
          Application.ProcessMessages;

          ApagarLancamentoEventoCalc(sAnoMes, iServidorID);
          ApagaInicializaMesServidor(sAnoMes, iServidorID);

          Try
            NovoBaseCalcServidor(sAnoMes, iServidorID);
          except
            Mensagem('B.CALC. MÊS - Servidor: '+sMatriculaAntiga,'ERRO !!!');
          End;

          // cdsIniMesServidor contém as informações do servidor por mês da folha

          cdsIniMesServidor.Close;
          cdsIniMesServidor.Params[0].AsString  := sAnoMes;
          cdsIniMesServidor.Params[1].AsInteger := iServidorID;
          cdsIniMesServidor.Open;

          if cdsIniMesServidor.IsEmpty then
            cdsIniMesServidor.Append
          else
            cdsIniMesServidor.Edit;

          cdsIniMesServidorANO_MES.AsString := sAnoMes;
          cdsIniMesServidorID_SERVIDOR.AsInteger := iServidorID;
          cdsIniMesServidorID_SUB_UNID_ORCAMENT.AsInteger := dmCadLanctos.cdsServidorFBID_SUB_UNID_ORCAMENT.AsInteger;
          cdsIniMesServidorID_CARGO.AsInteger  := dmCadLanctos.cdsServidorFBID_CARGO_ATUAL.AsInteger;
          cdsIniMesServidorID_CARGO2.AsInteger := dmCadLanctos.cdsServidorFBID_CARGO_ORIGEM.AsInteger;

          cdsIniMesServidorDT_ADMISSAO.Value  := dmCadLanctos.cdsServidorFBDT_ADMISSAO.Value;
          cdsIniMesServidorID_UNID_LOTACAO.AsInteger := dmCadLanctos.cdsServidorFBID_UNID_LOTACAO.AsInteger;
          cdsIniMesServidorID_DEPTO.AsInteger := dmCadLanctos.cdsServidorFBID_DEPTO.AsInteger;
          cdsIniMesServidorEFETIVO.AsString   := dmCadLanctos.cdsServidorFBEFETIVO.AsString;

          cdsIniMesServidorID_SITUACAO_TCM.AsInteger  := dmCadLanctos.cdsServidorFBID_SITUACAO_TCM.AsInteger;
          cdsIniMesServidorID_EST_FUNCIONAL.AsInteger := dmCadLanctos.cdsServidorFBID_EST_FUNCIONAL.AsInteger;

          cdsIniMesServidorCALC_PREVID.Value  := dmCadLanctos.cdsServidorFBCALC_PREVID.Value;
          cdsIniMesServidorCALC_IRRF.Value    := dmCadLanctos.cdsServidorFBCALC_IRRF.Value;

          cdsIniMesServidorBLOQ_LANCTO_EVENTO_AUTO.Value := dmCadLanctos.cdsServidorFBBLOQ_LANCTO_EVENTO_AUTO.Value; // servidor

          cdsIniMesServidorQTD_DEPEND_SAL_FAM.AsInteger := qryFolhaServidor_LAYOUTNUMDEPSF.AsInteger;
          cdsIniMesServidorQTD_DEPEND_IRRF.Value := qryFolhaServidor_LAYOUTNUMDEPIR.Value;

          cdsIniMesServidorID_PROGRES_SAL.Value := 1;

          cdsIniMesServidorCARGA_HOR_MENSAL.Value := dmCadLanctos.cdsServidorFBCARGA_HOR_MENSAL.Value; // servidor

          // cdsIniMesServidorCALC_VENCTO_BASE   :=
          // cdsIniMesServidorVENCTO_BASE_CARGO  :=
          cdsIniMesServidorTIPO_SAL.AsString := dmCadLanctos.cdsServidorFBTIPO_SAL.AsString;
          // cdsIniMesServidorFORMA_CALC_SAL :=
          cdsIniMesServidorBC_HORA_AULA.AsInteger := dmCadLanctos.cdsServidorFBBASE_CALC_HORA_AULA.AsInteger; // servidor
          // cdsIniMesServidorTEMPO_SERVICO.Value
          //cdsIniMesServidorQTD_DEPEND_P_ALIMENT.Value

          cdsIniMesServidorQTD_DIAS_TRAB.AsInteger := qryFolhaServidor_LAYOUTDIAS.AsInteger;

          if qryFolhaServidor_LAYOUTVALAULAS.AsCurrency > 0 then
            cdsIniMesServidorTIPO_SAL.AsString := '2'
          else
            cdsIniMesServidorTIPO_SAL.AsString := '1';

          cdsIniMesServidor.Post;

          try
             SalvaRegistro(cdsIniMesServidor);
          except
             Mensagem('INI. MÊS - Servidor: '+sMatriculaAntiga,'ERRO !!!');
          end;

          // Importa historico/movimentacao: Lancamento Evento

          Try
             cEventoValor := qryFolhaServidor_LAYOUTSALARIO.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEventoCodigo('K1', sBanco);
               if iEventoID > 0 then
               begin
                 cEventoQtde := qryFolhaServidor_LAYOUTDIAS.AsInteger;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALAULAS.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEventoCodigo('K1', sBanco);
               if iEventoID > 0 then
               begin
                 s := qryFolhaServidor_LAYOUTHORAULAS.AsString + ' HORAS';
                 cEventoQtde := qryFolhaServidor_LAYOUTDIAS.AsInteger;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor, s);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALEXTRAS.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventohoras_extras.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 cEventoQtde  := qryFolhaServidor_LAYOUTNUMEXTRAS.AsCurrency;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALEXTRA1.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoretro_hora_extra.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 cEventoQtde  := qryFolhaServidor_LAYOUTNUMEXTRA1.AsCurrency;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALADNOT.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoadicional_noturno.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 cEventoQtde  := qryFolhaServidor_LAYOUTNUMADNOT.AsCurrency;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTPOGIZ.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventopo_de_giz.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 cEventoQtde  := qryFolhaServidor_LAYOUTPERCGIZ.AsCurrency;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALFALTAS.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventofaltas.Value, 'D', sBanco);
               if iEventoID > 0 then
               begin
                 //cEventoQtde  := qryFolhaServidor_LAYOUTNUMFALTAS.AsCurrency;
                 try
                   NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
                 except
                   Mensagem('Servidor: '+sMatriculaAntiga,'ERRO !!!');
                 end;
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTADIANTA.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoadiantamento_salario.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 //cEventoQtde  := qryFolhaServidor_LAYOUTPERCADIANT.AsCurrency;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTINSS.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoinss.Value, 'D', sBanco);
               NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTIRRF.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoirrf.Value, 'D', sBanco);
               NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTSALFAM.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventosalario_familia.Value, 'V', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALVT.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventovale_transporte.Value, 'D', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTVALCS.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventocontrib_sindical.Value, 'D', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTAVISOPREV.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoresc_aviso_previo.Value, 'V', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTSAL13PROP.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEvento13_salario.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 cEventoQtde := qryFolhaServidor_LAYOUTAVOS13.AsInteger;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);
               end;
             end;

             cEventoValor := qryFolhaServidor_LAYOUTFERIASVEN.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoadicional_noturno.Value, 'V', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTFERIASPROP.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoferias_porporc.Value, 'V', sBanco);
               if iEventoID > 0 then
               begin
                 //cEventoQtde := qryFolhaServidor_LAYOUTAVOSFER.AsInteger;
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
               end;
             end;
             {
             cEventoValor := qryFolhaServidor_LAYOUTADICFERIAS.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento('ADICIONAL DE FERIAS', 'V', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;
             }

             cEventoValor := qryFolhaServidor_LAYOUTIRRF13.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoimp_renda_13_sal.Value, 'D', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;

             cEventoValor := qryFolhaServidor_LAYOUTIMPOSTO13.AsCurrency;

             {
             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento('IMP RENDA 13 SALARIO', 'D', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;
             }
             cEventoValor := qryFolhaServidor_LAYOUTIMPOSTO.AsCurrency;

             if cEventoValor > 0 then
             begin
               iEventoID := PesquisaEvento(cdsCompatibEventoprevid_municipal.Value, 'D', sBanco);
               if iEventoID > 0 then
                 NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, 0, cEventoValor);
             end;
          except
             Mensagem('LANCTO EVENTO - Servidor: '+sMatriculaAntiga,'ERRO !!!');
          End;

          // Importa campos de eventos personalizados

          lEventos.Clear;

          for iCampo := 1 to 17 do
          begin

            if iCampo = 10 then Continue;

            Try
              sEventoCodigo := Trim(qryFolhaServidor_LAYOUT.FieldByName('COD'+IntToStr(iCampo)).AsString);
              cEventoValor  := qryFolhaServidor_LAYOUT.FieldByName('VALOR'+IntToStr(iCampo)).AsCurrency;
              cEventoQtde   := qryFolhaServidor_LAYOUT.FieldByName('QUANT'+IntToStr(iCampo)).AsCurrency;

              if (sEventoCodigo <> EmptyStr) and (cEventoValor > 0) then
              begin

                lEventos.Add(sEventoCodigo);

                iOrdem := 0;

                for i := 0 to lEventos.Count - 1 do
                begin
                  if lEventos.Strings[i] = sEventoCodigo then
                    iOrdem := iOrdem + 1;
                end;

                iEventoID := PesquisaEventoCodigoProximo(sEventoCodigo, iOrdem);

                if iEventoID > 0 then
                  NovoLancamentoEventoCalc(sAnoMes, iServidorID, iEventoID, cEventoQtde, cEventoValor);

              end;
            except
              Mensagem('LANCTO EVENTO (2) - Servidor: '+sMatriculaAntiga,'ERRO !!!');
            End;

          end;

          qryFolhaServidor_LAYOUT.Next;

        end;

     end;

  finally
    DataModule.Free;
    lEventos.Free;
  end;

end;

function TFrmPrincipal.AjustaMatricula(sMatricula: string): string;
begin
  Result := '0';
end;

procedure TFrmPrincipal.OpenServidorMes(const Mes, Matricula: string);
var
  iSituacaoTCM, iFuncaoProfessorGera: Integer;
  sUnidadeLotacaoLayout, sEfetivo, sCodigoSecretariaOrigem,
  sSistemaLayout, sIdSubUnidOrcam, sCPF, sMatriculaOld, sEstFuncTemp,
  sFuncaoLayout, sFuncaoGera, sCodigo, sSysAnterior: string;
begin

  // para servidores sem cargo ou que o cargo não foi localizado na tabela CARGO_FUNCAO
  iFuncaoProfessorGera := PesquisaCargoNome('PROFESSOR');

  with dmCadLanctos do
  begin

    qryServidor.Close;
    qryServidor.SQL.Text := 'SELECT * FROM SFP001' + mes + ' WHERE MATRICULA = '+QuotedStr(Matricula);
    qryServidor.Open;

    sCPF := Trim(qryServidorCPF.AsString);
    sMatriculaOld  := qryServidorMATRICULA.AsString;
    sSistemaLayout := qryServidorSISTEMA.AsString;

    sSysAnterior := sMatriculaOld+';'+pv_banco;

    sCodigo := Pesquisa('SERVIDOR', 'ID_SYS_ANTER', sSysAnterior, 'ID');
    if sCodigo = '' then
    Begin
       Mensagem('SERVIDOR NÃO ENCONTRADO NO REMUNERATU$ - Matrícula Layout: '+sMatriculaOld,'ERRO !!!');
       qryServidor.Close;
       exit;
    End;

    cdsServidorFB.Close;
    cdsServidorFB.Params[0].AsInteger := StrToInt(sCodigo);
    cdsServidorFB.Open;

    cdsServidorFB.Edit;

    if sSistemaLayout = '01' then      iSituacaoTCM := 20
    else if sSistemaLayout = '02' then iSituacaoTCM := 10
    else if sSistemaLayout = '03' then iSituacaoTCM := 61
    else if sSistemaLayout = '04' then iSituacaoTCM := 34
    else                               iSituacaoTCM := 62;

    if iSituacaoTCM = 20 then sEfetivo := 'S'
                         else sEfetivo := 'N';

    cdsServidorFBEFETIVO.AsString          := sEfetivo;
    cdsServidorFBID_SITUACAO_TCM.AsInteger := iSituacaoTCM;

    if qryServidorDtAdmissao.IsNull then
      cdsServidorFBDT_ADMISSAO.AsDateTime := EncodeDate(1900, 1, 1)
    else
      cdsServidorFBDT_ADMISSAO.AsDateTime := Trunc(qryServidorDtAdmissao.AsDateTime);

    cdsServidorFBDOCTO_ADMISSAO.AsString := qryServidorNUMDECRETO.AsString;

    sCodigoSecretariaOrigem := qryServidorCDSECRETA.AsString+qryServidorCDSETOR.AsString;

    sIdSubUnidOrcam := Pesquisa('SUB_UNID_ORCAMENT', 'ID_SYS_ANTER', sCodigoSecretariaOrigem+';'+pv_banco,'ID');

    cdsServidorFBID_SUB_UNID_ORCAMENT.AsInteger := StrToIntDef(sIdSubUnidOrcam, 1);

    sUnidadeLotacaoLayout := Trim(qryServidorCODESC.AsString);

    if sUnidadeLotacaoLayout <>  EmptyStr then
      sUnidadeLotacaoLayout := Pesquisa('UNID_LOTACAO','ID_SYS_ANTER', sUnidadeLotacaoLayout+';'+pv_banco, 'ID');

    cdsServidorFBID_UNID_LOTACAO.AsInteger := StrToIntDef(sUnidadeLotacaoLayout, 1);

    if qryServidorCDDEPART.IsNull then
      cdsServidorFBID_DEPTO.AsVariant := 1
    else
      cdsServidorFBID_DEPTO.AsVariant := qryServidorCDDEPART.AsInteger;

    if cdsServidorFBID_DEPTO.IsNull then
      cdsServidorFBID_DEPTO.AsVariant := 1;

    if cdsServidorFBID_UNID_LOTACAO.IsNull then
      cdsServidorFBID_UNID_LOTACAO.AsVariant := 1;  // prédio da prefeitura

    sFuncaoLayout := Trim(qryServidorFUNCAO2.AsString);

    if sFuncaoLayout = EmptyStr then
      sFuncaoLayout := Trim(qryServidorFUNCAO.AsString);

    sFuncaoGera := Pesquisa('CARGO_FUNCAO', 'ID_SYS_ANTER', sFuncaoLayout+';'+pv_banco,'ID');

    if sFuncaoGera = EmptyStr then
      cdsServidorFBID_CARGO_ATUAL.AsInteger := iFuncaoProfessorGera  // Professor
    else
      cdsServidorFBID_CARGO_ATUAL.AsInteger := StrToInt(sFuncaoGera);

    cdsServidorFBID_CARGO_ORIGEM.AsInteger := cdsServidorFBID_CARGO_ATUAL.AsInteger;

    if not qryServidorDTCONCURS2.IsNull then
      cdsServidorFBDT_CONCURSO.AsDateTime := Trunc(qryServidorDTCONCURS2.AsDateTime)
    else if not qryServidorDTCONCURSO.IsNull then
      cdsServidorFBDT_CONCURSO.AsDateTime := Trunc(qryServidorDTCONCURSO.AsDateTime);

    cdsServidorFBID_ESCOLARIDADE.AsVariant := 1;

    if Trim(qryServidorGRINSTR.AsString) <> EmptyStr then
    begin
      if pos(qryServidorGRINSTR.AsString,'1;2;3;4;5;6;7;8;9;0') > 0 then
        if qryServidorGRINSTR.AsInteger > 2 then
          cdsServidorFBID_ESCOLARIDADE.AsVariant := qryServidorGRINSTR.AsInteger-1;
    end;

    cdsServidorFBFORMACAO.AsVariant := qryServidorFORMACAO.Value;

    sEstFuncTemp := EstadoFuncional(qryServidorMATRICULA.AsString);

    if sEstFuncTemp <> '1' then
      sEstFuncTemp := Pesquisa('ESTADO_FUNCIONAL', 'ID_SYS_ANTER', sEstFuncTemp, 'ID');

    if sEstFuncTemp = EmptyStr then
      cdsServidorFBID_EST_FUNCIONAL.AsInteger := 1  // ATIVO
    else
      cdsServidorFBID_EST_FUNCIONAL.AsInteger := StrToInt(sEstFuncTemp);

    cdsServidorFBCARGA_HOR_MENSAL.AsInteger := 0;
    cdsServidorFBQTD_DEPEND_IRRF.Value  := qryServidorNUMDEPIR.Value;
    cdsServidorFBCALC_VENCTO_BASE.AsString  := 'S';
    cdsServidorFBBLOQ_LANCTO_EVENTO_AUTO.AsString := 'N';
    cdsServidorFBCALC_PREVID.AsString := 'S';
    cdsServidorFBCALC_IRRF.AsString   := 'S';

    if cdsServidorFBID_EST_FUNCIONAL.AsInteger = 22 then // Demissao
      cdsServidorFBSTATUS.AsString := '3'
    else
      cdsServidorFBSTATUS.AsString := '1';

    if not cdsServidorFBDT_CONCURSO.IsNull then
      cdsServidorFBDT_CONCURSO.AsDateTime := Trunc(cdsServidorFBDT_CONCURSO.AsDateTime);

    cdsServidorFBID_SYS_ANTER.AsString := sSysAnterior;

    cdsServidorFB.Post;

    qryServidor.Close;

  end;

end;

procedure TFrmPrincipal.AbreTabCompatibilidade;
Var
   sDir: string;
begin
   sDir := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
   if not FileExists(sDir+cdsCompatibEvento.Name+'.cds') then
   begin
      cdsCompatibEvento.CreateDataSet;
      cdsCompatibEvento.Open;
      cdsCompatibEvento.Insert;
      cdsCompatibEventohoras_extras.Value := Label21.Caption;
      cdsCompatibEventoretro_hora_extra.Value := Label5.Caption;
      cdsCompatibEventoadicional_noturno.Value := Label6.Caption;
      cdsCompatibEventopo_de_giz.Value := Label7.Caption;
      cdsCompatibEventofaltas.Value := Label8.Caption;
      cdsCompatibEventoadiantamento_salario.Value := Label9.Caption;
      cdsCompatibEventosalario_familia.Value := Label12.Caption;
      cdsCompatibEventoinss.Value := Label10.Caption;
      cdsCompatibEventoirrf.Value := Label11.Caption;
      cdsCompatibEventovale_transporte.Value := Label13.Caption;
      cdsCompatibEventocontrib_sindical.Value := Label14.Caption;
      cdsCompatibEventoresc_aviso_previo.Value := Label15.Caption;
      cdsCompatibEvento13_salario.Value := Label16.Caption;
      cdsCompatibEventoadic_ferias.Value := Label17.Caption;
      cdsCompatibEventoferias_porporc.Value := Label18.Caption;
      cdsCompatibEventoimp_renda_13_sal.Value := Label19.Caption;
      cdsCompatibEventoprevid_municipal.Value := Label20.Caption;
   end else
   begin
      cdsCompatibEvento.LoadFromFile(sDir+cdsCompatibEvento.Name+'.cds');
      cdsCompatibEvento.edit;
   end;

   if not FileExists(sDir+cdsCompatibVinculo.Name+'.cds') then
   begin
      cdsCompatibVinculo.CreateDataSet;
      cdsCompatibVinculo.Open;
      cdsCompatibVinculo.Insert;
   end else
   begin
      cdsCompatibVinculo.LoadFromFile(sDir+cdsCompatibVinculo.Name+'.cds');
      cdsCompatibVinculo.edit;
   end;
   cdsCompatibVinculo.IndexFieldNames := 'Codigo';

   cdsEventoAlt.Close;
   cdsEventoAlt.IndexFieldNames := 'DESCRICAO';
   cdsEventoAlt.Open;


end;

end.
