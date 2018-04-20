unit UConexaoTargetDB;

interface

uses
  System.SysUtils, System.Classes, System.StrUtils, System.Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Error;

Type
  TTipoSalario         = (tipoSalarioUm = 1, tipoSalarioDois = 2);
  TTipoBaseCalculo     = (baseCalculoZero = 0, baseCalculoUm = 1, baseCalculoDois = 2, baseCalculores = 3);
  TTipoNaturezaEvento  = (naturezaEventoNULL, naturezaEventoDois = 2);
  TFormaCalculo        = (formaCalculoAutomatico = 1, formaCalculoPorPercentual = 2, formaCalculoQuantidade = 3, formaCalculoQuantidadeValor = 4, formaCalculoValorFixo = 5);
  TFormaCalculoRecisao = (formaCalculoRecisaoUm = 1, formaCalculoRecisaoDois = 2);
  TLocalidade = (localZonaUrbana = 1, localZonaRural = 2);
  TSexo = (sexoMasculino = 0, sexoFemino = 1);
  TStatusServidor = (statusServidorUm = 1);
  TTipoVinculo = (tipoVinculoUm = 1);
  TTipoConta   = (tipoContaCorrente = 1, tipoContaSalario = 2, tipoContaPoupanca = 3);
  TParentesco  = (parentescoFilho = 1, parentescoConjuge = 2, parentescoFilhoAdotivo = 3, parentescoPais = 4, parentescoOutros = 5);
  TTipoMovimento = (tipoMovimentoNulo = 0, tipoMovimentoUm = 1, tipoMovimentoDois, tipoMovimentoTres);

  TSexoCollection = Set of TSexo;
  TSexoLista      = Array[Low(sexoMasculino)..High(sexoMasculino)] of String;
  TEventoIDList   = Array of Integer;

//  TDocumentoCPF = record
//    Numero      : String;
//    DataEmissao : TDateTime;
//  end;

  TGenerico = class(TObject)
    private
      FID       : Integer;
      FDescricao,
      FCodigo   : String;
      FAtivo    : Boolean;

      procedure SetID(Value : Integer);
      procedure SetCodigo(Value : String);
      procedure SetDescricao(Value : String);

      function GetID        : Integer;
      function GetCodigo    : String;
      function GetDescricao : String;
    public
      procedure CarregarDados; virtual;

      property ID        : Integer read GetID write SetID;
      property Descricao : String read GetDescricao write SetDescricao;
      property Codigo    : String read FCodigo write SetCodigo;
      property Ativo     : Boolean read FAtivo write FAtivo;

      constructor Create;
      destructor Destroy;
  end;

  TArrayGenerico = Array of TGenerico;

Type
  TDocumentoGenerico = class(TGenerico)
    private
      FDataEmissao : TDateTime;
    public
      property Numero : String read GetCodigo write SetCodigo;
      property DataEmissao : TDateTime read FDataEmissao write FDataEmissao;

      constructor Create;
      destructor Destroy;
  end;

Type
  TDocumentoRG = class(TDocumentoGenerico)
    private
      FOrgaoEmissor,
      FUF          : String;
    public
      property OrgaoEmissor : String read FOrgaoEmissor write FOrgaoEmissor;
      property UF           : String read FUF write FUF;

      constructor Create;
      destructor Destroy;
  end;

Type
  TDocumentoCNH = class(TDocumentoGenerico)
    private
      FCategoria : String;
      FDataVencimento : TDateTime;
    public
      property Categoria : String read FCategoria write FCategoria;
      property DataVencimento : TDateTime read FDataVencimento write FDataVencimento;

      constructor Create;
      destructor Destroy;
  end;

Type
  TDocumentoTituloEleitor = class(TDocumentoGenerico)
    private
      FZona  ,
      FSecao : String;
    public
      property Zona  : String read FZona write FZona;
      property Secao : String read FSecao write FSecao;

      constructor Create;
      destructor Destroy;
  end;

Type
  TCBO = class(TObject)
    private
      FID       : Smallint;
      FDescricao,
      FCodigo   : String;
    public
      property ID        : Smallint read FID write FID;
      property Descricao : String read FDescricao write FDescricao;
      property Codigo    : String read FCodigo write FCodigo;

      constructor Create;
      destructor Destroy;
  end;

Type
  TFatorProgramaSalario = class(TGenerico)
    private
      FQuantidadeReferencia,
      FReferenciaInicial   ,
      FQuantidadeAno       : Integer;
      FPercentual          : Currency;
      FAutomatico          ,
      FIncorporaVenctoBase : Boolean;
    public
      property QuantidadeReferencia : Integer read FQuantidadeReferencia write FQuantidadeReferencia;
      property ReferenciaInicial    : Integer read FReferenciaInicial write FReferenciaInicial;
      property QuantidadeAno        : Integer read FQuantidadeAno write FQuantidadeAno;
      property Percentual           : Currency read FPercentual write FPercentual;
      property Automatico           : Boolean read FAutomatico write FAutomatico;
      property IncorporaVenctoBase  : Boolean read FIncorporaVenctoBase write FIncorporaVenctoBase;

      constructor Create;
      destructor Destroy;
  end;

Type
  TCargoFuncao = class(TGenerico)
    private
      FCategoria : TGenerico;
      FTipoTCM   : TGenerico;
      FVencimentoBase : Currency;
      FTipoSalario  : TTipoSalario;
      FFormaCalculo : TFormaCalculo;
      FBaseCalculoHoraAula : Integer;
      FCargaHorariaMensal  : Integer;
      FQuantidadeVaga      : Integer;
      FEscolaridade        : TGenerico;
      FCBO : TCBO;
      FFatorProgramaSalario : TFatorProgramaSalario;
      FNumeroAtoCriacao : String;
      FDataAtoCriacao : TDateTime;
      FEventoBase     : TGenerico;
      FCalculaATS           : Boolean; // 'S' ou 'N'
      FCalculaATSVencimentoBase : Boolean;
      FCalculaDecimoTerc    : Boolean;
      FCalculaContribSind   : Boolean;
      FSalarioMinimoAutomat : Boolean;
      FSituacao : String;
      FDataExtinsao : TDateTime;
      FObservacao   : String;
      FTempoATS     : Integer;
      FPercentualATS: Currency;
    public
      property Categoria : TGenerico read FCategoria write FCategoria;
      property TipoTCM   : TGenerico read FTipoTCM write FTipoTCM;
      property VencimentoBase : Currency read FVencimentoBase write FVencimentoBase;
      property TipoSalario    : TTipoSalario read FTipoSalario write FTipoSalario;
      property FormaCalculo   : TFormaCalculo read FFormaCalculo write FFormaCalculo;
      property BaseCalculoHoraAula : Integer read FBaseCalculoHoraAula write FBaseCalculoHoraAula;
      property CargaHorariaMensal  : Integer read FCargaHorariaMensal write FCargaHorariaMensal;
      property QuantidadeVaga      : Integer read FQuantidadeVaga write FQuantidadeVaga;
      property Escolaridade        : TGenerico read FEscolaridade write FEscolaridade;
      property CBO : TCBO read FCBO write FCBO;
      property FatorProgramaSalario : TFatorProgramaSalario read FFatorProgramaSalario write FFatorProgramaSalario;
      property NumeroAtoCriacao : String read FNumeroAtoCriacao write FNumeroAtoCriacao;
      property DataAtoCriacao : TDateTime read FDataAtoCriacao write FDataAtoCriacao;
      property EventoBase     : TGenerico read FEventoBase write FEventoBase;
      property CalculaATS           : Boolean read FCalculaATS write FCalculaATS; // 'S' ou 'N'
      property CalculaATSVencimentoBase : Boolean read FCalculaATSVencimentoBase write FCalculaATSVencimentoBase;
      property CalculaDecimoTerc    : Boolean read FCalculaDecimoTerc write FCalculaDecimoTerc;
      property CalculaContribSind   : Boolean read FCalculaContribSind write FCalculaContribSind;
      property SalarioMinimoAutomat : Boolean read FSalarioMinimoAutomat write FSalarioMinimoAutomat;
      property Situacao : String read FSituacao write FSituacao;
      property DataExtinsao  : TDateTime read FDataExtinsao write FDataExtinsao;
      property Observacao    : String read FObservacao write FObservacao;
      property TempoATS      : Integer read FTempoATS write FTempoATS;
      property PercentualATS : Currency read FPercentualATS write FPercentualATS;
      procedure CarregarDados; override;

      constructor Create;
      destructor Destroy;
  end;

Type
  TUnidadeGestora = class(TGenerico)
    private
      FRazaoSocial   ,
      FCodigoContabil,
      FCNPJ          : String;
      FTipoUnidade   : TGenerico;
      FCodigoTCM     : Integer;
      FFormaCalculoRecisao : TFormaCalculoRecisao;
      FTetoVencimentoBase  : Currency;
      FCNPJPrincipal       ,
      FGestorNome          ,
      FGestorDescricaoCargo: String;
      FGestorServidorID    : Integer;
      FDadosNoContraCheque ,
      FCNPJ_naGPS          : Boolean;
    public
      property RazaoSocial    : String read FRazaoSocial write FRazaoSocial;
      property CodigoContabil : String read FCodigoContabil write FCodigoContabil;
      property CNPJ           : String read FCNPJ write FCNPJ;
      property TipoUnidade    : TGenerico read FTipoUnidade write FTipoUnidade;
      property CodigoTCM      : Integer read FCodigoTCM write FCodigoTCM;
      property FormaCalculoRecisao : TFormaCalculoRecisao read FFormaCalculoRecisao write FFormaCalculoRecisao;
      property TetoVencimentoBase  : Currency read FTetoVencimentoBase write FTetoVencimentoBase;
      property CNPJPrincipal       : String read FCNPJPrincipal write FCNPJPrincipal;
      property GestorNome          : String read FGestorNome write FGestorNome;
      property GestorDescricaoCargo: String read FGestorDescricaoCargo write FGestorDescricaoCargo;
      property GestorServidorID    : Integer read FGestorServidorID write FGestorServidorID;
      property DadosNoContraCheque : Boolean read FDadosNoContraCheque write FDadosNoContraCheque;
      property CNPJ_naGPS          : Boolean read FCNPJ_naGPS write FCNPJ_naGPS;

      constructor Create;
      destructor Destroy;
  end;

Type
  TUnidadeOrcamentaria = class(TGenerico)
    private
      FCodigoContabil   : String;
      FUnidadeGestora   : TUnidadeGestora;
      FFUNDEB           : Boolean;
      FTextoDotacao     : TStringList;
      FProjetoAtividade : String;
    public
      property CodigoContabil : String read FCodigoContabil write FCodigoContabil;
      property UnidadeGestora : TUnidadeGestora read FUnidadeGestora write FUnidadeGestora;
      property FUNDEB           : Boolean read FFUNDEB write FFUNDEB;
      property TextoDotacao     : TStringList read FTextoDotacao write FTextoDotacao;
      property ProjetoAtividade : String read FProjetoAtividade write FProjetoAtividade;

      constructor Create;
      destructor Destroy;
  end;

Type
  TSubUnidadeOrcamentaria = class(TGenerico)
    private
      FAbreviacao : String;
      FVinculo    : TTipoVinculo;
      FUnidadeOrcamentaria : TUnidadeOrcamentaria;
      FSetor : TGenerico;
      FTipoPrevidencia   ,
      FContribIndividual : Boolean;
      FCodigoOrgaoBanco  : String;
      FEventoBase : TGenerico;
      FCalculaATS ,
      FCalculaSalarioFamilia,
      FDescontoIRRF,
      FPagaRecisao ,
      FInativos    ,
      FGeraRAIS    : Boolean;
      FTetoVencimentoBase,
      FTetoSalario       : Currency;
      FPagamentoFUNDEB,
      FGeraDIRF       ,
      FGeraGFIP       : Boolean;
    public
      property Abreviacao : String read FAbreviacao write FAbreviacao;
      property Vinculo    : TTipoVinculo read FVinculo write FVinculo;
      property UnidadeOrcamentaria : TUnidadeOrcamentaria read FUnidadeOrcamentaria write FUnidadeOrcamentaria;
      property Setor : TGenerico read FSetor write FSetor;
      property TipoPrevidencia   : Boolean read FTipoPrevidencia write FTipoPrevidencia;
      property ContribIndividual : Boolean read FContribIndividual write FContribIndividual;
      property CodigoOrgaoBanco  : String read FCodigoOrgaoBanco write FCodigoOrgaoBanco;
      property EventoBase : TGenerico read FEventoBase write FEventoBase;
      property CalculaATS : Boolean read FCalculaATS write FCalculaATS;
      property CalculaSalarioFamilia : Boolean read FCalculaSalarioFamilia write FCalculaSalarioFamilia;
      property DescontoIRRF : Boolean read FDescontoIRRF write FDescontoIRRF;
      property PagaRecisao  : Boolean read FPagaRecisao write FPagaRecisao;
      property Inativos     : Boolean read FInativos write FInativos;
      property GeraRAIS     : Boolean read FGeraRAIS write FGeraRAIS;
      property TetoVencimentoBase : Currency read FTetoVencimentoBase write FTetoVencimentoBase;
      property TetoSalario        : Currency read FTetoSalario write FTetoSalario;
      property PagamentoFUNDEB : Boolean read FPagamentoFUNDEB write FPagamentoFUNDEB;
      property GeraDIRF        : Boolean read FGeraDIRF write FGeraDIRF;
      property GeraGFIP        : Boolean read FGeraGFIP write FGeraGFIP;

      constructor Create;
      destructor Destroy;
  end;

Type
  TUnidadeLotacao = class(TGenerico)
    private
      FTipo   : TGenerico;
      FLocalidade : TLocalidade;
      FRegiao : TGenerico;
    public
      procedure CarregarDados; override;

      property Tipo : TGenerico read FTipo write FTipo;
      property Localidade : TLocalidade read FLocalidade write FLocalidade;
      property Regiao : TGenerico read FRegiao write FRegiao;

      constructor Create;
      destructor Destroy;
  end;

Type
  TEstadoFuncional = class(TGenerico)
    private
      FEmAtividade    ,
      FIniciaServidor ,
      FCalculaSalario : Boolean;
      FTipoMovimento  : String;
      FAfastamentoPrevidencia  ,
      FRetornoPrevidencia      : TGenerico;
      FMovimentoDefinitivo      ,
      FPagtoEntidadePrevidencia : Boolean;
    public
      property EmAtividade    : Boolean read FEmAtividade write FEmAtividade;
      property IniciaServidor : Boolean read FIniciaServidor write FIniciaServidor;
      property CalculaSalario : Boolean read FCalculaSalario write FCalculaSalario;
      property TipoMovimento  : String read FTipoMovimento write FTipoMovimento;
      property AfastamentoPrevidencia   : TGenerico read FAfastamentoPrevidencia write FAfastamentoPrevidencia;
      property RetornoPrevidencia       : TGenerico read FRetornoPrevidencia write FRetornoPrevidencia;
      property MovimentoDefinitivo      : Boolean read FMovimentoDefinitivo write FMovimentoDefinitivo;
      property PagtoEntidadePrevidencia : Boolean read FPagtoEntidadePrevidencia write FPagtoEntidadePrevidencia;

      constructor Create;
      destructor Destroy;
  end;

Type
  TEvento = class(TGenerico)
    private
      FCodigoRubrica,
      FTipo         : String;
      FFormaCalculo : TFormaCalculo;
      FCategoria    ,
      FCategoriaTCM : TGenerico;
      FPercentualHoraExtra : Currency;
      FHRSobreHoraNormal   : String;
      FTipoBaseCalculo     : TTipoBaseCalculo;
      FIndiceSalarioFamilia,
      FIndiceATS           ,
      FIndiceFerias        ,
      FIndiceDecimoTerceiro,
      FIndiceFalta      ,
      FIndicePrevidencia,
      FIndiceIRRF       ,
      FIndiceOutraBC1   ,
      FIndiceOutraBC2   ,
      FIndiceOutraBC3   : Boolean;
      FValorFixo  ,
      FDivisor    ,
      FSubDivisor ,
      FMax_x_vencimentoBase : Currency;
      FGeraRAIS             ,
      FCopiaMesAnterior     ,
      FPermiteUsuarioAlterar,
      FSemUso               : Boolean;
      FSubElementoDespesa : String;
      FContaCorrente      : String;
      FBCMargemConsignada : Boolean;
      FValorBCFixa : Currency;
      FNatureza    : TTipoNaturezaEvento;
      FRemuneracao : String;
    public
      procedure CarregarDados; override;
      procedure CarregarDados_v2(aIdentificador_OLD : Integer); overload;
      procedure CarregarDados_v2(aIdentificador_OLD : TEventoIDList); overload;

      property CodigoRubrica : String read FCodigoRubrica write FCodigoRubrica;
      property Tipo          : String read FTipo write FTipo;
      property FormaCalculo  : TFormaCalculo read FFormaCalculo write FFormaCalculo;
      property Categoria     : TGenerico read FCategoria write FCategoria;
      property CategoriaTCM  : TGenerico read FCategoriaTCM write FCategoriaTCM;
      property PercentualHoraExtra  : Currency read FPercentualHoraExtra write FPercentualHoraExtra;
      property HRSobreHoraNormal    : String read FHRSobreHoraNormal write FHRSobreHoraNormal;
      property TipoBaseCalculo      : TTipoBaseCalculo read FTipoBaseCalculo write FTipoBaseCalculo;
      property IndiceSalarioFamilia : Boolean read FIndiceSalarioFamilia write FIndiceSalarioFamilia;
      property IndiceATS            : Boolean read FIndiceATS write FIndiceATS;
      property IndiceFerias         : Boolean read FIndiceFerias write FIndiceFerias;
      property IndiceDecimoTerceiro : Boolean read FIndiceDecimoTerceiro write FIndiceDecimoTerceiro;
      property IndiceFalta       : Boolean read FIndiceFalta write FIndiceFalta;
      property IndicePrevidencia : Boolean read FIndicePrevidencia write FIndicePrevidencia;
      property IndiceIRRF        : Boolean read FIndiceIRRF write FIndiceIRRF;
      property IndiceOutraBC1    : Boolean read FIndiceOutraBC1 write FIndiceOutraBC1;
      property IndiceOutraBC2    : Boolean read FIndiceOutraBC2 write FIndiceOutraBC2;
      property IndiceOutraBC3    : Boolean read FIndiceOutraBC3 write FIndiceOutraBC3;
      property ValorFixo  : Currency read FValorFixo write FValorFixo;
      property Divisor    : Currency read FDivisor write FDivisor;
      property SubDivisor : Currency read FSubDivisor write FSubDivisor;
      property Max_x_vencimentoBase  : Currency read FMax_x_vencimentoBase write FMax_x_vencimentoBase;
      property GeraRAIS              : Boolean read FGeraRAIS write FGeraRAIS;
      property CopiaMesAnterior      : Boolean read FCopiaMesAnterior write FCopiaMesAnterior;
      property PermiteUsuarioAlterar : Boolean read FPermiteUsuarioAlterar write FPermiteUsuarioAlterar;
      property CodigoItem : String read FCodigoRubrica write FCodigoRubrica;
      property SemUso               : Boolean read FSemUso write FSemUso;
      property SubElementoDespesa : String read FSubElementoDespesa write FSubElementoDespesa;
      property ContaCorrente      : String read FContaCorrente write FContaCorrente;
      property BCMargemConsignada : Boolean read FBCMargemConsignada write FBCMargemConsignada;
      property ValorBCFixa : Currency read FValorBCFixa write FValorBCFixa;
      property Natureza    : TTipoNaturezaEvento read FNatureza write FNatureza;
      property Remuneracao : String read FRemuneracao write FRemuneracao;
      property Legalidade  : String read GetDescricao;

      constructor Create;
      destructor Destroy;
  end;

Type
  TNaturalidade = class(TGenerico)
    private
      FUF : String;
    public
      property Cidade : String read GetDescricao write SetDescricao;
      property UF     : String read FUF write FUF;

      constructor Create;
      destructor Destroy;
  end;

Type
  TCartorio = class(TGenerico)
    private
      FCidade,
      FUF    : String;
    public
      property Nome   : String read GetDescricao write SetDescricao;
      property Cidade : String read FCidade write FCidade;
      property UF     : String read FUF write FUF;

      constructor Create;
      destructor Destroy;
  end;

Type
  TRegistroCartorio = class(TCartorio)
    private
      FNumero,
      FLivro ,
      FFolha  : String;
    public
      property Numero : String read FNumero write FNumero;
      property Livro  : String read FLivro write FLivro;
      property Folha  : String read FFolha write FFolha;

      constructor Create;
      destructor Destroy;
  end;

Type
  TEndereco = class(TGenerico)
    private
      FNumero ,
      FBairro ,
      FCidade ,
      FCep    ,
      FUF     ,
      FComplemento : String;
    public
      property Logradouro : String read GetDescricao write SetDescricao;
      property Numero     : String read FNumero write FNumero;
      property Bairro : String read FBairro write FBairro;
      property Cidade : String read FCidade write FCidade;
      property Cep    : String read FCep write FCep;
      property UF     : String read FUF write FUF;
      property Complemento : String read FComplemento write FComplemento;

      constructor Create;
      destructor Destroy;
  end;

Type
  TPessoa = class(TGenerico)
    private
      FApelido : String;
      FDataNascimento : TDateTime;
      FCPF_CNPJ       : TDocumentoGenerico;
      FEndereco       : TEndereco;
      FEmail          ,
      FTelefone       : String;
      FNaturalidade   : TNaturalidade;
      FNacionalidade  : TGenerico;

      FAtiva : Boolean;
    public
      property Nome    : String read GetDescricao write SetDescricao;
      property Apelido : String read FApelido write FApelido;
      property DataNascimento : TDateTime read FDataNascimento write FDataNascimento;
      property CPF_CNPJ       : TDocumentoGenerico read FCPF_CNPJ write FCPF_CNPJ;
      property Endereco       : TEndereco read FEndereco write FEndereco;
      property Email          : String read FEmail write FEmail;
      property Telefone       : String read FTelefone write FTelefone;
      property Naturalidade   : TNaturalidade read FNaturalidade write FNaturalidade;
      property Nacionalidade  : TGenerico read FNacionalidade write FNacionalidade;
      property Ativa : Boolean read FAtiva write FAtiva;

      constructor Create;
      destructor Destroy;
  end;

Type
  TPessoaFisica = class(TPessoa)
    private
      FSexo   : TSexo;
      FRaca   : TGenerico;
      FRG     : TDocumentoRG;
      FCNH    : TDocumentoCNH;
      FTitulo : TDocumentoTituloEleitor;
      FPisPasep    : TDocumentoGenerico;
      FReservista  : TDocumentoGenerico;
      FEstadoCivil : TGenerico;
      FConjuge     : TPessoa;
      FNomePai ,
      FNomeMae : String;
      FAnoChegadaAoBrasil : Integer;
      procedure SetSexo(Value : String);
      function GetSexo : String;
    public
      property SexoSigla : String read GetSexo write SetSexo;
      property Sexo : TSexo read FSexo write FSexo;
      property Raca : TGenerico read FRaca write FRaca;
      property RG     : TDocumentoRG read FRG write FRG;
      property CNH    : TDocumentoCNH read FCNH write FCNH;
      property Titulo : TDocumentoTituloEleitor read FTitulo write FTitulo;
      property PisPasep    : TDocumentoGenerico read FPisPasep write FPisPasep;
      property Reservista  : TDocumentoGenerico read FReservista write FReservista;
      property EstadoCivil : TGenerico read FEstadoCivil write FEstadoCivil;
      property Conjuge     : TPessoa read FConjuge write FConjuge;
      property NomePai : String read FNomePai write FNomePai;
      property NomeMae : String read FNomeMae write FNomeMae;
      property AnoChegadaAoBrasil : Integer read FAnoChegadaAoBrasil write FAnoChegadaAoBrasil;

      constructor Create;
      destructor Destroy;
  end;

Type
  TServidor = class(TPessoaFisica)
    private
      FIDServidor : Integer;
      FMatricula  : String;
      FEfetivo    : Boolean;
      FDataConcurso   ,
      FDataAdmissao   ,
      FDataReadmissao : TDateTime;
      FDocumentoAdmissao  : String;
      FAnoPrimeiroEmprego : String;
      FSituacaoTCM : TGenerico;
      FSubUnidadeOrcamentaria : TSubUnidadeOrcamentaria;
      FUnidadeLotacao         : TUnidadeLotacao;
      FDepartamento : TGenerico;
      FCargoOrigem ,
      FCargoAtual  : TCargoFuncao;
      FReferenciaSalario : Integer;
      FVencimentoBase    : Currency;
      FEscolaridade : TGenerico;
      FFormacao         ,
      FConselhoRegistro : String;
      FCargaHorariaMensal       ,
      FQuantidadeDependenteIRRF : Integer;
      FCalculaVencimentoBase   ,
      FBloqueaLanctoEventoAuto ,
      FCalculaPrevidencia      ,
      FCalculaIRRF             : Boolean;
      FEstadoFuncional : TEstadoFuncional;
      FStatus : TStatusServidor;
      FNaoCalculaATS             ,
      FCalculaSalarioCargoOrigem : Boolean;
      FReferenciaSalarioInicial  : Integer;
      FDataBaseCalculoATS : TDateTime;
      FDesvioFuncao : Boolean;
      FCategoriaSEFIP  ,
      FOcorrenciaSEFIP : String;
    public
      procedure CarregarDados; override;

      property IDServidor : Integer read FIDServidor write FIDServidor;
      property Matricula  : String read FMatricula write FMatricula;
      property Efetivo    : Boolean read FEfetivo write FEfetivo;
      property DataConcurso   : TDateTime read FDataConcurso write FDataConcurso;
      property DataAdmissao   : TDateTime read FDataAdmissao write FDataAdmissao;
      property DataReadmissao : TDateTime read FDataReadmissao write FDataReadmissao;
      property DocumentoAdmissao  : String read FDocumentoAdmissao write FDocumentoAdmissao;
      property AnoPrimeiroEmprego : String read FAnoPrimeiroEmprego write FAnoPrimeiroEmprego;
      property SituacaoTCM : TGenerico read FSituacaoTCM write FSituacaoTCM;
      property SubUnidadeOrcamentaria : TSubUnidadeOrcamentaria read FSubUnidadeOrcamentaria write FSubUnidadeOrcamentaria;
      property UnidadeLotacao         : TUnidadeLotacao read FUnidadeLotacao write FUnidadeLotacao;
      property Departamento : TGenerico read FDepartamento write FDepartamento;
      property CargoOrigem  : TCargoFuncao read FCargoOrigem write FCargoOrigem;
      property CargoAtual   : TCargoFuncao read FCargoAtual write FCargoAtual;
      property ReferenciaSalario : Integer read FReferenciaSalario write FReferenciaSalario;
      property VencimentoBase    : Currency read FVencimentoBase write FVencimentoBase;
      property Escolaridade      : TGenerico read FEscolaridade write FEscolaridade;
      property Formacao          : String read FFormacao write FFormacao;
      property ConselhoRegistro  : String read FConselhoRegistro write FConselhoRegistro;
      property CargaHorariaMensal       : Integer read FCargaHorariaMensal write FCargaHorariaMensal;
      property QuantidadeDependenteIRRF : Integer read FQuantidadeDependenteIRRF write FQuantidadeDependenteIRRF;
      property CalculaVencimentoBase    : Boolean read FCalculaVencimentoBase write FCalculaVencimentoBase;
      property BloqueaLanctoEventoAuto  : Boolean read FBloqueaLanctoEventoAuto write FBloqueaLanctoEventoAuto;
      property CalculaPrevidencia       : Boolean read FCalculaPrevidencia write FCalculaPrevidencia;
      property CalculaIRRF              : Boolean read FCalculaIRRF write FCalculaIRRF;
      property EstadoFuncional : TEstadoFuncional read FEstadoFuncional write FEstadoFuncional;
      property Status : TStatusServidor read FStatus write FStatus;
      property NaoCalculaATS             : Boolean read FNaoCalculaATS write FNaoCalculaATS;
      property CalculaSalarioCargoOrigem : Boolean read FCalculaSalarioCargoOrigem write FCalculaSalarioCargoOrigem;
      property ReferenciaSalarioInicial  : Integer read FReferenciaSalarioInicial write FReferenciaSalarioInicial;
      property DataBaseCalculoATS : TDateTime read FDataBaseCalculoATS write FDataBaseCalculoATS;
      property DesvioFuncao    : Boolean read FDesvioFuncao write FDesvioFuncao;
      property CategoriaSEFIP  : String read FCategoriaSEFIP write FCategoriaSEFIP;
      property OcorrenciaSEFIP : String read FOcorrenciaSEFIP write FOcorrenciaSEFIP;

      constructor Create;
      destructor Destroy;
  end;

Type
  TEventoFixoServidor = class(TGenerico)
    private
      FServidor   : TServidor;
      FEvento     : TEvento;
      FQuantidade ,
      FValor      : Currency;
      FObservacao     ,
      FValidadeInicial,
      FValidadeFinal  : String;
      FCalcularDecimoTerc,
      FParticipa         : Boolean;
    public
      property Servidor   : TServidor read FServidor write FServidor;
      property Evento     : TEvento read FEvento write FEvento;
      property Quantidade : Currency read FQuantidade write FQuantidade;
      property Valor      : Currency read FValor write FValor;
      property Observacao      : String read FObservacao write FObservacao;
      property ValidadeInicial : String read FValidadeInicial write FValidadeInicial;
      property ValidadeFinal   : String read FValidadeFinal write FValidadeFinal;
      property CalcularDecimoTerc : Boolean read FCalcularDecimoTerc write FCalcularDecimoTerc;
      property Participa          : Boolean read FParticipa write FParticipa;

      constructor Create;
      destructor Destroy;
  end;

Type
  TDependente = class(TPessoaFisica)
    private
      FServidor   : TServidor;
      FParentesco : TParentesco;
      FRegistroCartorio   : TRegistroCartorio;
      FEstudante          ,
      FDeficiente         ,
      FAtivoSalarioFamilia,
      FAtivoIRRF          : Boolean;
      FPercentualPensaoAliment,
      FValorPensaoAliment     : Currency;
    public
      property Servidor   : TServidor read FServidor write FServidor;
      property Parentesco : TParentesco read FParentesco write FParentesco;
      property RegistroCartorio    : TRegistroCartorio read FRegistroCartorio write FRegistroCartorio;
      property Estudante           : Boolean  read FEstudante write FEstudante;
      property Deficiente          : Boolean  read FDeficiente write FDeficiente;
      property AtivoSalarioFamilia : Boolean  read FAtivoSalarioFamilia write FAtivoSalarioFamilia;
      property AtivoIRRF           : Boolean read FAtivoIRRF write FAtivoIRRF;
      property PercentualPensaoAliment : Currency read FPercentualPensaoAliment write FPercentualPensaoAliment;
      property ValorPensaoAliment      : Currency read FValorPensaoAliment write FValorPensaoAliment;

      constructor Create;
      destructor Destroy;
  end;

Type
  TEntidadeFinanceira = class(TGenerico)
    private
      FEBanco : Boolean;
      FBanco  : TGenerico;
      FAgencia       ,
      FNumeroConta   ,
      FNumeroConvenio,
      FCodigoEmpresa ,
      FCNPJ          : String;
    public
      property EBanco : Boolean read FEBanco write FEBanco;
      property Banco  : TGenerico read FBanco write FBanco;
      property Agencia        : String read FAgencia write FAgencia;
      property NumeroConta    : String read FNumeroConta write FNumeroConta;
      property NumeroConvenio : String read FNumeroConvenio write FNumeroConvenio;
      property CodigoEmpresa  : String read FCodigoEmpresa write FCodigoEmpresa;
      property CNPJ           : String read FCNPJ write FCNPJ;

      constructor Create;
      destructor Destroy;
  end;

Type
  TContaBancoServidor = class(TEntidadeFinanceira)
    private
      FIDConta   : Integer;
      FServidor  : TServidor;
      FTipoConta : TTipoConta;
    public
      property IDConta   : Integer read FIDConta write FIDConta;
      property Servidor  : TServidor read FServidor write FServidor;
      property TipoConta : TTipoConta read FTipoConta write FTipoConta;

      constructor Create;
      destructor Destroy;
  end;

Type
  TProgressoSalarial = class(TGenerico)
    private
      FCargo : TCargoFuncao;
      FValor : Currency;
    public
      property Cargo : TCargoFuncao read FCargo write FCargo;
      property Valor : Currency read FValor write FValor;

      constructor Create;
      destructor Destroy;
  end;

Type
  TInicializaMesServidor = class(TGenerico)
    private
      FAnoMes    : String;
      FServidor  : TServidor;
      FRubrica   : String;
      FCargoFuncao2    : TCargoFuncao;
      FDiasTrabalhados : Integer;
      FDataMovimento1  : TDateTime;
      FTipoMovimento1  : TTipoMovimento;
      FDataMovimento2  : TDateTime;
      FTipoMovimento2  : TTipoMovimento;
      FTempoServico    : String;
      FProgressoSalarial : TProgressoSalarial;
      FQuantidadeDependenteSalFamilia   ,
      FQuantidadeDependentePAlimentacao : Integer;
      FTempoServicoATS : String;
      FDataPrimeiraAdmissao : TDateTime;

      procedure SetCalculaVencimentoBase(Value : Boolean);
      procedure SetVencimentoBase(Value : Currency);
      procedure SetTipoSalario(Value : TTipoSalario);
      procedure SetCargoFuncao(Value : TCargoFuncao);
      procedure SetFormaCalculo(Value : TFormaCalculo);
      procedure SetBaseCalculoHoraAula(Value : Integer);

      function GetSubUnidadeOrcamentaria : TSubUnidadeOrcamentaria;
      function GetCargoFuncao     : TCargoFuncao;
      function GetDataAdimissao   : TDateTime;
      function GetUnidadeLocacao  : TUnidadeLotacao;
      function GetDepartamento    : TGenerico;
      function GetEfetivo         : Boolean;
      function GetSituacaoTCM     : TGenerico;
      function GetEstadoFuncional : TEstadoFuncional;
      function GetCalculaPrevidencia : Boolean;
      function GetCalculaIRRF        : Boolean;
      function GetCalculaVencimentoBase : Boolean;
      function GetBloqueaLanctoEventoAuto  : Boolean;
      function GetQuantidadeDependenteIRRF : Integer;
      function GetCargaHorariaMensal : Integer;
      function GetVencimentoBase : Currency;
      function GetTipoSalario  : TTipoSalario;
      function GetFormaCalculo : TFormaCalculo;
      function GetBaseCalculoHoraAula : Integer;
      function GetCalculaATSVencimentoBase : Boolean;
      function GetNaoCalculaATS : Boolean;
      function GetDataBaseCalculoATS : TDateTime;
      function GetDesvioFuncao    : Boolean;
      function GetCategoriaSEFIP  : String;
      function GetOcorrenciaSEFIP : String;
    public
      procedure CarregarDados; override;

      property AnoMes : String read FAnoMes write FAnoMes;
      property Servidor : TServidor read FServidor write FServidor;
      property Rubrica  : String read FRubrica write FRubrica;
      property SubUnidadeOrcamento : TSubUnidadeOrcamentaria read GetSubUnidadeOrcamentaria;
      property CargoFuncao     : TCargoFuncao read GetCargoFuncao write SetCargoFuncao;
      property CargoFuncao2    : TCargoFuncao read FCargoFuncao2 write FCargoFuncao2;
      property DataAdimissao   : TDateTime read GetDataAdimissao;
      property UnidadeLocacao  : TUnidadeLotacao read GetUnidadeLocacao;
      property Departamento    : TGenerico read GetDepartamento;
      property Efetivo         : Boolean read GetEfetivo;
      property SituacaoTCM     : TGenerico read GetSituacaoTCM;
      property EstadoFuncional : TEstadoFuncional read GetEstadoFuncional;
      property DiasTrabalhados : Integer read FDiasTrabalhados write FDiasTrabalhados;
      property DataMovimento1  : TDateTime read FDataMovimento1 write FDataMovimento1;
      property TipoMovimento1  : TTipoMovimento read FTipoMovimento1 write FTipoMovimento1;
      property DataMovimento2  : TDateTime read FDataMovimento2 write FDataMovimento2;
      property TipoMovimento2  : TTipoMovimento read FTipoMovimento2 write FTipoMovimento2;
      property CalculaPrevidencia      : Boolean read GetCalculaPrevidencia;
      property CalculaIRRF             : Boolean read GetCalculaIRRF;
      property CalculaVencimentoBase   : Boolean read GetCalculaVencimentoBase write SetCalculaVencimentoBase;
      property BloqueaLanctoEventoAuto : Boolean read GetBloqueaLanctoEventoAuto;
      property TempoServico      : String read FTempoServico write FTempoServico;
      property ProgressoSalarial : TProgressoSalarial read FProgressoSalarial write FProgressoSalarial;
      property QuantidadeDependenteSalFamilia   : Integer read FQuantidadeDependenteSalFamilia write FQuantidadeDependenteSalFamilia;
      property QuantidadeDependentePAlimentacao : Integer read FQuantidadeDependentePAlimentacao write FQuantidadeDependentePAlimentacao;
      property QuantidadeDependenteIRRF         : Integer read GetQuantidadeDependenteIRRF;
      property CargaHorariaMensal  : Integer read GetCargaHorariaMensal;
      property VencimentoBaseCargo : Currency read GetVencimentoBase write SetVencimentoBase;
      property TipoSalario    : TTipoSalario read GetTipoSalario write SetTipoSalario;
      property FormaCalculo   : TFormaCalculo read GetFormaCalculo write SetFormaCalculo;
      property BaseCalculoHoraAula : Integer read GetBaseCalculoHoraAula write SetBaseCalculoHoraAula;
      property CalculaATSVencimentoBase : Boolean read GetCalculaATSVencimentoBase;
      property DataBaseCalculoATS : TDateTime read GetDataBaseCalculoATS;
      property TempoServicoATS : String read FTempoServicoATS write FTempoServicoATS;
      property DesvioFuncao    : Boolean read GetDesvioFuncao;
      property CategoriaSEFIP  : String read GetCategoriaSEFIP;
      property OcorrenciaSEFIP : String read GetOcorrenciaSEFIP;
      property DataPrimeiraAdmissao : TDateTime read FDataPrimeiraAdmissao write FDataPrimeiraAdmissao;

      constructor Create;
      destructor Destroy;
  end;

type
  TBaseCalculoMesServidor = class(TGenerico)
    private
      FInicializaMes : TInicializaMesServidor;
      FParcela       : String;
      FCargaHorariaFaltaProfessor : Integer;
      FBaseCalculoSalarioFamilia,
      FBaseCalculoATS   ,
      FBaseCalculoFerias,
      FBaseCalculoDecTerceito,
      FBaseCalculoFalta      ,
      FBaseCalculoPrevidencia,
      FBaseCalculoIRRF  ,
      FBaseCalculoOutra1,
      FBaseCalculoOutra2,
      FBaseCalculoOutra3,
      FTotalVencimento  ,
      FTotalDesconto    ,
      FSalarioLiquido   : Currency;
      FDataPagamento    : TDateTime;
    public
      property InicializaMes : TInicializaMesServidor read FInicializaMes write FInicializaMes;
      property Parcela       : String read FParcela write FParcela;
      property CHFaltaProfessor : Integer read FCargaHorariaFaltaProfessor write FCargaHorariaFaltaProfessor;
      property BaseCalculoSalarioFamilia : Currency read FBaseCalculoSalarioFamilia write FBaseCalculoSalarioFamilia;
      property BaseCalculoATS      : Currency read FBaseCalculoATS write FBaseCalculoATS;
      property BaseCalculoFerias   : Currency read FBaseCalculoFerias write FBaseCalculoFerias;
      property BaseCalculoDecTerceito : Currency read FBaseCalculoDecTerceito write FBaseCalculoDecTerceito;
      property BaseCalculoFalta       : Currency read FBaseCalculoFalta write FBaseCalculoFalta;
      property BaseCalculoPrevidencia : Currency read FBaseCalculoPrevidencia write FBaseCalculoPrevidencia;
      property BaseCalculoIRRF   : Currency read FBaseCalculoIRRF write FBaseCalculoIRRF;
      property BaseCalculoOutra1 : Currency read FBaseCalculoOutra1 write FBaseCalculoOutra1;
      property BaseCalculoOutra2 : Currency read FBaseCalculoOutra2 write FBaseCalculoOutra2;
      property BaseCalculoOutra3 : Currency read FBaseCalculoOutra3 write FBaseCalculoOutra3;
      property TotalVencimento : Currency read FTotalVencimento write FTotalVencimento;
      property TotalDesconto   : Currency read FTotalDesconto write FTotalDesconto;
      property SalarioLiquido  : Currency read FSalarioLiquido write FSalarioLiquido;
      property DataPagamento   : TDateTime read FDataPagamento write FDataPagamento;

      constructor Create;
      destructor Destroy;
  end;

type
  TEventoBaseCalculoMesServidor = class(TGenerico)
    private
      FBaseCalculoMesServidor : TBaseCalculoMesServidor;
      FEventoBaseCalculo      : TEvento;
      FQuantidade ,
      FValor      : Currency;
      FObservacao : String;
      function GetEventoID : Integer;
    public
      property BaseCalculoMesServidor : TBaseCalculoMesServidor read FBaseCalculoMesServidor write FBaseCalculoMesServidor;
      property EventoBaseCalculo      : TEvento read FEventoBaseCalculo write FEventoBaseCalculo;
      property EventoID : Integer read GetEventoID;
      property Quantidade : Currency read FQuantidade write FQuantidade;
      property Valor      : Currency read FValor write FValor;
      property Observacao : String read FObservacao write FObservacao;

      constructor Create;
      destructor Destroy;
  end;

type
  TdmConexaoTargetDB = class(TDataModule)
    fdTargetDB: TFDConnection;
    fdTransDB: TFDTransaction;
    fbPhysFBDriverLinkDB: TFDPhysFBDriverLink;
    fdGUIxWaitCursorDB: TFDGUIxWaitCursor;
    qryCBO: TFDQuery;
    updCBO: TFDUpdateSQL;
    qryBusca: TFDQuery;
    qryEscolaridade: TFDQuery;
    updEscolaridade: TFDUpdateSQL;
    qryCargoFuncao: TFDQuery;
    updCargoFuncao: TFDUpdateSQL;
    qryUnidadeGestora: TFDQuery;
    updUnidadeGestora: TFDUpdateSQL;
    qryUnidadeLotacao: TFDQuery;
    updUnidadeLotacao: TFDUpdateSQL;
    qryUnidadeOrcamentaria: TFDQuery;
    updUnidadeOrcamentaria: TFDUpdateSQL;
    qryEstadoFuncional: TFDQuery;
    updEstadoFuncional: TFDUpdateSQL;
    qrySetor: TFDQuery;
    updSetor: TFDUpdateSQL;
    qrySituacaoTCM: TFDQuery;
    updSituacaoTCM: TFDUpdateSQL;
    qryEvento: TFDQuery;
    updEvento: TFDUpdateSQL;
    qryCategoriaEvento: TFDQuery;
    updCategoriaEvento: TFDUpdateSQL;
    qryPessoaFisica: TFDQuery;
    updPessoaFisica: TFDUpdateSQL;
    qryNacionalidade: TFDQuery;
    updNacionalidade: TFDUpdateSQL;
    qryEstadoCivil: TFDQuery;
    updEstadoCivil: TFDUpdateSQL;
    qryCategoriaFuncional: TFDQuery;
    updCategoriaFuncional: TFDUpdateSQL;
    qryTipoCargoTCM: TFDQuery;
    updTipoCargoTCM: TFDUpdateSQL;
    fdGUIxError: TFDGUIxErrorDialog;
    qryFatorProgramaSalario: TFDQuery;
    updFatorProgramaSalario: TFDUpdateSQL;
    qryEntidadeFinanceira: TFDQuery;
    updEntidadeFinanceira: TFDUpdateSQL;
    qryServidor: TFDQuery;
    updServidor: TFDUpdateSQL;
    qryDepartamento: TFDQuery;
    updDepartamento: TFDUpdateSQL;
    qrySubUnidadeGest: TFDQuery;
    updSubUnidadeGest: TFDUpdateSQL;
    qryServidorConta: TFDQuery;
    updServidorConta: TFDUpdateSQL;
    qryServidorDependente: TFDQuery;
    updServidorDependente: TFDUpdateSQL;
    updInicializaMesServidor: TFDUpdateSQL;
    qryInicializaMesServidor: TFDQuery;
    updBaseCalculoMesServidor: TFDUpdateSQL;
    qryBaseCalculoMesServidor: TFDQuery;
    updEventoBCMesServidor: TFDUpdateSQL;
    qryEventoBCMesServidor: TFDQuery;
    qryPessoaDependente: TFDQuery;
    updPessoaDependente: TFDUpdateSQL;
    updServidorEventoFixo: TFDUpdateSQL;
    qryServidorEventoFixo: TFDQuery;
    procedure qryError(ASender: TObject;
      const AInitiator: IFDStanObject; var AException: Exception);  private
    { Private declarations }
  private
    function GetExistemCamposNulos(const aDataSet : TDataSet; var aCampos : TStringList) : Boolean;
  public
    { Public declarations }
    procedure CriarCampoTabela(const pTabela, pCampo, pTipo : String);
    procedure ExcluirCampoTabela(const pTabela, pCampo : String);
    procedure GetID(const pTabela, pCampo, pWhere : String; var aRetorno : TGenerico);
    procedure ExecutarStriptDB(const pSQL : TStringList); overload;
    procedure ExecutarStriptDB(const pSQL : String); overload;
    procedure UpdateGenerator(const pGeneretorName, pTableName, pKeyField : String);
    procedure CreateDomains;
    procedure ReplicarLancaEvento(const aCompetencia : TGenerico);

    function ConectarTargetDB : Boolean;
    function NewID(pTabela, pCampo : String) : Integer;
    function GetValue(const pTabela, pCampo, pWhere : String) : Integer;
    function ObjectID(const pTabela, pCampoID, pCampoCodigo, pCampoDescricao, pCampoAtivo, pWhere : String) : TGenerico;
    function ExisteCampoTabela(const pTabela, pCampo : String) : Boolean;

    function InserirCBO(var pCBO : TCBO) : Boolean;
    function InserirEscolaridade(var pEscolaridade : TGenerico) : Boolean;
    function InserirCategoriaFuncional(const pCategoriaFuncional : TGenerico) : Boolean;
    function InserirCargoTCM(const pTipoCargoTCM : TGenerico) : Boolean;
    function InserirFatorProgramaSalario(const pFatorProgramaSalario : TFatorProgramaSalario) : Boolean;
    function InserirCargoFuncao(const pCargoFuncao : TCargoFuncao) : Boolean;
    function InserirUnidadeGestora(var pUnidadeGestora : TUnidadeGestora) : Boolean;
    function InserirUnidadeOrcament(var pUnidadeOrcament : TUnidadeOrcamentaria) : Boolean;
    function InserirSubUnidadeOrcament(var pSubUnidadeOrcament : TSubUnidadeOrcamentaria) : Boolean;
    function InserirUnidadeLotacao(var pUnidadeLotacao : TUnidadeLotacao) : Boolean;
    function InserirEstadoFuncional(var pEstadoFuncional : TEstadoFuncional) : Boolean;
    function InserirSituacaoTCM(var pSituacaoTCM : TGenerico) : Boolean;
    function InserirCategoria(const pCategoria : TGenerico) : Boolean;
    function InserirSetor(var pSetor : TGenerico) : Boolean;
    function InserirDepartamento(var pDepartamento : TGenerico) : Boolean;
    function InserirEvento(var pEvento : TEvento) : Boolean;
    function InserirEstadoCivil(const pEstadoCivil : TGenerico) : Boolean;
    function InserirNacionalidade(const pNacionalidade : TGenerico) : Boolean;
    function InserirPessoaFisica(const pPessoaFisica : TPessoaFisica) : Boolean;
    function InserirServidor(const pServidor : TServidor) : Boolean;
    function InserirServidorEventoFixo(const pServidorEvento : TEventoFixoServidor) : Boolean;
    function InserirEntidadeFinanceira(const pEntidadeFinanceira : TEntidadeFinanceira) : Boolean;
    function InserirContaBancoServidor(const pConta : TContaBancoServidor) : Boolean;
    function InserirDependente(const pDependente : TDependente) : Boolean;
    function InserirInicializaMesServidor(const pInicializaMesServidor : TInicializaMesServidor) : Boolean;
    function InserirBaseCalculoMesServidor(const pBaseCalculoMesServidor : TBaseCalculoMesServidor) : Boolean;
    function InserirEventoBCMesServidor(const pEventoBCMesServidor : TEventoBaseCalculoMesServidor) : Boolean;
  end;

var
  dmConexaoTargetDB: TdmConexaoTargetDB;

const
  ID_SYS_ANTER      = 'ID_SYS_ANTER';
  ID_SYS_ANTER_TYPE = 'VARCHAR(15)';

  SEXO_PESSOA : TSexoLista = (
        'M'
      , 'F'
    );

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses URecursos;

{$R *.dfm}

{ TdmConexaoTargetDB }

function TdmConexaoTargetDB.ConectarTargetDB : Boolean;
begin
  try
    try
      with fdTargetDB do
      begin
        Connected := False;

        Params.Clear;
        Params.Add('DriverID=FB');
        Params.Add('Protocol=TCPIP');
        Params.Add('Server='    + gConfiguracao.ReadString('TargetDB', 'Server', 'localhost'));
        Params.Add('Port='      + gConfiguracao.ReadString('TargetDB', 'Port', '3050'));
        Params.Add('Database='  + gConfiguracao.ReadString('TargetDB', 'FileName', EmptyStr));
        Params.Add('User_Name=' + gConfiguracao.ReadString('TargetDB', 'UserName', TARGET_DB_USER_NAME));
        Params.Add('Password='  + gConfiguracao.ReadString('TargetDB', 'Password', TARGET_DB_PASSWORD));
        Params.Add('CharacterSet=WIN1252');

        Connected := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar conectar com a base de destino dos dados.' + #13#13 + E.Message);
    end;
  finally
    Result := fdTargetDB.Connected;
  end;
end;

procedure TdmConexaoTargetDB.CreateDomains;
begin
  try
    fdTargetDB.ExecSQL('CREATE DOMAIN DMN_SYS_ANTER AS VARCHAR(15)');
    fdTargetDB.CommitRetaining;
  except
  end;
end;

procedure TdmConexaoTargetDB.ReplicarLancaEvento(const aCompetencia : TGenerico);
var
  aSQL : TStringList;
begin
(*
Insert Into LANCTO_EVENTO (
    ANO_MES
  , PARCELA
  , ID_SERVIDOR
  , ID_EVENTO
  , QTD
  , VALOR
  , OBSERVACAO
  , PARTICIPA
)
Select
    c.ano_mes
  , c.parcela
  , c.id_servidor
  , c.id_evento
  , c.qtd
  , c.valor
  , c.observacao
  , 'S' as participa
from LANCTO_EVENTO_CALC c
  left join LANCTO_EVENTO x on (x.ano_mes = c.ano_mes and x.parcela = c.parcela and x.id_servidor = c.id_servidor and x.id_evento = c.id_evento)
where c.ano_mes = '201712'
  and x.ano_mes is null

    qrySourceDB.ParamByName('ano').AsInteger := StrToInt(Copy(aCompetencia.Codigo, 3, 4));
    qrySourceDB.ParamByName('mes').AsInteger := StrToInt(Copy(aCompetencia.Codigo, 1, 2));

*)
//  aSQL := TStringList.Create;
//  try
//    aSQL.BeginUpdate;
//    aSQL.Clear;
//    aSQL.Add('');
//    aSQL.EndUpdate;
//    try
//      fdTargetDB.ExecSQL(aSQL.Text);
//      fdTargetDB.CommitRetaining;
//    except
//    end;
//  finally
//    aSQL.Free;
//  end;
end;

procedure TdmConexaoTargetDB.CriarCampoTabela(const pTabela, pCampo,
  pTipo: String);
var
  sIndice : String;
begin
  with qryBusca do
  begin
    // Verificar se campo existe
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  f.rdb$field_name as CAMPO');
    SQL.Add('from RDB$RELATION_FIELDS f');
    SQL.Add('where f.rdb$relation_name = ' + QuotedStr(AnsiUpperCase(Trim(pTabela))) );
    SQL.Add('  and f.rdb$field_name    = ' + QuotedStr(AnsiUpperCase(Trim(pCampo))) );
    OpenOrExecute;

    // Criar campo e índice, caso ele não exista
    if (FieldByName('CAMPO').AsString = EmptyStr) then
    begin
      try
        sIndice := Trim(Copy('IDX_' + Trim(pTabela) + '_' + Trim(pCampo), 1, 30));

        fdTargetDB.ExecSQL('ALTER TABLE ' + Trim(pTabela) +
          ' ADD ' + Trim(pCampo) + ' ' + Trim(pTipo));
        fdTargetDB.CommitRetaining;

        fdTargetDB.ExecSQL('CREATE INDEX ' + sIndice +
          ' ON ' + Trim(pTabela) + ' (' + Trim(pCampo) + ')');
        fdTargetDB.CommitRetaining;
      except
      end;
    end;
    Close;
  end;
end;

procedure TdmConexaoTargetDB.ExcluirCampoTabela(const pTabela, pCampo : String);
var
  aRegistros : Currency;
  sIndice    : String;
begin
  aRegistros := 0;

  with qryBusca do
  begin
    // Verificar se campo existe
    Close;
    SQL.Clear;
    SQL.Add('SELECT ');
    SQL.Add('  f.rdb$field_name as CAMPO');
    SQL.Add('from RDB$RELATION_FIELDS f');
    SQL.Add('where f.rdb$relation_name = ' + QuotedStr(AnsiUpperCase(Trim(pTabela))) );
    SQL.Add('  and f.rdb$field_name    = ' + QuotedStr(AnsiUpperCase(Trim(pCampo))) );
    OpenOrExecute;

    // Excluir campo e índice, caso eles existam
    if (FieldByName('CAMPO').AsString <> EmptyStr) then
    begin
      // Verificar se existe dados no campo a ser excluído
      with qryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT COUNT(' + pCampo +  ') as QTDE FROM ' + pTabela + ' where ' + pCampo + ' is not null');
        OpenOrExecute;

        aRegistros := FieldByName('QTDE').AsCurrency;
      end;

      if (aRegistros = 0.0) then
        try
          sIndice := Trim(Copy('IDX_' + Trim(pTabela) + '_' + Trim(pCampo), 1, 30));
          try
            fdTargetDB.ExecSQL('DROP INDEX ' + sIndice, True);
            fdTargetDB.CommitRetaining;
          except
          end;

          fdTargetDB.ExecSQL('ALTER TABLE ' + Trim(pTabela) +
            ' DROP ' + Trim(pCampo));
          fdTargetDB.CommitRetaining;
        except
        end;
    end;
    Close;
  end;
end;

procedure TdmConexaoTargetDB.ExecutarStriptDB(const pSQL: TStringList);
begin
  if (Trim(pSQL.Text) <> EmptyWideStr) then
  try
    try
      fdTargetDB.ExecSQL(pSQL.Text);
      fdTargetDB.CommitRetaining;
    except
      On E : Exception do
      begin
        if fdTargetDB.InTransaction then
          fdTargetDB.RollbackRetaining;
        MensagemErro('Erro', 'Erro ao tentar executar Script SQL :' + #13#13 + pSQL.Text + #13#13 + E.Message);
      end;
    end;
  finally
    if fdTargetDB.InTransaction then
      fdTargetDB.CommitRetaining;
  end;
end;

procedure TdmConexaoTargetDB.ExecutarStriptDB(const pSQL: String);
begin
  if (Trim(pSQL) <> EmptyWideStr) then
  try
    try
      fdTargetDB.ExecSQL(pSQL);
      fdTargetDB.CommitRetaining;
    except
      On E : Exception do
      begin
        if fdTargetDB.InTransaction then
          fdTargetDB.RollbackRetaining;
        MensagemErro('Erro', 'Erro ao tentar executar Script SQL :' + #13#13 + pSQL + #13#13 + E.Message);
      end;
    end;
  finally
    if fdTargetDB.InTransaction then
      fdTargetDB.CommitRetaining;
  end;
end;

function TdmConexaoTargetDB.GetExistemCamposNulos(const aDataSet: TDataSet;
  var aCampos: TStringList): Boolean;
var
  I : Integer;
begin
  aCampos.BeginUpdate;
  try
    aCampos.Clear;
    if Assigned(aDataSet) then
      for I := 0 to aDataSet.Fields.Count - 1 do
      begin
        if aDataSet.Fields[I].Required and aDataSet.Fields[I].IsNull then
          aCampos.Add( aDataSet.Fields[I].DisplayName + ', ' );
      end;

    if (aCampos.Count > 0) then
      aCampos.Strings[aCampos.Count - 1] := Copy(aCampos.Strings[aCampos.Count - 1], 1, Length(aCampos.Strings[aCampos.Count - 1]) - 2);
  finally
    aCampos.EndUpdate;

    Result := (aCampos.Count > 0);
  end;
end;

procedure TdmConexaoTargetDB.GetID(const pTabela, pCampo, pWhere: String;
  var aRetorno: TGenerico);
begin
  with qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ' + pCampo +  ' as ID');
    SQL.Add('FROM '   + pTabela );
    SQL.Add('WHERE '  + pWhere );
    OpenOrExecute;

    aRetorno.ID := FieldByName('ID').AsInteger;
  end;
end;

function TdmConexaoTargetDB.InserirCargoFuncao(
  const pCargoFuncao: TCargoFuncao): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryCargoFuncao do
      begin
        CriarCampoTabela('CARGO_FUNCAO', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('codigo').AsString := pCargoFuncao.Codigo;
        Open;

        if IsEmpty then
        begin
          pCargoFuncao.ID := NewID('CARGO_FUNCAO', 'ID');

          Append;
          FieldByName('id').AsInteger                  := pCargoFuncao.ID;
          FieldByName('descricao').AsString            := pCargoFuncao.Descricao;
          FieldByName('id_categ_funcional').AsInteger  := pCargoFuncao.Categoria.ID;
          if Trim(pCargoFuncao.TipoTCM.Codigo) = EmptyStr then
            FieldByName('id_tipo_cargo_tcm').AsInteger := 20
          else
            FieldByName('id_tipo_cargo_tcm').AsInteger := StrToIntDef(pCargoFuncao.TipoTCM.Codigo, 20);
          FieldByName('tipo_sal').AsString             := IntToSTr(Ord(pCargoFuncao.TipoSalario));
          FieldByName('forma_calc').AsString           := IntToSTr(Ord(pCargoFuncao.FormaCalculo));
          FieldByName('base_calc_hora_aula').AsInteger := pCargoFuncao.BaseCalculoHoraAula;
          FieldByName('carga_hor_mensal').AsInteger    := pCargoFuncao.CargaHorariaMensal;
          FieldByName('qtd_vaga').AsInteger            := pCargoFuncao.QuantidadeVaga;
          FieldByName('id_escolaridade').AsInteger     := pCargoFuncao.Escolaridade.ID;
          if pCargoFuncao.CBO.ID = 0 then
            FieldByName('id_cbo').Clear
          else
            FieldByName('id_cbo').AsInteger            := pCargoFuncao.CBO.ID;
          FieldByName('id_fat_prog_sal').AsInteger     := pCargoFuncao.FatorProgramaSalario.ID;
          FieldByName('num_ato_criacao').AsString      := pCargoFuncao.NumeroAtoCriacao;
          FieldByName('data_ato_criacao').AsDateTime   := pCargoFuncao.DataAtoCriacao;
          FieldByName('id_evento_base').AsInteger      := pCargoFuncao.EventoBase.ID;
          FieldByName('calc_ats').AsString             := IfThen(pCargoFuncao.CalculaATS, 'S', 'N');
          FieldByName('calc_ats_sobre_vencto_base').AsString := IfThen(pCargoFuncao.CalculaATSVencimentoBase, 'S', 'N');
          FieldByName('calc_dec_terc').AsString              := IfThen(pCargoFuncao.CalculaDecimoTerc, 'S', 'N');
          FieldByName('calc_contrib_sindical').AsString      := IfThen(pCargoFuncao.CalculaContribSind, 'S', 'N');
          FieldByName('situacao').Clear;
          FieldByName('dt_extinsao').Clear;
          FieldByName('observacao').AsString         := pCargoFuncao.Observacao;
          FieldByName('tempo_ats').AsInteger         := pCargoFuncao.TempoATS;
          FieldByName('percent_ats').AsCurrency      := pCargoFuncao.PercentualATS;
          FieldByName('sal_min_automatico').AsString := IfThen(pCargoFuncao.SalarioMinimoAutomat, 'S', 'N');
        end
        else
          Edit;

        FieldByName('vencto_base').AsCurrency := pCargoFuncao.VencimentoBase;
        FieldByName(ID_SYS_ANTER).AsString    := pCargoFuncao.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Cargo/Função.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirCargoTCM(
  const pTipoCargoTCM: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryTipoCargoTCM do
      begin
        Close;
        ParamByName('id').AsInteger := pTipoCargoTCM.ID;
        Open;
        if IsEmpty then
        begin
          Append;
          FieldByName('id').AsInteger       := pTipoCargoTCM.ID;
          FieldByName('descricao').AsString := pTipoCargoTCM.Descricao;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Tipo de Cargo TCM.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirCategoria(
  const pCategoria: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryCategoriaEvento do
      begin
        CriarCampoTabela('CATEG_EVENTO_GS', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger := pCategoria.ID;
        Open;
        if IsEmpty then
        begin
          Append;
          FieldByName('id').AsInteger       := pCategoria.ID;
          FieldByName('descricao').AsString := pCategoria.Descricao;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Categoria do Evento.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirCategoriaFuncional(
  const pCategoriaFuncional: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryCategoriaFuncional do
      begin
        Close;
        ParamByName('id').AsInteger    := pCategoriaFuncional.ID;
        ParamByName('codigo').AsString := pCategoriaFuncional.Codigo;
        Open;
        if IsEmpty then
        begin
          //pCategoriaFuncional.ID := NewID('CATEG_FUNCIONAL', 'ID');
          //
          Append;
          FieldByName('id').AsInteger       := pCategoriaFuncional.ID;
          FieldByName('descricao').AsString := pCategoriaFuncional.Descricao;
          FieldByName('codigo').AsString    := pCategoriaFuncional.Codigo;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Categoria Funcional.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirCBO(var pCBO: TCBO): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryCBO do
      begin
        CriarCampoTabela('CBO', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('codigo').AsString := pCBO.Codigo;
        Open;
        if IsEmpty then
        begin
          pCBO.ID := NewID('CBO', 'ID');

          Append;
          FieldByName('id').AsInteger       := pCBO.ID;
          FieldByName('descricao').AsString := pCBO.Descricao;
          FieldByName('codigo').AsString    := pCBO.Codigo;
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pCBO.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o CBO.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirContaBancoServidor(
  const pConta: TContaBancoServidor): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryServidorConta do
      begin
        CriarCampoTabela('SERVIDOR_CONTA_BANC', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pConta.IDConta;
        ParamByName('codigo').AsString := pConta.Servidor.Codigo;
//        ParamByName('servidor').AsInteger := pConta.Servidor.ID;
//        ParamByName('entidade').AsInteger := pConta.ID;
//        ParamByName('agencia').AsString   := pConta.Agencia;
//        ParamByName('conta').AsString     := pConta.NumeroConta;
        Open;
        if IsEmpty then
        begin
          if (pConta.IDConta = 0) then
            pConta.IDConta := NewID('SERVIDOR_CONTA_BANC', 'ID');

          Append;
          FieldByName('id').AsInteger          := pConta.IDConta;
          FieldByName('id_servidor').AsInteger := pConta.Servidor.ID;
          FieldByName('id_entid_financ').AsInteger := pConta.ID;
          FieldByName('agencia').AsString          := pConta.Agencia;

          if (pConta.NumeroConta = '0') or (pConta.NumeroConta = '-0') then
            FieldByName('num_conta').Clear
          else
            FieldByName('num_conta').AsString := pConta.NumeroConta;

          FieldByName(ID_SYS_ANTER).AsString := pConta.Servidor.Codigo;
          FieldByName('ativa').AsString      := IfThen(pConta.Ativo, 'S', 'N');
        end
        else
          Edit;

        FieldByName('tipo_conta').AsInteger := Ord(pConta.TipoConta);

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Conta do Servidor.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirDepartamento(
  var pDepartamento: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;

  try
    fdTargetDB.ExecSQL('CREATE INDEX IDX_DEPTO_DESCRICAO ON DEPTO (DESCRICAO)', True);
  except
  end;

  try
    try
      with qryDepartamento do
      begin
        CriarCampoTabela('DEPTO', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pDepartamento.ID;
        ParamByName('codigo').AsString := pDepartamento.Codigo;
        ParamByName('descricao').Clear;
        Open;
        if IsEmpty then
        begin
          if (pDepartamento.ID = 0) then
            pDepartamento.ID := NewID('DEPTO', 'ID');

          Append;
          FieldByName('id').AsInteger          := pDepartamento.ID;
          FieldByName('descricao').AsString    := Copy(Trim(pDepartamento.Descricao), 1, 40);
          FieldByName('em_uso').AsString       := IfThen(pDepartamento.Ativo, 'S', 'N');
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pDepartamento.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Departamento.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirDependente(
  const pDependente: TDependente): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      // Tabela SERVIDOR_DEPENDENTE
      with qryServidorDependente do
      begin
        CriarCampoTabela('SERVIDOR_DEPENDENTE', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger := pDependente.ID;
        ParamByName('servidor').AsInteger    := pDependente.Servidor.IDServidor;
        ParamByName('nome').AsString         := Trim(Copy(pDependente.Nome, 1, 60));
        ParamByName('nascimento').AsDateTime := pDependente.DataNascimento;
        ParamByName('codigo').AsString       := pDependente.Codigo;
        Open;
        if IsEmpty and (pDependente.Servidor.IDServidor > 0) then
        begin
          if (pDependente.ID = 0) then
            pDependente.ID := NewID('SERVIDOR_DEPENDENTE', 'ID');

          Append;
          FieldByName('id').AsInteger          := pDependente.ID;
          FieldByName('id_servidor').AsInteger := pDependente.Servidor.IDServidor;
          FieldByName('nome').AsString         := Trim(Copy(pDependente.Nome, 1, 60));
          FieldByName('sexo').AsString         := pDependente.SexoSigla;
          FieldByName('parentesco').AsString   := IntToStr(Ord(pDependente.Parentesco));
          FieldByName('dt_nascimento').AsDateTime := pDependente.DataNascimento;
          FieldByName('natural_cidade').AsString  := Trim(Copy(pDependente.Naturalidade.Cidade, 1, 40));
          FieldByName('natural_uf').AsString      := pDependente.Naturalidade.UF;
          FieldByName('cartorio_nome').AsString   := Trim(Copy(pDependente.RegistroCartorio.Nome, 1, 40));
          FieldByName('cartorio_cidade').AsString := Trim(Copy(pDependente.RegistroCartorio.Cidade, 1, 40));
          FieldByName('cartorio_uf').AsString     := pDependente.RegistroCartorio.UF;
          FieldByName('registro_num').AsString    := Trim(Copy(pDependente.RegistroCartorio.Numero, 1, 11));
          FieldByName('registro_livro').AsString  := Trim(Copy(pDependente.RegistroCartorio.Livro, 1, 11));
          FieldByName('registro_folha').AsString  := Trim(Copy(pDependente.RegistroCartorio.Folha, 1, 11));
          FieldByName('deficiente').AsString      := IfThen(pDependente.Deficiente, 'S', 'N');
          FieldByName('ativo_sal_familia').AsString := IfThen(pDependente.AtivoSalarioFamilia, 'S', 'N');
          FieldByName('ativo_irrf').AsString        := IfThen(pDependente.AtivoIRRF, 'S', 'N');
          FieldByName('percent_pensao_aliment').AsCurrency := pDependente.PercentualPensaoAliment;
          FieldByName('valor_pensao_aliment').AsCurrency   := pDependente.ValorPensaoAliment;

          if (Trim(pDependente.Codigo) = EmptyStr) then
            FieldByName(ID_SYS_ANTER).Clear
          else
            FieldByName(ID_SYS_ANTER).AsString := Trim(pDependente.Codigo);

          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        //aRetorno := True;
      end;

      // Tabela PESSOA_FISICA_DEPENDENTE
      with qryPessoaDependente do
      begin
        CriarCampoTabela('PESSOA_FISICA_DEPENDENTE', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger := pDependente.ID;
        ParamByName('pessoa').AsInteger      := pDependente.Servidor.ID;
        ParamByName('nome').AsString         := Trim(Copy(pDependente.Nome, 1, 60));
        ParamByName('nascimento').AsDateTime := pDependente.DataNascimento;
        ParamByName('codigo').AsString       := pDependente.Codigo;
        Open;
        if IsEmpty and (pDependente.Servidor.ID > 0) then
        begin
          if (pDependente.ID = 0) then
            pDependente.ID := NewID('PESSOA_FISICA_DEPENDENTE', 'ID');

          Append;
          FieldByName('id').AsInteger          := pDependente.ID;
          FieldByName('id_pessoa').AsInteger   := pDependente.Servidor.ID;
          FieldByName('nome').AsString         := Trim(Copy(pDependente.Nome, 1, 60));
          FieldByName('cpf').AsString          := pDependente.CPF_CNPJ.Numero;
          FieldByName('sexo').AsString         := pDependente.SexoSigla;
          FieldByName('parentesco').AsString   := IntToStr(Ord(pDependente.Parentesco));
          FieldByName('dt_nascimento').AsDateTime := pDependente.DataNascimento;
          FieldByName('natural_cidade').AsString  := Trim(Copy(pDependente.Naturalidade.Cidade, 1, 40));
          FieldByName('natural_uf').AsString      := pDependente.Naturalidade.UF;
          FieldByName('cartorio_nome').AsString   := Trim(Copy(pDependente.RegistroCartorio.Nome, 1, 40));
          FieldByName('cartorio_cidade').AsString := Trim(Copy(pDependente.RegistroCartorio.Cidade, 1, 40));
          FieldByName('cartorio_uf').AsString     := pDependente.RegistroCartorio.UF;
          FieldByName('registro_num').AsString    := Trim(Copy(pDependente.RegistroCartorio.Numero, 1, 11));
          FieldByName('registro_livro').AsString  := Trim(Copy(pDependente.RegistroCartorio.Livro, 1, 11));
          FieldByName('registro_folha').AsString  := Trim(Copy(pDependente.RegistroCartorio.Folha, 1, 11));
          FieldByName('estudante').AsString       := IfThen(pDependente.Estudante, 'S', 'N');
          FieldByName('deficiente').AsString      := IfThen(pDependente.Deficiente, 'S', 'N');
          FieldByName('ativo_sal_familia').AsString := IfThen(pDependente.AtivoSalarioFamilia, 'S', 'N');
          FieldByName('ativo_irrf').AsString        := IfThen(pDependente.AtivoIRRF, 'S', 'N');
          FieldByName('perc_p_aliment').AsCurrency  := pDependente.PercentualPensaoAliment;
          FieldByName('val_p_aliment').AsCurrency   := pDependente.ValorPensaoAliment;

          if (Trim(pDependente.Codigo) = EmptyStr) then
            FieldByName(ID_SYS_ANTER).Clear
          else
            FieldByName(ID_SYS_ANTER).AsString := Trim(pDependente.Codigo);

          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        //aRetorno := True;
      end;

      aRetorno := True;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Dependente da Pessoa Física.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirInicializaMesServidor(const pInicializaMesServidor : TInicializaMesServidor) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryInicializaMesServidor do
      begin
        CriarCampoTabela('INICIALIZA_MES_SERVIDOR', ID_SYS_ANTER, 'VARCHAR(20)'); // 2017070000000000RRR, R - Rubrica/Evento Base

        Close;
        ParamByName('competencia').AsString := pInicializaMesServidor.AnoMes;
        ParamByName('servidor').AsInteger   := pInicializaMesServidor.Servidor.IDServidor;
        Open;
        if IsEmpty then
        begin
          Append;
          FieldByName('ano_mes').AsString               := pInicializaMesServidor.AnoMes;
          FieldByName('id_servidor').AsInteger          := pInicializaMesServidor.Servidor.IDServidor;
          FieldByName('id_sub_unid_orcament').AsInteger := pInicializaMesServidor.Servidor.SubUnidadeOrcamentaria.ID;
          FieldByName('id_cargo').AsInteger             := pInicializaMesServidor.CargoFuncao.ID;

          if (pInicializaMesServidor.CargoFuncao2.ID =  0) then
            FieldByName('id_cargo2').Clear
          else
            FieldByName('id_cargo2').AsInteger := pInicializaMesServidor.CargoFuncao2.ID;

          if (pInicializaMesServidor.Servidor.DataAdmissao = StrToDateTime('30/12/1899')) then
            FieldByName('dt_admissao').Clear
          else
            FieldByName('dt_admissao').AsDateTime := pInicializaMesServidor.Servidor.DataAdmissao;

          FieldByName('id_unid_lotacao').AsInteger  := pInicializaMesServidor.Servidor.UnidadeLotacao.ID;
          FieldByName('id_depto').AsInteger         := pInicializaMesServidor.Servidor.Departamento.ID;
          FieldByName('efetivo').AsString           := IfThen(pInicializaMesServidor.Servidor.Efetivo, 'S', 'N');
          FieldByName('id_situacao_tcm').AsInteger  := pInicializaMesServidor.Servidor.SituacaoTCM.ID;
          FieldByName('id_est_funcional').AsInteger := pInicializaMesServidor.Servidor.EstadoFuncional.ID;
          FieldByName('qtd_dias_trab').AsInteger    := pInicializaMesServidor.DiasTrabalhados;
          FieldByName('dt_movim1').Clear;
          FieldByName('tipo_movim1').Clear;
          FieldByName('dt_movim2').Clear;
          FieldByName('tipo_movim2').Clear;
          FieldByName('calc_previd').AsString       := IfThen(pInicializaMesServidor.CalculaPrevidencia, 'S', 'N');
          FieldByName('calc_irrf').AsString         := IfThen(pInicializaMesServidor.CalculaIRRF, 'S', 'N');
          FieldByName('bloq_lancto_evento_auto').AsString := IfThen(pInicializaMesServidor.BloqueaLanctoEventoAuto, 'S', 'N');
          FieldByName('tempo_servico').AsString           := pInicializaMesServidor.TempoServico;
          FieldByName('id_progres_sal').AsInteger         := pInicializaMesServidor.ProgressoSalarial.ID;
          FieldByName('qtd_depend_sal_fam').AsInteger     := pInicializaMesServidor.QuantidadeDependenteSalFamilia;
          FieldByName('qtd_depend_p_aliment').AsInteger   := pInicializaMesServidor.QuantidadeDependentePAlimentacao;
          FieldByName('qtd_depend_irrf').AsInteger        := pInicializaMesServidor.QuantidadeDependenteIRRF;
          FieldByName('carga_hor_mensal').AsInteger       := pInicializaMesServidor.CargaHorariaMensal;
          FieldByName('calc_vencto_base').AsString        := IfThen(pInicializaMesServidor.CalculaVencimentoBase, 'S', 'N');
          FieldByName('vencto_base_cargo').AsCurrency     := pInicializaMesServidor.VencimentoBaseCargo;
          FieldByName('tipo_sal').AsString                := IntToStr(Ord(pInicializaMesServidor.TipoSalario));
          FieldByName('forma_calc_sal').AsString          := IntToStr(Ord(pInicializaMesServidor.FormaCalculo));
          FieldByName('bc_hora_aula').AsInteger           := pInicializaMesServidor.BaseCalculoHoraAula;
          FieldByName('calc_ats_sobre_vencto_base').AsString := IfThen(pInicializaMesServidor.CalculaATSVencimentoBase, 'S', 'N');
          FieldByName('nao_calcular_ats').AsString           := IfThen(pInicializaMesServidor.Servidor.NaoCalculaATS, 'S', 'N');

          FieldByName('dt_base_calc_ats').Clear;

          if (pInicializaMesServidor.TempoServicoATS = EmptyStr) then
            FieldByName('tempo_serv_ats').Clear
          else
            FieldByName('tempo_serv_ats').AsString := pInicializaMesServidor.TempoServicoATS;

          FieldByName('desvio_de_funcao').AsString := IfThen(pInicializaMesServidor.DesvioFuncao, 'S', 'N');

          if (pInicializaMesServidor.Servidor.CategoriaSEFIP = EmptyStr) then
            FieldByName('categ_sefip').Clear
          else
            FieldByName('categ_sefip').AsString := pInicializaMesServidor.Servidor.CategoriaSEFIP;

          if (pInicializaMesServidor.Servidor.OcorrenciaSEFIP = EmptyStr) then
            FieldByName('ocorrencia_sefip').Clear
          else
            FieldByName('ocorrencia_sefip').AsString := pInicializaMesServidor.Servidor.OcorrenciaSEFIP;

          if (pInicializaMesServidor.DataPrimeiraAdmissao = StrToDateTime('30/12/1899')) then
            FieldByName('dt_prim_admissao').Clear
          else
            FieldByName('dt_prim_admissao').AsDateTime := pInicializaMesServidor.DataPrimeiraAdmissao;

          FieldByName(ID_SYS_ANTER).AsString := pInicializaMesServidor.AnoMes + FormatFloat('0000000000', StrToInt(pInicializaMesServidor.Servidor.Matricula)) + pInicializaMesServidor.Rubrica;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar Inicializar Mês/Servidor.' + #13#13 + 'InserirInicializaMesServidor() : ' + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirBaseCalculoMesServidor(const pBaseCalculoMesServidor : TBaseCalculoMesServidor) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryBaseCalculoMesServidor do
      begin
        CriarCampoTabela('BASE_CALC_MES_SERVIDOR', ID_SYS_ANTER, 'VARCHAR(20)'); // 2017070000000000RRR, R - Rubrica/Evento Base

        Close;
        ParamByName('competencia').AsString := pBaseCalculoMesServidor.InicializaMes.AnoMes;
        ParamByName('servidor').AsInteger   := pBaseCalculoMesServidor.InicializaMes.Servidor.IDServidor;
        ParamByName('parcela').AsString     := pBaseCalculoMesServidor.Parcela;
        Open;
        if IsEmpty then
        begin
          Append;
          FieldByName('ano_mes').AsString      := pBaseCalculoMesServidor.InicializaMes.AnoMes;
          FieldByName('id_servidor').AsInteger := pBaseCalculoMesServidor.InicializaMes.Servidor.IDServidor;
          FieldByName('parcela').AsString      := pBaseCalculoMesServidor.Parcela;
          FieldByName('ch_calc_falta_prof').AsInteger := pBaseCalculoMesServidor.CHFaltaProfessor;
          FieldByName('bc_sal_fam').AsCurrency        := pBaseCalculoMesServidor.BaseCalculoSalarioFamilia;
          FieldByName('bc_ats').AsCurrency            := pBaseCalculoMesServidor.BaseCalculoATS;
          FieldByName('bc_ferias').AsCurrency         := pBaseCalculoMesServidor.BaseCalculoFerias;
          FieldByName('bc_dec_terc').AsCurrency       := pBaseCalculoMesServidor.BaseCalculoDecTerceito;
          FieldByName('bc_falta').AsCurrency          := pBaseCalculoMesServidor.BaseCalculoFalta;
          FieldByName('bc_previd').AsCurrency         := pBaseCalculoMesServidor.BaseCalculoPrevidencia;
          FieldByName('bc_irrf').AsCurrency           := pBaseCalculoMesServidor.BaseCalculoIRRF;
          FieldByName('bc_outra1').AsCurrency         := pBaseCalculoMesServidor.BaseCalculoOutra1;
          FieldByName('bc_outra2').AsCurrency         := pBaseCalculoMesServidor.BaseCalculoOutra2;
          FieldByName('bc_outra3').AsCurrency         := pBaseCalculoMesServidor.BaseCalculoOutra3;
          FieldByName('tot_vencto').AsCurrency        := pBaseCalculoMesServidor.TotalVencimento;
          FieldByName('tot_desconto').AsCurrency      := pBaseCalculoMesServidor.TotalDesconto;
          FieldByName('sal_liquido').AsCurrency       := pBaseCalculoMesServidor.SalarioLiquido;

          if (pBaseCalculoMesServidor.DataPagamento = StrToDateTime('30/12/1899')) then
            FieldByName('dt_pagto').Clear
          else
            FieldByName('dt_pagto').AsDateTime := pBaseCalculoMesServidor.DataPagamento;

          FieldByName(ID_SYS_ANTER).AsString := pBaseCalculoMesServidor.InicializaMes.AnoMes + FormatFloat('0000000000', StrToInt(pBaseCalculoMesServidor.InicializaMes.Servidor.Matricula)) + pBaseCalculoMesServidor.InicializaMes.Rubrica;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Base de Cálculo do Mês/Servidor.' + #13#13 + 'InserirBaseCalculoMesServidor() : ' + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirEventoBCMesServidor(const pEventoBCMesServidor : TEventoBaseCalculoMesServidor) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryEventoBCMesServidor do
      begin
        CriarCampoTabela('LANCTO_EVENTO_CALC', ID_SYS_ANTER, 'VARCHAR(20)'); // 2017070000000000RRR, R - Rubrica/Evento Base

        Close;
        ParamByName('competencia').AsString := pEventoBCMesServidor.BaseCalculoMesServidor.InicializaMes.AnoMes;
        ParamByName('servidor').AsInteger   := pEventoBCMesServidor.BaseCalculoMesServidor.InicializaMes.Servidor.IDServidor;
        ParamByName('parcela').AsString     := pEventoBCMesServidor.BaseCalculoMesServidor.Parcela;
        ParamByName('evento').AsInteger     := pEventoBCMesServidor.EventoBaseCalculo.ID;
        Open;
        if IsEmpty then
        begin
          Append;
          FieldByName('ano_mes').AsString      := pEventoBCMesServidor.BaseCalculoMesServidor.InicializaMes.AnoMes;
          FieldByName('id_servidor').AsInteger := pEventoBCMesServidor.BaseCalculoMesServidor.InicializaMes.Servidor.IDServidor;
          FieldByName('parcela').AsString      := pEventoBCMesServidor.BaseCalculoMesServidor.Parcela;
          FieldByName('id_evento').AsInteger   := pEventoBCMesServidor.EventoBaseCalculo.ID;
          FieldByName('qtd').AsCurrency        := pEventoBCMesServidor.Quantidade;
          FieldByName('valor').AsCurrency      := pEventoBCMesServidor.Valor;
          FieldByName('observacao').AsString   := pEventoBCMesServidor.Observacao;
          FieldByName(ID_SYS_ANTER).AsString   :=
            pEventoBCMesServidor.BaseCalculoMesServidor.InicializaMes.AnoMes +
            FormatFloat('0000000000', StrToInt(pEventoBCMesServidor.BaseCalculoMesServidor.InicializaMes.Servidor.Matricula)) +
            pEventoBCMesServidor.EventoBaseCalculo.Codigo;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Evento da Base de Cálculo do Mês/Servidor.' + #13#13 + 'InserirEventoBCMesServidor() : ' + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirEntidadeFinanceira(
  const pEntidadeFinanceira: TEntidadeFinanceira): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryEntidadeFinanceira do
      begin
        CriarCampoTabela('ENTID_FINANC', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger     := pEntidadeFinanceira.ID;
        ParamByName('codigo').AsString  := pEntidadeFinanceira.Codigo;
        ParamByName('banco').AsString   := pEntidadeFinanceira.Banco.Codigo;
        Open;
        if IsEmpty then
        begin
          pEntidadeFinanceira.ID := NewID('ENTID_FINANC', 'ID');

          Append;
          FieldByName('id').AsInteger       := pEntidadeFinanceira.ID;
          FieldByName('descricao').AsString := pEntidadeFinanceira.Descricao;
          FieldByName('banco').AsString     := IfThen(pEntidadeFinanceira.EBanco, 'S', 'N');
          FieldByName('tipo_entid_financ').AsString := '1';

          if Trim(pEntidadeFinanceira.Banco.Codigo) = EmptyStr then
            FieldByName('cod_banco').Clear
          else
            FieldByName('cod_banco').AsString := pEntidadeFinanceira.Banco.Codigo;

          FieldByName(ID_SYS_ANTER).AsString  := pEntidadeFinanceira.Codigo;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Entidade Financeira.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirEscolaridade(
  var pEscolaridade: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryEscolaridade do
      begin
        Close;
        if (pEscolaridade.ID = 0) then
          ParamByName('id').Clear
        else
          ParamByName('id').AsInteger  := pEscolaridade.ID;
        ParamByName('codigo').AsString := pEscolaridade.Codigo;
        Open;
        if IsEmpty then
        begin
          if (pEscolaridade.ID = 0) then
            pEscolaridade.ID := NewID('ESCOLARIDADE', 'ID');

          Append;
          FieldByName('id').AsInteger       := pEscolaridade.ID;
          FieldByName('descricao').AsString := pEscolaridade.Descricao;
          FieldByName('cod_rais').AsString  := pEscolaridade.Codigo;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Escolaridade.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirEstadoCivil(
  const pEstadoCivil: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryEstadoCivil do
      begin
        CriarCampoTabela('ESTADO_CIVIL', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pEstadoCivil.ID;
        ParamByName('codigo').AsString := pEstadoCivil.Codigo;
        Open;
        if IsEmpty then
        begin
          pEstadoCivil.ID := NewID('ESTADO_CIVIL', 'ID');

          Append;
          FieldByName('id').AsInteger          := pEstadoCivil.ID;
          FieldByName('descricao').AsString    := pEstadoCivil.Descricao;
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pEstadoCivil.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Nacionalidade.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirEstadoFuncional(
  var pEstadoFuncional: TEstadoFuncional): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryEstadoFuncional do
      begin
        CriarCampoTabela('ESTADO_FUNCIONAL', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('codigo').AsString    := pEstadoFuncional.Codigo;
        ParamByName('descricao').AsString := Copy(pEstadoFuncional.Descricao, 1, 40);
        Open;
        if IsEmpty then
        begin
          if (pEstadoFuncional.ID = 0) then
            pEstadoFuncional.ID := NewID('ESTADO_FUNCIONAL', 'ID');

          Append;
          FieldByName('id').AsInteger       := pEstadoFuncional.ID;
          FieldByName('descricao').AsString := Copy(pEstadoFuncional.Descricao, 1, 40);
          FieldByName('em_atividade').AsString    := IfThen(pEstadoFuncional.EmAtividade, 'S', 'N');
          FieldByName('inicia_servidor').AsString := IfThen(pEstadoFuncional.IniciaServidor, 'S', 'N');
          FieldByName('calc_sal').AsString        := IfThen(pEstadoFuncional.CalculaSalario, 'S', 'N');
          FieldByName('tipo_movim').AsString      := pEstadoFuncional.TipoMovimento;
          FieldByName('cod_afast_previd').AsString   := pEstadoFuncional.AfastamentoPrevidencia.Codigo;
          FieldByName('cod_retorno_previd').AsString := pEstadoFuncional.RetornoPrevidencia.Codigo;
          FieldByName('movim_definitiva').AsString   := IfThen(pEstadoFuncional.MovimentoDefinitivo, 'S', 'N');
          FieldByName('pagto_entid_previd').AsString := IfThen(pEstadoFuncional.PagtoEntidadePrevidencia, 'S', 'N');
          FieldByName('ativo').AsString              := IfThen(pEstadoFuncional.Ativo, 'S', 'N');
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pEstadoFuncional.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;
      end;

      aRetorno := True;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Estado Funcional.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirEvento(var pEvento: TEvento): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryEvento do
      begin
        CriarCampoTabela('EVENTO', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('codigo').AsString := pEvento.Codigo;
        Open;
        if IsEmpty then
        begin
          pEvento.ID := NewID('EVENTO', 'ID');

          Append;
          FieldByName('id').AsInteger          := pEvento.ID;
          FieldByName('descricao').AsString    := Copy(Trim(pEvento.Descricao), 1, 40);
          FieldByName('codigo').AsString       := pEvento.CodigoRubrica;
          FieldByName('tipo').AsString         := pEvento.Tipo;
          FieldByName('id_categ').AsInteger    := pEvento.Categoria.ID;

          if (pEvento.CategoriaTCM.ID > 0) then
            FieldByName('id_categ_tcm').AsInteger := pEvento.CategoriaTCM.ID
          else
            FieldByName('id_categ_tcm').Clear;

          FieldByName('percent_hora_extra').AsCurrency := pEvento.PercentualHoraExtra;

          if (Trim(pEvento.HRSobreHoraNormal) <> EmptyStr) then
            FieldByName('he_sobre_hora_normal').AsString := pEvento.HRSobreHoraNormal
          else
            FieldByName('he_sobre_hora_normal').Clear;

          FieldByName('tipo_base_calc').AsString     := IntToStr(Ord(pEvento.TipoBaseCalculo));
          FieldByName('incide_sal_familia').AsString := IfThen(pEvento.IndiceSalarioFamilia, 'S', 'N');
          FieldByName('incide_ats').AsString         := IfThen(pEvento.IndiceATS, 'S', 'N');
          FieldByName('incide_ferias').AsString      := IfThen(pEvento.IndiceFerias, 'S', 'N');
          FieldByName('incide_dec_terc').AsString    := IfThen(pEvento.IndiceDecimoTerceiro, 'S', 'N');
          FieldByName('incide_falta').AsString       := IfThen(pEvento.IndiceFalta, 'S', 'N');
          FieldByName('incide_previd').AsString      := IfThen(pEvento.IndicePrevidencia, 'S', 'N');
          FieldByName('incide_irrf').AsString        := IfThen(pEvento.IndiceIRRF, 'S', 'N');
          FieldByName('incide_outra_bc1').AsString   := IfThen(pEvento.IndiceOutraBC1, 'S', 'N');
          FieldByName('incide_outra_bc2').AsString   := IfThen(pEvento.IndiceOutraBC2, 'S', 'N');
          FieldByName('incide_outra_bc3').AsString   := IfThen(pEvento.IndiceOutraBC3, 'S', 'N');
          FieldByName('valor_fixo').AsCurrency        := pEvento.ValorFixo;
          FieldByName('divisor').AsCurrency           := pEvento.Divisor;
          FieldByName('subdivisor').AsCurrency        := pEvento.SubDivisor;
          FieldByName('max_x_vencto_base').AsCurrency := pEvento.Max_x_vencimentoBase;
          FieldByName('gera_rais').AsString              := IfThen(pEvento.GeraRAIS, 'S', 'N');
          FieldByName('copia_mes_anterior').AsString     := IfThen(pEvento.CopiaMesAnterior, 'S', 'N');
          FieldByName('permitir_usuario_alter').AsString := IfThen(pEvento.PermiteUsuarioAlterar, 'S', 'N');
          FieldByName('sem_uso').AsString                := IfThen(pEvento.SemUso, 'S', 'N');
          FieldByName('cont_cod_item').Clear;// AsString          := pEvento.CodigoItem;
          FieldByName('cont_sub_elemen_desp').AsString   := pEvento.SubElementoDespesa;
          FieldByName('cont_conta_corrente').AsString    := pEvento.ContaCorrente;
          FieldByName('bc_margem_consig').AsString       := IfThen(pEvento.BCMargemConsignada, 'S', 'N');
          FieldByName('val_bc_fixa').AsCurrency          := pEvento.ValorBCFixa;
          FieldByName('natureza').AsString   := IntToStr(Ord(pEvento.Natureza));
          FieldByName('remunerac').AsString  := pEvento.Remuneracao;
          FieldByName('legalidade').AsString := pEvento.Descricao;
        end
        else
          Edit;

        FieldByName('forma_calc').AsString   := IntToStr(Ord(pEvento.FormaCalculo));
        FieldByName('valor_fixo').AsCurrency := pEvento.ValorFixo;
        FieldByName(ID_SYS_ANTER).AsString   := pEvento.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Evento.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirFatorProgramaSalario(
  const pFatorProgramaSalario: TFatorProgramaSalario): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryFatorProgramaSalario do
      begin
        Close;
        ParamByName('id').AsInteger := pFatorProgramaSalario.ID;
        Open;
        if IsEmpty then
        begin
//          pFatorProgramaSalario.ID := NewID('FATOR_PROG_SAL', 'ID');
//
          Append;
          FieldByName('id').AsInteger := pFatorProgramaSalario.ID;
          FieldByName('qtd_referencia').AsInteger := pFatorProgramaSalario.QuantidadeReferencia;
          FieldByName('ref_inicial').AsInteger    := pFatorProgramaSalario.ReferenciaInicial;
          FieldByName('qtd_ano').AsInteger        := pFatorProgramaSalario.QuantidadeAno;
          FieldByName('percent').AsCurrency       := pFatorProgramaSalario.Percentual;
          FieldByName('automatico').AsString      := IfThen(pFatorProgramaSalario.Automatico, 'S', 'N');
          FieldByName('incorp_vencto_base').AsString := IfThen(pFatorProgramaSalario.IncorporaVenctoBase, 'S', 'N');
          FieldByName('id_evento').Clear;
          FieldByName('base_calc').Clear;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Fator de Programação Salarial.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirNacionalidade(
  const pNacionalidade: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryNacionalidade do
      begin
        CriarCampoTabela('NACIONALIDADE', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pNacionalidade.ID;
        ParamByName('codigo').AsString := pNacionalidade.Codigo;
        Open;
        if IsEmpty then
        begin
          pNacionalidade.ID := NewID('NACIONALIDADE', 'ID');

          Append;
          FieldByName('id').AsInteger          := pNacionalidade.ID;
          FieldByName('descricao').AsString    := pNacionalidade.Descricao;
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pNacionalidade.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Nacionalidade.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirPessoaFisica(
  const pPessoaFisica : TPessoaFisica): Boolean;
var
  aRetorno  : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryPessoaFisica do
      begin
        CriarCampoTabela('PESSOA_FISICA', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('cpf').AsString := pPessoaFisica.CPF_CNPJ.Numero;
        Open;
        if IsEmpty then
        begin
          pPessoaFisica.ID := NewID('PESSOA_FISICA', 'ID');

          Append;
          FieldByName('id').AsInteger          := pPessoaFisica.ID;
          FieldByName('nome').AsString         := pPessoaFisica.Nome;
          if (pPessoaFisica.Apelido = EmptyStr) then
            FieldByName('apelido').Clear
          else
            FieldByName('apelido').AsString := pPessoaFisica.Apelido;
          FieldByName('sexo').AsString         := SEXO_PESSOA[pPessoaFisica.Sexo];
          if (pPessoaFisica.Raca.ID = 0) then
            FieldByName('id_raca_cor').Clear
          else
            FieldByName('id_raca_cor').AsInteger := pPessoaFisica.Raca.ID;
          FieldByName('dt_nascimento').AsDateTime  := pPessoaFisica.DataNascimento;
          FieldByName('natural_cidade').AsString   := pPessoaFisica.Naturalidade.Cidade;
          FieldByName('natural_uf').AsString       := pPessoaFisica.Naturalidade.UF;
          FieldByName('rg_num').AsString           := pPessoaFisica.RG.Numero;
          FieldByName('rg_orgao_emissor').AsString := pPessoaFisica.RG.OrgaoEmissor;
          FieldByName('rg_uf').AsString            := pPessoaFisica.RG.UF;
          FieldByName('rg_dt_emissao').AsDateTime  := pPessoaFisica.RG.DataEmissao;
          FieldByName('cpf').AsString              := pPessoaFisica.CPF_CNPJ.Numero;
          FieldByName('pis_pasep').AsString        := pPessoaFisica.PisPasep.Numero;
          if (pPessoaFisica.CNH.Categoria = EmptyStr) then
            FieldByName('cnh_categ').Clear
          else
            FieldByName('cnh_categ').AsString := pPessoaFisica.CNH.Categoria;
          FieldByName('cnh_num').AsString          := pPessoaFisica.CNH.Numero;
          if ( pPessoaFisica.CNH.DataVencimento = StrToDateTime('30/12/1899') ) then
            FieldByName('cnh_dt_vencto').Clear
          else
            FieldByName('cnh_dt_vencto').AsDateTime := pPessoaFisica.CNH.DataVencimento;
          FieldByName('tit_eleitor_num').AsString  := pPessoaFisica.Titulo.Numero;
          FieldByName('tit_eleitor_zona').AsString := pPessoaFisica.Titulo.Zona;
          FieldByName('tit_eleitor_secao').AsString   := pPessoaFisica.Titulo.Secao;
          FieldByName('reservista').AsString          := pPessoaFisica.Reservista.Numero;
          if (pPessoaFisica.EstadoCivil.ID = 0) then
            FieldByName('id_estado_civil').Clear
          else
            FieldByName('id_estado_civil').AsInteger := pPessoaFisica.EstadoCivil.ID;
          if (pPessoaFisica.Conjuge.Nome = EmptyStr) then
            FieldByName('conjuge_nome').Clear
          else
            FieldByName('conjuge_nome').AsString := pPessoaFisica.Conjuge.Nome;
          if (pPessoaFisica.Conjuge.CPF_CNPJ.Numero = EmptyStr) then
            FieldByName('conjuge_cpf').Clear
          else
            FieldByName('conjuge_cpf').AsString := pPessoaFisica.Conjuge.CPF_CNPJ.Numero;
          FieldByName('filiacao_pai').AsString        := pPessoaFisica.NomePai;
          FieldByName('filiacao_mae').AsString        := pPessoaFisica.NomeMae;
          FieldByName('ender_lograd').AsString        := pPessoaFisica.Endereco.Descricao;
          if (pPessoaFisica.Endereco.Numero = EmptyStr) then
            FieldByName('ender_num').Clear
          else
            FieldByName('ender_num').AsString := pPessoaFisica.Endereco.Numero;
          FieldByName('ender_bairro').AsString        := pPessoaFisica.Endereco.Bairro;
          FieldByName('ender_cidade').AsString        := pPessoaFisica.Endereco.Cidade;
          FieldByName('ender_cep').AsString           := pPessoaFisica.Endereco.Cep;
          FieldByName('ender_uf').AsString            := pPessoaFisica.Endereco.UF;
          FieldByName('ender_complem').AsString       := pPessoaFisica.Endereco.Complemento;
          if (pPessoaFisica.Telefone = EmptyStr) then
            FieldByName('telefone').Clear
          else
            FieldByName('telefone').AsString := pPessoaFisica.Telefone;
          if (pPessoaFisica.Email = EmptyStr) then
            FieldByName('e_mail').Clear
          else
            FieldByName('e_mail').AsString := pPessoaFisica.Email;
          FieldByName('id_nacionalidade').AsInteger   := pPessoaFisica.Nacionalidade.ID;
          if (pPessoaFisica.AnoChegadaAoBrasil = 0) then
            FieldByName('ano_chegada_brasil').Clear
          else
            FieldByName('ano_chegada_brasil').AsInteger := pPessoaFisica.AnoChegadaAoBrasil;

          FieldByName(ID_SYS_ANTER).AsString := pPessoaFisica.Codigo;

          Post;
          ApplyUpdates(0);
          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Pessoa Física.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirServidor(
  const pServidor: TServidor): Boolean;
var
  aID : String;
  aRetorno  : Boolean;
  aCampoVazio : TStringList;
begin
  aRetorno    := False;
  aCampoVazio := TStringList.Create;
  try
    try
      with qryServidor do
      begin
        CriarCampoTabela('SERVIDOR', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pServidor.IDServidor;
        ParamByName('codigo').AsString := pServidor.Codigo;
        Open;
        if IsEmpty then
        begin
          aID := IntToStr(NewID('SERVIDOR', 'CAST(substring(lpad(ID, 10, ''0'') from 1 for 9) as INTEGER)'));
          aID := aID + CalcularDigitoVerificador(aID);
          pServidor.IDServidor := StrToInt(aID);

          Append;
          FieldByName('id').AsInteger               := pServidor.IDServidor;
          FieldByName('id_pessoa_fisica').AsInteger := pServidor.ID;
          FieldByName('matricula').AsInteger        := StrToInt(pServidor.Matricula);
          FieldByName('efetivo').AsString           := IfThen(pServidor.Efetivo, 'S', 'N');

          if (pServidor.DataConcurso = StrToDateTime('30/12/1899')) then
            FieldByName('dt_concurso').Clear
          else
            FieldByName('dt_concurso').AsDateTime := pServidor.DataConcurso;

          if (pServidor.DataAdmissao = StrToDateTime('30/12/1899')) then
            FieldByName('dt_admissao').AsDateTime := StrToDateTime('01/01/1901')
          else
            FieldByName('dt_admissao').AsDateTime := pServidor.DataAdmissao;

          if (pServidor.DataReadmissao = StrToDateTime('30/12/1899')) then
            FieldByName('dt_readmissao').Clear
          else
            FieldByName('dt_readmissao').AsDateTime := pServidor.DataReadmissao;

          if (Trim(pServidor.DocumentoAdmissao) = EmptyStr) then
            FieldByName('docto_admissao').Clear
          else
            FieldByName('docto_admissao').AsString := Trim(pServidor.DocumentoAdmissao);

          if (Trim(pServidor.AnoPrimeiroEmprego) = EmptyStr) then
            FieldByName('ano_prim_emprego').Clear
          else
            FieldByName('ano_prim_emprego').AsString := Trim(pServidor.AnoPrimeiroEmprego);

          FieldByName('id_sub_unid_orcament').AsInteger := pServidor.SubUnidadeOrcamentaria.ID;
          FieldByName('id_unid_lotacao').AsInteger      := pServidor.UnidadeLotacao.ID;
          FieldByName('id_depto').AsInteger             := pServidor.Departamento.ID;
          FieldByName('id_cargo_origem').AsInteger      := pServidor.CargoOrigem.ID;
          FieldByName('id_cargo_atual').AsInteger       := pServidor.CargoAtual.ID;

          if (pServidor.ReferenciaSalario = 0) then
            FieldByName('ref_salario').Clear
          else
            FieldByName('ref_salario').AsInteger := pServidor.ReferenciaSalario;

          if (pServidor.VencimentoBase = 0.0) then
            FieldByName('vencto_base').Clear
          else
            FieldByName('vencto_base').AsCurrency  := pServidor.VencimentoBase;

          FieldByName('id_escolaridade').AsInteger := pServidor.Escolaridade.ID;

          if (Trim(pServidor.Formacao) = EmptyStr) then
            FieldByName('formacao').Clear
          else
            FieldByName('formacao').AsString := Trim(pServidor.Formacao);

          if (Trim(pServidor.ConselhoRegistro) = EmptyStr) then
            FieldByName('conselho_registro').Clear
          else
            FieldByName('conselho_registro').AsString := Trim(pServidor.ConselhoRegistro);

          if (pServidor.CargaHorariaMensal = 0) then
            FieldByName('carga_hor_mensal').Clear
          else
            FieldByName('carga_hor_mensal').AsInteger := pServidor.CargaHorariaMensal;

          FieldByName('qtd_depend_irrf').AsInteger        := pServidor.QuantidadeDependenteIRRF;
          FieldByName('calc_vencto_base').AsString        := IfThen(pServidor.CalculaVencimentoBase, 'S', 'N');
          FieldByName('bloq_lancto_evento_auto').AsString := IfThen(pServidor.BloqueaLanctoEventoAuto, 'S', 'N');
          FieldByName('calc_previd').AsString             := IfThen(pServidor.CalculaPrevidencia, 'S', 'N');
          FieldByName('calc_irrf').AsString               := IfThen(pServidor.CalculaIRRF, 'S', 'N');
          FieldByName('hora_entrada1').Clear;
          FieldByName('hora_saida1').Clear;
          FieldByName('hora_entrada2').Clear;
          FieldByName('hora_saida2').Clear;
          FieldByName('observacao').Clear;
          FieldByName('nao_calcular_ats').AsString := IfThen(pServidor.NaoCalculaATS, 'S', 'N');
          FieldByName('id_horario').Clear;
          FieldByName('calc_sal_cargo_origem').AsString := IfThen(pServidor.CalculaSalarioCargoOrigem, 'S', 'N');

          if (pServidor.ReferenciaSalarioInicial = 0) then
            FieldByName('ref_sal_inicial').Clear
          else
            FieldByName('ref_sal_inicial').AsInteger := pServidor.ReferenciaSalarioInicial;

          FieldByName('dt_base_calc_ats').Clear;

          FieldByName('desvio_de_funcao').AsString := IfThen(pServidor.DesvioFuncao, 'S', 'N');

          if (Trim(pServidor.CategoriaSEFIP) = EmptyStr) then
            FieldByName('categ_sefip').Clear
          else
            FieldByName('categ_sefip').AsString := Trim(pServidor.CategoriaSEFIP);

          if (Trim(pServidor.OcorrenciaSEFIP) = EmptyStr) then
            FieldByName('ocorrencia_sefip').Clear
          else
            FieldByName('ocorrencia_sefip').AsString := Trim(pServidor.OcorrenciaSEFIP);

        end
        else
          Edit;

        FieldByName('status').AsString            := IntToStr(Ord(pServidor.Status));
        FieldByName('id_situacao_tcm').AsInteger  := pServidor.SituacaoTCM.ID;
        FieldByName('id_est_funcional').AsInteger := pServidor.EstadoFuncional.ID;
        FieldByName(ID_SYS_ANTER).AsString        := pServidor.Codigo;

        if GetExistemCamposNulos(qryServidor, aCampoVazio) then
          raise Exception.Create('Campo(s) vazio(s) : ' + aCampoVazio.Text);
        begin
          Post;
          ApplyUpdates(0);
          CommitUpdates;
          aRetorno := True;
        end;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Servidor.' + #13#13 + E.Message);
    end;
  finally
    aCampoVazio.Free;
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirServidorEventoFixo(const pServidorEvento : TEventoFixoServidor) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryServidorEventoFixo do
      begin
        Close;
        ParamByName('servidor').AsInteger := pServidorEvento.Servidor.IDServidor;
        ParamByName('evento').AsInteger   := pServidorEvento.Evento.ID;
        Open;
        if (pServidorEvento.Servidor.IDServidor > 0) and (pServidorEvento.Evento.ID > 0) then
        begin
          if IsEmpty then
          begin
            Append;
            FieldByName('id_servidor').AsInteger  := pServidorEvento.Servidor.IDServidor;
            FieldByName('id_evento').AsInteger    := pServidorEvento.Evento.ID;
            FieldByName('observacao').AsString    := pServidorEvento.Observacao;
            FieldByName('ini_validade').AsString  := pServidorEvento.ValidadeInicial;
            FieldByName('fim_validade').AsString  := pServidorEvento.ValidadeFinal;
            FieldByName('calc_dec_terc').AsString := IfThen(pServidorEvento.CalcularDecimoTerc, 'S', 'N');
            FieldByName('participa').AsString     := IfThen(pServidorEvento.Participa, 'S', 'N');
          end
          else
            Edit;

          FieldByName('qtd').AsCurrency   := pServidorEvento.Quantidade;
          FieldByName('valor').AsCurrency := pServidorEvento.Valor;

          Post;
          ApplyUpdates(0);
          CommitUpdates;

          aRetorno := True;
        end;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Evento Fixo do Servidor.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirSetor(var pSetor: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qrySetor do
      begin
        CriarCampoTabela('SETOR', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('codigo').AsString := pSetor.Codigo;
        Open;
        if IsEmpty then
        begin
          pSetor.ID := NewID('SETOR', 'ID');

          Append;
          FieldByName('id').AsInteger          := pSetor.ID;
          FieldByName('descricao').AsString    := Copy(Trim(pSetor.Descricao), 1, 40);
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pSetor.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;

        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Setor.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirSituacaoTCM(
  var pSituacaoTCM: TGenerico): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qrySituacaoTCM do
      begin
        CriarCampoTabela('SITUACAO_TCM', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pSituacaoTCM.ID;
        ParamByName('codigo').AsString := pSituacaoTCM.Codigo;
        Open;
        if IsEmpty then
        begin
          pSituacaoTCM.ID := NewID('SITUACAO_TCM', 'ID');

          Append;
          FieldByName('id').AsInteger          := pSituacaoTCM.ID;
          FieldByName('descricao').AsString    := pSituacaoTCM.Descricao;
        end
        else
          Edit;

        FieldByName(ID_SYS_ANTER).AsString := pSituacaoTCM.Codigo;

        Post;
        ApplyUpdates(0);
        CommitUpdates;
      end;

      aRetorno := True;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Situação TCM.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirSubUnidadeOrcament(
  var pSubUnidadeOrcament: TSubUnidadeOrcamentaria): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qrySubUnidadeGest do
      begin
        CriarCampoTabela('SUB_UNID_ORCAMENT', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('id').AsInteger    := pSubUnidadeOrcament.ID;
        ParamByName('codigo').AsString := pSubUnidadeOrcament.Codigo;
        Open;
        if IsEmpty then
        begin
          pSubUnidadeOrcament.ID := NewID('SUB_UNID_ORCAMENT', 'ID');

          Append;
          FieldByName('id').AsInteger        := pSubUnidadeOrcament.ID;
          FieldByName('descricao').AsString  := Trim(pSubUnidadeOrcament.Descricao);
          FieldByName('abreviacao').AsString := Trim(pSubUnidadeOrcament.Abreviacao);
          FieldByName('tipo_vinculo').AsString := IntToStr(Ord(pSubUnidadeOrcament.Vinculo));
          FieldByName('id_unid_orcament').AsInteger  := pSubUnidadeOrcament.UnidadeOrcamentaria.ID;
          FieldByName('id_setor').AsInteger          := pSubUnidadeOrcament.Setor.ID;
          FieldByName('tipo_previd').AsString        := Ifthen(pSubUnidadeOrcament.TipoPrevidencia, 'S', 'N');
          FieldByName('contrib_individual').AsString := Ifthen(pSubUnidadeOrcament.ContribIndividual, 'S', 'N');

          if (Trim(pSubUnidadeOrcament.CodigoOrgaoBanco) = EmptyStr) then
            FieldByName('cod_orgao_banco').Clear
          else
            FieldByName('cod_orgao_banco').AsString := Trim(pSubUnidadeOrcament.CodigoOrgaoBanco);

          if (pSubUnidadeOrcament.EventoBase.ID = 0) then
            FieldByName('id_evento_base').Clear
          else
            FieldByName('id_evento_base').AsInteger := pSubUnidadeOrcament.EventoBase.ID;

          FieldByName('calc_ats').AsString         := Ifthen(pSubUnidadeOrcament.CalculaATS, 'S', 'N');
          FieldByName('calc_sal_familia').AsString := Ifthen(pSubUnidadeOrcament.CalculaSalarioFamilia, 'S', 'N');
          FieldByName('desc_irrf').AsString        := Ifthen(pSubUnidadeOrcament.DescontoIRRF, 'S', 'N');
          FieldByName('paga_rescisao').AsString    := Ifthen(pSubUnidadeOrcament.PagaRecisao, 'S', 'N');
          FieldByName('inativos').AsString         := Ifthen(pSubUnidadeOrcament.Inativos, 'S', 'N');
          FieldByName('gera_rais').AsString        := Ifthen(pSubUnidadeOrcament.GeraRAIS, 'S', 'N');
          FieldByName('teto_vencto_base').AsCurrency := pSubUnidadeOrcament.TetoVencimentoBase;
          FieldByName('teto_salario').AsCurrency     := pSubUnidadeOrcament.TetoSalario;
          FieldByName('em_uso').AsString             := Ifthen(pSubUnidadeOrcament.Ativo, 'S', 'N');
          FieldByName('pagto_fundeb').AsString       := Ifthen(pSubUnidadeOrcament.PagamentoFUNDEB, 'S', 'N');
          FieldByName('gera_dirf').AsString          := Ifthen(pSubUnidadeOrcament.GeraDIRF, 'S', 'N');
          FieldByName('id_suo_demit').Clear;
          FieldByName('cont_credor').Clear;
          FieldByName('cont_credor2').Clear;
          FieldByName('cont_elemen_desp1').Clear;
          FieldByName('cont_elemen_desp2').Clear;
          FieldByName('cont_conta_corrente').Clear;
          FieldByName('gera_gfip').AsString := Ifthen(pSubUnidadeOrcament.GeraGFIP, 'S', 'N');
          FieldByName('num_ficha_contab').Clear;
          FieldByName('cod_proj_ativ').Clear;
          FieldByName(ID_SYS_ANTER).AsString := pSubUnidadeOrcament.Codigo;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir o Subunidade Orçamentária.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirUnidadeGestora(
  var pUnidadeGestora: TUnidadeGestora): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryUnidadeGestora do
      begin
        Close;
        ParamByName('codigo').AsInteger := StrToInt(pUnidadeGestora.Codigo);
        Open;
        if IsEmpty then
        begin
          pUnidadeGestora.ID := NewID('UNID_GESTORA', 'ID');

          Append;
          FieldByName('id').AsInteger            := pUnidadeGestora.ID;
          FieldByName('descricao').AsString      := pUnidadeGestora.Descricao;
          FieldByName('razao_social').AsString   := pUnidadeGestora.RazaoSocial;
          FieldByName('cod_orgao_tcm').AsInteger := StrToInt(pUnidadeGestora.Codigo);
          FieldByName('cnpj').AsString           := pUnidadeGestora.CNPJ;
          FieldByName('id_tipo_unid_gestora').AsInteger := pUnidadeGestora.TipoUnidade.ID;
          FieldByName('cod_contabil').AsString          := pUnidadeGestora.CodigoContabil;
          FieldByName('forma_calc_rescisao').AsString   := IntToStr(Ord(pUnidadeGestora.FormaCalculoRecisao));
          FieldByName('teto_vencto_base').AsCurrency    := pUnidadeGestora.TetoVencimentoBase;
          FieldByName('cnpj_principal').AsString        := pUnidadeGestora.CNPJPrincipal;
          FieldByName('nome_gestor').AsString           := pUnidadeGestora.GestorNome;
          FieldByName('descr_cargo_gestor').AsString    := pUnidadeGestora.GestorDescricaoCargo;
          if (pUnidadeGestora.GestorServidorID = 0) then
            FieldByName('id_servid_gestor').Clear
          else
            FieldByName('id_servid_gestor').AsInteger := pUnidadeGestora.GestorServidorID;
          FieldByName('dados_no_ccheque').AsString    := IfThen(pUnidadeGestora.DadosNoContraCheque, 'S', 'N');
          FieldByName('cnpj_da_gps').AsString         := IfThen(pUnidadeGestora.CNPJ_naGPS, 'S', 'N');
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Unidade Gestora.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirUnidadeLotacao(
  var pUnidadeLotacao: TUnidadeLotacao): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryUnidadeLotacao do
      begin
        CriarCampoTabela('UNID_LOTACAO', ID_SYS_ANTER, ID_SYS_ANTER_TYPE);

        Close;
        ParamByName('codigo').AsString := pUnidadeLotacao.Codigo;
        Open;
        if IsEmpty then
        begin
          pUnidadeLotacao.ID := NewID('UNID_LOTACAO', 'ID');

          Append;
          FieldByName('id').AsInteger       := pUnidadeLotacao.ID;
          FieldByName('descricao').AsString := pUnidadeLotacao.Descricao;
          FieldByName('id_tipo_unid_lotacao').AsInteger := pUnidadeLotacao.Tipo.ID;
          FieldByName('localidade').AsString   := IntToStr(Ord(pUnidadeLotacao.Localidade));
          FieldByName('id_regiao').AsInteger   := pUnidadeLotacao.Regiao.ID;
          FieldByName('ativo').AsString        := IfThen(pUnidadeLotacao.Ativo, 'S', 'N');
          FieldByName(ID_SYS_ANTER).AsString   := pUnidadeLotacao.Codigo;
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Unidade de Lotação.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.InserirUnidadeOrcament(
  var pUnidadeOrcament: TUnidadeOrcamentaria): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with qryUnidadeOrcamentaria do
      begin
        Close;
        ParamByName('codigo').AsInteger := StrToInt(pUnidadeOrcament.Codigo);
        Open;
        if IsEmpty then
        begin
          pUnidadeOrcament.ID := NewID('UNID_ORCAMENT', 'ID');

          Append;
          FieldByName('id').AsInteger              := pUnidadeOrcament.ID;
          FieldByName('descricao').AsString        := pUnidadeOrcament.Descricao;
          FieldByName('cod_orgao_tcm').AsInteger   := StrToInt(pUnidadeOrcament.Codigo);
          FieldByName('cod_contabil').AsString     := pUnidadeOrcament.CodigoContabil;
          FieldByName('id_unid_gestora').AsInteger := pUnidadeOrcament.UnidadeGestora.ID;
          FieldByName('fundeb').AsString           := IfThen(pUnidadeOrcament.FUNDEB, 'S', 'N');
          FieldByName('texto_dotacao_ctro').AsString := pUnidadeOrcament.TextoDotacao.Text;
          FieldByName('cont_proj_ativ').AsString     := pUnidadeOrcament.ProjetoAtividade;
          FieldByName('em_uso').AsString             := IfThen(pUnidadeOrcament.Ativo, 'S', 'N');
          Post;

          ApplyUpdates(0);

          CommitUpdates;
        end;
        aRetorno := True;
      end;
    except
      On E : Exception do
        MensagemErro('Erro', 'Erro ao tentar inserir a Unidade Orçamentária.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

(*
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
*)
(*
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

*)

(*
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
*)

(*
      while not qryUnidLotacao.eof do
      begin

         sCodigo         := qryUnidLotacaoCODIGO.AsString;
         sNomeLayout     := qryUnidLotacaoESCOLA.AsString;
         sCodigoAnterior := sCodigo+';'+pv_banco;

         if not cdsUnidLotacaofb.Locate(ID_SYS_ANTER, sCodigoAnterior, [])  then
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
*)

function TdmConexaoTargetDB.NewID(pTabela, pCampo: String): Integer;
begin
  with qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(' + pCampo +  ') as ID FROM ' + pTabela);
    OpenOrExecute;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

function TdmConexaoTargetDB.GetValue(const pTabela, pCampo, pWhere : String) : Integer;
var
  aRetorno : Integer;
begin
  aRetorno := 0;
  try
    with qryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('      ' + Trim(pCampo) + ' as ID');
      SQL.Add('FROM  ' + pTabela );
      SQL.Add('WHERE ' + pWhere );
      OpenOrExecute;

      aRetorno := FieldByName('ID').AsInteger;
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.ObjectID(const pTabela, pCampoID, pCampoCodigo, pCampoDescricao, pCampoAtivo, pWhere : String) : TGenerico;
var
  aRetorno : TGenerico;
begin
  aRetorno := TGenerico.Create;
  try
    with qryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT');
      SQL.Add('    current_date as data');
      SQL.Add('  , current_time as hora');
      SQL.Add('  , current_timestamp as data_hora');

      if (Trim(pCampoID) <> EmptyStr) then
        SQL.Add('  , ' + Trim(pCampoID) + ' as ID');

      if (Trim(pCampoCodigo) <> EmptyStr) then
        SQL.Add('  , ' + Trim(pCampoCodigo) + ' as CODIGO');

      if (Trim(pCampoDescricao) <> EmptyStr) then
        SQL.Add('  , ' + Trim(pCampoDescricao) + ' as Descricao');

      if (Trim(pCampoAtivo) <> EmptyStr) then
        SQL.Add('  , ' + Trim(pCampoAtivo) + ' as Ativo');

      SQL.Add('FROM ' + pTabela );

      if (Trim(pWhere) <> EmptyStr) then
        SQL.Add('WHERE ' + pWhere );

      OpenOrExecute;

      if (Trim(pCampoID) <> EmptyStr) then
        aRetorno.ID := FieldByName('ID').AsInteger;
      if (Trim(pCampoCodigo) <> EmptyStr) then
        aRetorno.Codigo := FieldByName('CODIGO').AsString;
      if (Trim(pCampoDescricao) <> EmptyStr) then
        aRetorno.Descricao := FieldByName('DESCRICAO').AsString;
      if (Trim(pCampoAtivo) <> EmptyStr) then
        aRetorno.Ativo := (FieldByName('ATIVO').AsString = 'S') or (FieldByName('ATIVO').AsString = '1');
    end;
  finally
    Result := aRetorno;
  end;
end;

function TdmConexaoTargetDB.ExisteCampoTabela(const pTabela, pCampo : String) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    with qryBusca do
    begin
      // Verificar se campo existe
      Close;
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('  f.rdb$field_name as CAMPO');
      SQL.Add('from RDB$RELATION_FIELDS f');
      SQL.Add('where f.rdb$relation_name = ' + QuotedStr(AnsiUpperCase(Trim(pTabela))) );
      SQL.Add('  and f.rdb$field_name    = ' + QuotedStr(AnsiUpperCase(Trim(pCampo))) );
      OpenOrExecute;

      aRetorno := (FieldByName('CAMPO').AsString <> EmptyStr);

      Close;
    end;
  finally
    Result := aRetorno;
  end;
end;

procedure TdmConexaoTargetDB.qryError(ASender: TObject;
  const AInitiator: IFDStanObject; var AException: Exception);
begin
  gLogImportacao.Add('Error: ' + #13 +
    QuotedStr(TFDQuery(ASender).Name) + ' - ' +
    AException.Message);
  MensagemErro('Erro',
    'Erro ao tentar executar script do objeto ' + QuotedStr(TFDQuery(ASender).Name) + '.' + #13#13 +
    AException.Message);
end;

procedure TdmConexaoTargetDB.UpdateGenerator(const pGeneretorName, pTableName,
  pKeyField: String);
var
  aID : Currency;
begin
  with qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(' + pKeyField +  ') as ID FROM ' + pTableName);
    OpenOrExecute;

    aID := FieldByName('ID').AsCurrency;

    ExecutarStriptDB('ALTER SEQUENCE ' + Trim(pGeneretorName) + ' RESTART WITH ' + CurrToStr(aID));
  end;

end;

{ TGenerico }

procedure TGenerico.CarregarDados;
begin
  try
    with dmConexaoTargetDB, qryDepartamento do
    begin
      Close;
      ParamByName('id').AsInteger       := ID;
      ParamByName('codigo').AsString    := Codigo;
      ParamByName('descricao').AsString := Copy(Descricao, 1, 40);
      Open;
      if not IsEmpty then
      begin
        ID        := FieldByName('id').AsInteger;
        Codigo    := FieldByName(ID_SYS_ANTER).AsString;
        Descricao := FieldByName('descricao').AsString;
        Ativo     := (FieldByName('em_uso').AsString = 'S');
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados do Departamento : ' + #13 + E.Message);
  end;
end;

constructor TGenerico.Create;
begin
  inherited Create;
  FID := 0;
  FDescricao := EmptyStr;
  FCodigo    := EmptyStr;
  FAtivo     := True;
end;

destructor TGenerico.Destroy;
begin
  inherited Destroy;
end;

function TGenerico.GetCodigo: String;
begin
  Result := FCodigo;
end;

function TGenerico.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TGenerico.GetID: Integer;
begin
  Result := FID;
end;

procedure TGenerico.SetCodigo(Value: String);
begin
  FCodigo := Trim(Value);
end;

procedure TGenerico.SetDescricao(Value: String);
begin
  FDescricao := Trim(Value);
end;

procedure TGenerico.SetID(Value: Integer);
begin
  FID := Value;
end;

{ TCBO }

constructor TCBO.Create;
begin
  inherited Create;
  FID := 0;
  FDescricao := EmptyStr;
  FCodigo    := EmptyStr;
end;

destructor TCBO.Destroy;
begin
  inherited Destroy;
end;

{ TCargoFuncao }

procedure TCargoFuncao.CarregarDados;
begin
  try
    with dmConexaoTargetDB, qryCargoFuncao do
    begin
      Close;
      ParamByName('codigo').AsString := Codigo;
      Open;
      if not IsEmpty then
      begin
        ID := FieldByName('id').AsInteger;
        Descricao      := FieldByName('descricao').AsString;
        Categoria.ID   := FieldByName('id_categ_funcional').AsInteger;
        TipoTCM.Codigo := IntToStr(FieldByName('id_tipo_cargo_tcm').AsInteger);
        VencimentoBase := FieldByName('vencto_base').AsCurrency;
        TipoSalario    := TTipoSalario(StrToInt(FieldByName('tipo_sal').AsString));
        FormaCalculo   := TFormaCalculo(StrToInt(FieldByName('forma_calc').AsString));
        BaseCalculoHoraAula := FieldByName('base_calc_hora_aula').AsInteger;
        CargaHorariaMensal  := FieldByName('carga_hor_mensal').AsInteger;
        QuantidadeVaga      := FieldByName('qtd_vaga').AsInteger;
        Escolaridade.ID     := FieldByName('id_escolaridade').AsInteger;
        CBO.ID := FieldByName('id_cbo').AsInteger;
        FatorProgramaSalario.ID := FieldByName('id_fat_prog_sal').AsInteger;
        NumeroAtoCriacao := FieldByName('num_ato_criacao').AsString;
        DataAtoCriacao   := FieldByName('data_ato_criacao').AsDateTime;
        EventoBase.ID    := FieldByName('id_evento_base').AsInteger;
        CalculaATS       := (FieldByName('calc_ats').AsString= 'S');
        CalculaATSVencimentoBase := (FieldByName('calc_ats_sobre_vencto_base').AsString = 'S');
        CalculaDecimoTerc        := (FieldByName('calc_dec_terc').AsString = 'S');
        CalculaContribSind       := (FieldByName('calc_contrib_sindical').AsString = 'S');
        Situacao       := FieldByName('situacao').AsString;
        DataAtoCriacao := FieldByName('dt_extinsao').AsDateTime;
        Observacao     := FieldByName('observacao').AsString;
        TempoATS       := FieldByName('tempo_ats').AsInteger;
        PercentualATS        := FieldByName('percent_ats').AsCurrency;
        SalarioMinimoAutomat := (FieldByName('sal_min_automatico').AsString = 'S');
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados do Cargo/Função : ' + #13 + E.Message);
  end;
end;

constructor TCargoFuncao.Create;
begin
  inherited Create;
  FCategoria := TGenerico.Create;
  FTipoTCM   := TGenerico.Create;
  FVencimentoBase := 0.0;
  FTipoSalario    := tipoSalarioUm;
  FFormaCalculo   := formaCalculoAutomatico;
  FBaseCalculoHoraAula := 1;
  FCargaHorariaMensal  := 1;
  FQuantidadeVaga      := 1;
  FEscolaridade        := TGenerico.Create;
  FCBO := TCBO.Create;
  FFatorProgramaSalario := TFatorProgramaSalario.Create;
  FNumeroAtoCriacao := EmptyStr;
  FDataAtoCriacao   := Date;
  FEventoBase       := TGenerico.Create;
  FCalculaATS           := True;  // 'S' ou 'N'
  FCalculaATSVencimentoBase := False;
  FCalculaDecimoTerc    := True;
  FCalculaContribSind   := False;
  FSalarioMinimoAutomat := False;
  FSituacao      := EmptyStr;
  FDataExtinsao  := Date;
  FObservacao    := EmptyStr;
  FTempoATS      := 0;
  FPercentualATS := 0.0;

  // Valor padrão
  FCategoria.ID        := 1;
  FCategoria.Descricao := 'AUXILIARES DE SERVICOS GERAIS';
  FCategoria.Codigo    := 'ASG - 010';

  FTipoTCM.ID        := 20;
  FTipoTCM.Descricao := 'EFETIVO CONCURSADO';
  FTipoTCM.Codigo    := '20';

  FFatorProgramaSalario.ID        := 1;
  FFatorProgramaSalario.Descricao := '1 REF. - 1 ANOS - 0.00%';
  FFatorProgramaSalario.Codigo    := '';
end;

destructor TCargoFuncao.Destroy;
begin
  if Assigned(FCategoria) then
    FCategoria.Destroy;
  if Assigned(FTipoTCM) then
    FTipoTCM.Destroy;
  if Assigned(FEscolaridade) then
    FEscolaridade.Destroy;
  if Assigned(FFatorProgramaSalario) then
    FFatorProgramaSalario.Destroy;
  if Assigned(FEventoBase) then
    FEventoBase.Destroy;
  inherited Destroy;
end;

{ TUnidadeGestora }

constructor TUnidadeGestora.Create;
begin
  inherited Create;
  FRazaoSocial    := EmptyStr;
  FCodigoContabil := '00001';
  FCNPJ           := EmptyStr;
  FTipoUnidade    := TGenerico.Create;
  FCodigoTCM      := 0;
  FFormaCalculoRecisao := formaCalculoRecisaoDois;
  FTetoVencimentoBase  := 0.0;
  FCNPJPrincipal        := EmptyStr;
  FGestorNome           := EmptyStr;
  FGestorDescricaoCargo := EmptyStr;
  FGestorServidorID     := 0;
  FDadosNoContraCheque  := False;
  FCNPJ_naGPS           := False;

  FTipoUnidade.ID        := 99;
  FTipoUnidade.Descricao := 'OUTRAS UNIDADES ADMINISTRATIVAS';
end;

destructor TUnidadeGestora.Destroy;
begin
  if Assigned(FTipoUnidade) then
    FTipoUnidade.Destroy;
  inherited Destroy;
end;

{ TUnidadeLotacao }

procedure TUnidadeLotacao.CarregarDados;
begin
  try
    with dmConexaoTargetDB, qryUnidadeLotacao do
    begin
      Close;
      ParamByName('codigo').AsString := Codigo;
      Open;
      if not IsEmpty then
      begin
        ID         := FieldByName('id').AsInteger;
        Descricao  := Trim(FieldByName('descricao').AsString);
        Tipo.ID    := FieldByName('id_tipo_unid_lotacao').AsInteger;
        Localidade := TLocalidade(StrToIntDef(FieldByName('localidade').AsString, 0));
        Regiao.ID  := FieldByName('id_regiao').AsInteger;
        Ativo      := (FieldByName('ativo').AsString = 'S');
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados da Unidade de Lotação : ' + #13 + E.Message);
  end;
end;

constructor TUnidadeLotacao.Create;
begin
  inherited Create;
  FTipo   := TGenerico.Create;
  FAtivo  := True;
  FLocalidade := localZonaUrbana;
  FRegiao     := TGenerico.Create;

  FTipo.ID        := 1;
  FTipo.Descricao := 'SEDE DO ÓRGÃO';

  FRegiao.ID        := 1;
  FRegiao.Descricao := 'SEDE';
end;

destructor TUnidadeLotacao.Destroy;
begin
  if Assigned(FTipo) then
    FTipo.Destroy;
  if Assigned(FRegiao) then
    FRegiao.Destroy;
  inherited Destroy;
end;

{ TUnidadeOrcamentaria }

constructor TUnidadeOrcamentaria.Create;
begin
  inherited Create;
  FCodigoContabil   := '00001';
  FUnidadeGestora   := TUnidadeGestora.Create;
  FFUNDEB           := False;
  FTextoDotacao     := TStringList.Create;
  FProjetoAtividade := EmptyStr;
  FAtivo            := True;

  FUnidadeGestora.ID := 1;
end;

destructor TUnidadeOrcamentaria.Destroy;
begin
  if Assigned(FUnidadeGestora) then
    FUnidadeGestora.Destroy;
  if Assigned(FTextoDotacao) then
    FTextoDotacao.Destroy;
  inherited Destroy;
end;

{ TEstadoFuncional }

constructor TEstadoFuncional.Create;
begin
  inherited Create;
  FEmAtividade    := False;
  FIniciaServidor := False;
  FCalculaSalario := False;
  FTipoMovimento  := 'A';
  FAfastamentoPrevidencia   := TGenerico.Create;
  FRetornoPrevidencia       := TGenerico.Create;
  FMovimentoDefinitivo      := False;
  FPagtoEntidadePrevidencia := False;
  FAtivo := True;
end;

destructor TEstadoFuncional.Destroy;
begin
  if Assigned(FAfastamentoPrevidencia) then
    FAfastamentoPrevidencia.Destroy;
  if Assigned(FRetornoPrevidencia) then
    FRetornoPrevidencia.Destroy;
  inherited Destroy;
end;

{ TEvento }

procedure TEvento.CarregarDados;
begin
  try
    with dmConexaoTargetDB, qryEvento do
    begin
      Close;
      ParamByName('codigo').AsString := Codigo;
      Open;

      if not IsEmpty then
      begin
        ID              := FieldByName('id').AsInteger;
        Descricao       := FieldByName('descricao').AsString;
        CodigoRubrica   := Trim(FieldByName('codigo').AsString);
        Codigo          := FieldByName(ID_SYS_ANTER).AsString;
        Tipo            := FieldByName('tipo').AsString;
        FormaCalculo    := TFormaCalculo(StrToInt(FieldByName('forma_calc').AsString));
        Categoria.ID    := FieldByName('id_categ').AsInteger;
        CategoriaTCM.ID := FieldByName('id_categ_tcm').AsInteger;

        PercentualHoraExtra   := FieldByName('percent_hora_extra').AsCurrency;
        HRSobreHoraNormal     := FieldByName('he_sobre_hora_normal').AsString;
        TipoBaseCalculo       := TTipoBaseCalculo(StrToInt(FieldByName('tipo_base_calc').AsString));
        IndiceSalarioFamilia  := (FieldByName('incide_sal_familia').AsString = 'S');
        IndiceATS             := (FieldByName('incide_ats').AsString = 'S');
        IndiceFerias          := (FieldByName('incide_ferias').AsString = 'S');
        IndiceDecimoTerceiro  := (FieldByName('incide_dec_terc').AsString = 'S');
        IndiceFalta           := (FieldByName('incide_falta').AsString = 'S');
        IndicePrevidencia     := (FieldByName('incide_previd').AsString = 'S');
        IndiceIRRF            := (FieldByName('incide_irrf').AsString = 'S');
        IndiceOutraBC1        := (FieldByName('incide_outra_bc1').AsString = 'S');
        IndiceOutraBC2        := (FieldByName('incide_outra_bc2').AsString = 'S');
        IndiceOutraBC3        := (FieldByName('incide_outra_bc3').AsString = 'S');
        ValorFixo             := FieldByName('valor_fixo').AsCurrency;
        Divisor               := FieldByName('divisor').AsCurrency;
        SubDivisor            := FieldByName('subdivisor').AsCurrency;
        Max_x_vencimentoBase  := FieldByName('max_x_vencto_base').AsCurrency;
        GeraRAIS              := (FieldByName('gera_rais').AsString = 'S');
        CopiaMesAnterior      := (FieldByName('copia_mes_anterior').AsString = 'S');
        PermiteUsuarioAlterar := (FieldByName('permitir_usuario_alter').AsString = 'S');
        SemUso                := (FieldByName('sem_uso').AsString = 'S');
        CodigoItem            := Trim(FieldByName('cont_cod_item').AsString);
        SubElementoDespesa    := FieldByName('cont_sub_elemen_desp').AsString;
        ContaCorrente         := FieldByName('cont_conta_corrente').AsString;
        BCMargemConsignada    := (FieldByName('bc_margem_consig').AsString = 'S');
        ValorBCFixa           := FieldByName('val_bc_fixa').AsCurrency;
        Natureza              := TTipoNaturezaEvento(StrToInt(FieldByName('natureza').AsString));
        Remuneracao           := FieldByName('remunerac').AsString;
        Descricao             := FieldByName('legalidade').AsString;
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados do Evento : ' + #13 + E.Message);
  end;
end;

procedure TEvento.CarregarDados_v2(aIdentificador_OLD : Integer);
var
  I : Integer;
begin
  try
    I := 0;
    with dmConexaoTargetDB, qryEvento do
    begin
      Close;
      ParamByName('codigo').AsString := Codigo;
      Open;

      if (aIdentificador_OLD > 0) and (RecordCount > 1) then
        while ( (I < 15) or ((not Eof) and (aIdentificador_OLD = FieldByName('id').AsInteger)) ) do  // Até 15 tentativas
        begin
          if (aIdentificador_OLD <> FieldByName('id').AsInteger) then
            Break;
          Next;
          Inc(I);
        end;

      if not IsEmpty then
      begin
        ID              := FieldByName('id').AsInteger;
        Descricao       := FieldByName('descricao').AsString;
        CodigoRubrica   := Trim(FieldByName('codigo').AsString);
        Codigo          := FieldByName(ID_SYS_ANTER).AsString;
        Tipo            := FieldByName('tipo').AsString;
        FormaCalculo    := TFormaCalculo(StrToInt(FieldByName('forma_calc').AsString));
        Categoria.ID    := FieldByName('id_categ').AsInteger;
        CategoriaTCM.ID := FieldByName('id_categ_tcm').AsInteger;

        PercentualHoraExtra   := FieldByName('percent_hora_extra').AsCurrency;
        HRSobreHoraNormal     := FieldByName('he_sobre_hora_normal').AsString;
        TipoBaseCalculo       := TTipoBaseCalculo(StrToInt(FieldByName('tipo_base_calc').AsString));
        IndiceSalarioFamilia  := (FieldByName('incide_sal_familia').AsString = 'S');
        IndiceATS             := (FieldByName('incide_ats').AsString = 'S');
        IndiceFerias          := (FieldByName('incide_ferias').AsString = 'S');
        IndiceDecimoTerceiro  := (FieldByName('incide_dec_terc').AsString = 'S');
        IndiceFalta           := (FieldByName('incide_falta').AsString = 'S');
        IndicePrevidencia     := (FieldByName('incide_previd').AsString = 'S');
        IndiceIRRF            := (FieldByName('incide_irrf').AsString = 'S');
        IndiceOutraBC1        := (FieldByName('incide_outra_bc1').AsString = 'S');
        IndiceOutraBC2        := (FieldByName('incide_outra_bc2').AsString = 'S');
        IndiceOutraBC3        := (FieldByName('incide_outra_bc3').AsString = 'S');
        ValorFixo             := FieldByName('valor_fixo').AsCurrency;
        Divisor               := FieldByName('divisor').AsCurrency;
        SubDivisor            := FieldByName('subdivisor').AsCurrency;
        Max_x_vencimentoBase  := FieldByName('max_x_vencto_base').AsCurrency;
        GeraRAIS              := (FieldByName('gera_rais').AsString = 'S');
        CopiaMesAnterior      := (FieldByName('copia_mes_anterior').AsString = 'S');
        PermiteUsuarioAlterar := (FieldByName('permitir_usuario_alter').AsString = 'S');
        SemUso                := (FieldByName('sem_uso').AsString = 'S');
        CodigoItem            := Trim(FieldByName('cont_cod_item').AsString);
        SubElementoDespesa    := FieldByName('cont_sub_elemen_desp').AsString;
        ContaCorrente         := FieldByName('cont_conta_corrente').AsString;
        BCMargemConsignada    := (FieldByName('bc_margem_consig').AsString = 'S');
        ValorBCFixa           := FieldByName('val_bc_fixa').AsCurrency;
        Natureza              := TTipoNaturezaEvento(StrToInt(FieldByName('natureza').AsString));
        Remuneracao           := FieldByName('remunerac').AsString;
        Descricao             := FieldByName('legalidade').AsString;
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados do Evento : ' + #13 + E.Message);
  end;
end;

procedure TEvento.CarregarDados_v2(aIdentificador_OLD : TEventoIDList);
  function EqualEvent(const aEvento : TEventoIDList; const ID : Integer) : Boolean;
  var
    I : Integer;
    aRetorno : Boolean;
  begin
    aRetorno := False;
    try
      for I := Low(aEvento) to High(aEvento) do
        if aEvento[I] = ID then
        begin
          aRetorno := True;
          Break;
        end;
    finally
      Result := aRetorno;
    end;
  end;
var
  I : Integer;
begin
  try
    I := 0;
    with dmConexaoTargetDB, qryEvento do
    begin
      Close;
      ParamByName('codigo').AsString := Codigo;
      Open;

      if (High(aIdentificador_OLD) > -1) and (RecordCount > 1) then
        while ( (I < 15) or ((not Eof) and EqualEvent(aIdentificador_OLD, FieldByName('id').AsInteger)) ) do  // Até 15 tentativas
        begin
          if not EqualEvent(aIdentificador_OLD, FieldByName('id').AsInteger) then
            Break;
          Next;
          Inc(I);
        end;

      if not IsEmpty then
      begin
        ID              := FieldByName('id').AsInteger;
        Descricao       := FieldByName('descricao').AsString;
        CodigoRubrica   := Trim(FieldByName('codigo').AsString);
        Codigo          := FieldByName(ID_SYS_ANTER).AsString;
        Tipo            := FieldByName('tipo').AsString;
        FormaCalculo    := TFormaCalculo(StrToInt(FieldByName('forma_calc').AsString));
        Categoria.ID    := FieldByName('id_categ').AsInteger;
        CategoriaTCM.ID := FieldByName('id_categ_tcm').AsInteger;

        PercentualHoraExtra   := FieldByName('percent_hora_extra').AsCurrency;
        HRSobreHoraNormal     := FieldByName('he_sobre_hora_normal').AsString;
        TipoBaseCalculo       := TTipoBaseCalculo(StrToInt(FieldByName('tipo_base_calc').AsString));
        IndiceSalarioFamilia  := (FieldByName('incide_sal_familia').AsString = 'S');
        IndiceATS             := (FieldByName('incide_ats').AsString = 'S');
        IndiceFerias          := (FieldByName('incide_ferias').AsString = 'S');
        IndiceDecimoTerceiro  := (FieldByName('incide_dec_terc').AsString = 'S');
        IndiceFalta           := (FieldByName('incide_falta').AsString = 'S');
        IndicePrevidencia     := (FieldByName('incide_previd').AsString = 'S');
        IndiceIRRF            := (FieldByName('incide_irrf').AsString = 'S');
        IndiceOutraBC1        := (FieldByName('incide_outra_bc1').AsString = 'S');
        IndiceOutraBC2        := (FieldByName('incide_outra_bc2').AsString = 'S');
        IndiceOutraBC3        := (FieldByName('incide_outra_bc3').AsString = 'S');
        ValorFixo             := FieldByName('valor_fixo').AsCurrency;
        Divisor               := FieldByName('divisor').AsCurrency;
        SubDivisor            := FieldByName('subdivisor').AsCurrency;
        Max_x_vencimentoBase  := FieldByName('max_x_vencto_base').AsCurrency;
        GeraRAIS              := (FieldByName('gera_rais').AsString = 'S');
        CopiaMesAnterior      := (FieldByName('copia_mes_anterior').AsString = 'S');
        PermiteUsuarioAlterar := (FieldByName('permitir_usuario_alter').AsString = 'S');
        SemUso                := (FieldByName('sem_uso').AsString = 'S');
        CodigoItem            := Trim(FieldByName('cont_cod_item').AsString);
        SubElementoDespesa    := FieldByName('cont_sub_elemen_desp').AsString;
        ContaCorrente         := FieldByName('cont_conta_corrente').AsString;
        BCMargemConsignada    := (FieldByName('bc_margem_consig').AsString = 'S');
        ValorBCFixa           := FieldByName('val_bc_fixa').AsCurrency;
        Natureza              := TTipoNaturezaEvento(StrToInt(FieldByName('natureza').AsString));
        Remuneracao           := FieldByName('remunerac').AsString;
        Descricao             := FieldByName('legalidade').AsString;
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados do Evento : ' + #13 + E.Message);
  end;
end;

constructor TEvento.Create;
begin
  inherited Create;
  FCodigoRubrica := EmptyStr;
  FTipo          := 'V';
  FFormaCalculo  := formaCalculoAutomatico;
  FCategoria     := TGenerico.Create;
  FCategoriaTCM  := TGenerico.Create;
  FPercentualHoraExtra  := 0.0;
  FHRSobreHoraNormal    := EmptyStr;
  FTipoBaseCalculo      := baseCalculoUm;
  FIndiceSalarioFamilia := False;
  FIndiceATS            := False;
  FIndiceFerias         := False;
  FIndiceDecimoTerceiro := False;
  FIndiceFalta          := True;
  FIndicePrevidencia    := False;
  FIndiceIRRF           := False;
  FIndiceOutraBC1       := False;
  FIndiceOutraBC2       := False;
  FIndiceOutraBC3       := False;
  FValorFixo  := 0.0;
  FDivisor    := 0.0;
  FSubDivisor := 0.0;
  FMax_x_vencimentoBase  := 1;
  FGeraRAIS              := False;
  FCopiaMesAnterior      := False;
  FPermiteUsuarioAlterar := True;
  FSemUso                := False;
  FSubElementoDespesa    := EmptyStr;
  FContaCorrente         := EmptyStr;
  FBCMargemConsignada    := False;
  FValorBCFixa := 0.0;
  FNatureza    := naturezaEventoDois;
  FRemuneracao := EmptyStr;

  FCategoria.ID        := 16;
  FCategoria.Descricao := 'OUTRA';
end;

destructor TEvento.Destroy;
begin
  if Assigned(FCategoria) then
    FCategoria.Destroy;
  if Assigned(FCategoriaTCM) then
    FCategoriaTCM.Destroy;
  inherited Destroy;
end;

{ TPessoa }

constructor TPessoa.Create;
begin
  inherited Create;
  FApelido        := EmptyStr;
  FDataNascimento := StrToDateTime('30/12/1899');
  FCPF_CNPJ       := TDocumentoGenerico.Create;
  FEndereco       := TEndereco.Create;
  FEmail          := EmptyStr;
  FTelefone       := EmptyStr;
  FNaturalidade   := TNaturalidade.Create;
  FNacionalidade  := TGenerico.Create;
  FAtiva := True;

  FNacionalidade.ID        := 10;
  FNacionalidade.Descricao := 'BRASIL';
  FNacionalidade.Codigo    := '10';
end;

destructor TPessoa.Destroy;
begin
  if Assigned(FCPF_CNPJ) then
    FCPF_CNPJ.Destroy;
  if Assigned(FEndereco) then
    FEndereco.Destroy;
  if Assigned(FNaturalidade) then
    FNaturalidade.Destroy;
  if Assigned(FNacionalidade) then
    FNacionalidade.Destroy;
  inherited Destroy;
end;

{ TEndereco }

constructor TEndereco.Create;
begin
  inherited Create;
  FNumero := EmptyStr;
  FBairro := EmptyStr;
  FCidade := EmptyStr;
  FCep    := EmptyStr;
  FUF     := EmptyStr;
  FComplemento := EmptyStr;
end;

destructor TEndereco.Destroy;
begin
  inherited Destroy;
end;

{ TNaturalidade }

constructor TNaturalidade.Create;
begin
  inherited Create;
  FUF     := EmptyStr;
end;

destructor TNaturalidade.Destroy;
begin
  inherited Destroy;
end;

{ TPessoaFisica }

constructor TPessoaFisica.Create;
begin
  inherited Create;
  FSexo     := sexoMasculino;
  FRaca     := TGenerico.Create;
  FRG       := TDocumentoRG.Create;
  FPisPasep := TDocumentoGenerico.Create;
  FCNH      := TDocumentoCNH.Create;
  FTitulo   := TDocumentoTituloEleitor.Create;
  FReservista := TDocumentoGenerico.Create;

  FEstadoCivil := TGenerico.Create;
  FConjuge     := TPessoa.Create;

  FNomePai := EmptyStr;
  FNomeMae := EmptyStr;
  FAnoChegadaAoBrasil := 0;
end;

destructor TPessoaFisica.Destroy;
begin
  if Assigned(FRaca) then
    FRaca.Destroy;
  if Assigned(FEstadoCivil) then
    FEstadoCivil.Destroy;
  if Assigned(FConjuge) then
    FConjuge.Destroy;
  if Assigned(FRG) then
    FRG.Destroy;
  if Assigned(FPisPasep) then
    FPisPasep.Destroy;
  if Assigned(FCNH) then
    FCNH.Destroy;
  if Assigned(FTitulo) then
    FTitulo.Destroy;
  if Assigned(FReservista) then
    FReservista.Destroy;
  inherited Destroy;
end;

function TPessoaFisica.GetSexo: String;
begin
  Result := SEXO_PESSOA[Self.FSexo];
end;

procedure TPessoaFisica.SetSexo(Value: String);
begin
  FSexo := sexoMasculino;
  if AnsiUpperCase(Trim(Value)) = SEXO_PESSOA[sexoFemino] then
    FSexo := sexoFemino;
end;

{ TDocumentoGenerico }

constructor TDocumentoGenerico.Create;
begin
  inherited Create;
  FDataEmissao := Now;
end;

destructor TDocumentoGenerico.Destroy;
begin
  inherited Destroy;
end;

{ TDocumentoRG }

constructor TDocumentoRG.Create;
begin
  inherited Create;
  FOrgaoEmissor := EmptyStr;
  FUF := EmptyStr;
end;

destructor TDocumentoRG.Destroy;
begin
  inherited Destroy;
end;

{ TDocumentoCNH }

constructor TDocumentoCNH.Create;
begin
  inherited Create;
  FCategoria      := EmptyStr;
  FDataVencimento := Now;
end;

destructor TDocumentoCNH.Destroy;
begin
  inherited Destroy;
end;

{ TServidor }

procedure TServidor.CarregarDados;
begin
  try
    with dmConexaoTargetDB, qryServidor do
    begin
      Close;
      ParamByName('id').AsInteger    := IDServidor;
      ParamByName('codigo').AsString := Codigo;
      Open;
      if not IsEmpty then
      begin
        IDServidor := FieldByName('id').AsInteger;
        Codigo     := Trim(FieldByName(ID_SYS_ANTER).AsString);
        ID         := FieldByName('id_pessoa_fisica').AsInteger;
        Matricula  := IntToStr(FieldByName('matricula').AsInteger);
        Efetivo    := (FieldByName('efetivo').AsString = 'S');
        Nome       := Trim(FieldByName('nome_servidor').AsString);

        if FieldByName('dt_concurso').IsNull then
          DataConcurso := StrToDateTime('30/12/1899')
        else
          DataConcurso := FieldByName('dt_concurso').AsDateTime;

        if FieldByName('dt_admissao').IsNull then
          DataAdmissao := StrToDateTime('30/12/1899')
        else
          DataAdmissao := FieldByName('dt_admissao').AsDateTime;

        if FieldByName('dt_readmissao').IsNull then
          DataReadmissao := StrToDateTime('30/12/1899')
        else
          DataReadmissao := FieldByName('dt_readmissao').AsDateTime;

        if FieldByName('docto_admissao').IsNull then
          DocumentoAdmissao := EmptyStr
        else
          DocumentoAdmissao := Trim(FieldByName('docto_admissao').AsString);

        if FieldByName('ano_prim_emprego').IsNull then
          AnoPrimeiroEmprego := EmptyStr
        else
          AnoPrimeiroEmprego := Trim(FieldByName('ano_prim_emprego').AsString);

        SituacaoTCM.ID            := FieldByName('id_situacao_tcm').AsInteger;
        SubUnidadeOrcamentaria.ID := FieldByName('id_sub_unid_orcament').AsInteger;
        UnidadeLotacao.ID         := FieldByName('id_unid_lotacao').AsInteger;
        Departamento.ID           := FieldByName('id_depto').AsInteger;
        CargoOrigem.ID            := FieldByName('id_cargo_origem').AsInteger;
        CargoAtual.ID             := FieldByName('id_cargo_atual').AsInteger;

        ReferenciaSalario := FieldByName('ref_salario').AsInteger;
        VencimentoBase    := FieldByName('vencto_base').AsCurrency;

        Escolaridade.ID := FieldByName('id_escolaridade').AsInteger;

        if FieldByName('formacao').IsNull then
          Formacao := EmptyStr
        else
          Formacao := Trim(FieldByName('formacao').AsString);

        if FieldByName('conselho_registro').IsNull then
          ConselhoRegistro := EmptyStr
        else
          ConselhoRegistro := Trim(FieldByName('conselho_registro').AsString);

        CargaHorariaMensal        := FieldByName('carga_hor_mensal').AsInteger;
        QuantidadeDependenteIRRF  := FieldByName('qtd_depend_irrf').AsInteger;
        CalculaVencimentoBase     := (FieldByName('calc_vencto_base').AsString = 'S');
        BloqueaLanctoEventoAuto   := (FieldByName('bloq_lancto_evento_auto').AsString = 'S');
        CalculaPrevidencia        := (FieldByName('calc_previd').AsString = 'S');
        CalculaIRRF               := (FieldByName('calc_irrf').AsString = 'S');
        NaoCalculaATS             := (FieldByName('nao_calcular_ats').AsString = 'S');
        CalculaSalarioCargoOrigem := (FieldByName('calc_sal_cargo_origem').AsString = 'S');
        DesvioFuncao              := (FieldByName('desvio_de_funcao').AsString = 'S');

        EstadoFuncional.ID := FieldByName('id_est_funcional').AsInteger;
        Status             := TStatusServidor( StrToIntDef(Trim(FieldByName('status').AsString), 0));
        ReferenciaSalarioInicial := FieldByName('ref_sal_inicial').AsInteger;

        if FieldByName('dt_base_calc_ats').IsNull then
          DataBaseCalculoATS := StrToDateTime('30/12/1899')
        else
          DataBaseCalculoATS := FieldByName('dt_base_calc_ats').AsDateTime;

        CategoriaSEFIP  := Trim(FieldByName('categ_sefip').AsString);
        OcorrenciaSEFIP := Trim(FieldByName('ocorrencia_sefip').AsString);
      end;
      Close;
    end;
  except
    On E : Exception do
      MensagemErro('Erro', 'Erro ao tentar carregar dados do Servidor : ' + #13 + E.Message);
  end;
end;

constructor TServidor.Create;
begin
  inherited Create;
  FIDServidor := 0;
  FMatricula  := EmptyStr;
  FEfetivo    := False;
  FDataConcurso       := StrToDateTime('30/12/1899');
  FDataAdmissao       := StrToDateTime('30/12/1899');
  FDataReadmissao     := StrToDateTime('30/12/1899');
  FDocumentoAdmissao  := EmptyStr;
  FAnoPrimeiroEmprego := EmptyStr;
  FSituacaoTCM            := TGenerico.Create;
  FSubUnidadeOrcamentaria := TSubUnidadeOrcamentaria.Create;
  FUnidadeLotacao         := TUnidadeLotacao.Create;
  FDepartamento := TGenerico.Create;
  FCargoOrigem  := TCargoFuncao.Create;
  FCargoAtual   := TCargoFuncao.Create;
  FReferenciaSalario := 0;
  FVencimentoBase    := 0.0;
  FEscolaridade      := TGenerico.Create;
  FFormacao          := EmptyStr;
  FConselhoRegistro  := EmptyStr;
  FCargaHorariaMensal       := 180;
  FQuantidadeDependenteIRRF := 0;
  FCalculaVencimentoBase    := True;
  FBloqueaLanctoEventoAuto  := False;
  FCalculaPrevidencia       := True;
  FCalculaIRRF              := True;
  FEstadoFuncional := TEstadoFuncional.Create;
  FStatus          := statusServidorUm;
  FNaoCalculaATS             := False;
  FCalculaSalarioCargoOrigem := False;
  FReferenciaSalarioInicial  := 0;
  FDataBaseCalculoATS        := StrToDateTime('30/12/1899');
  FDesvioFuncao    := False;
  FCategoriaSEFIP  := EmptyStr;
  FOcorrenciaSEFIP := EmptyStr;
end;

destructor TServidor.Destroy;
begin
  if Assigned(FSituacaoTCM) then
    FSituacaoTCM.Destroy;
  if Assigned(FSubUnidadeOrcamentaria) then
    FSubUnidadeOrcamentaria.Destroy;
  if Assigned(FUnidadeLotacao) then
    FUnidadeLotacao.Destroy;
  if Assigned(FDepartamento) then
    FDepartamento.Destroy;
  if Assigned(FCargoOrigem) then
    FCargoOrigem.Destroy;
  if Assigned(FCargoAtual) then
    FCargoAtual.Destroy;
  if Assigned(FEscolaridade) then
    FEscolaridade.Destroy;
  if Assigned(FEstadoFuncional) then
    FEstadoFuncional.Destroy;
  inherited Destroy;
end;

{ TDocumentoTituloEleitor }

constructor TDocumentoTituloEleitor.Create;
begin
  inherited Create;
  FZona  := EmptyStr;
  FSecao := EmptyStr;
end;

destructor TDocumentoTituloEleitor.Destroy;
begin
  inherited Destroy;
end;

{ TFatorProgramaSalario }

constructor TFatorProgramaSalario.Create;
begin
  inherited Create;
  FQuantidadeReferencia := 0;
  FReferenciaInicial    := 0;
  FQuantidadeAno        := 0;
  FPercentual           := 0.0;
  FAutomatico           := True;
  FIncorporaVenctoBase  := False;
end;

destructor TFatorProgramaSalario.Destroy;
begin
  inherited Destroy;
end;

{ TEntidadeFinanceira }

constructor TEntidadeFinanceira.Create;
begin
  inherited Create;
  FEBanco := True;
  FBanco  := TGenerico.Create;
  FAgencia        := EmptyStr;
  FNumeroConta    := EmptyStr;
  FNumeroConvenio := EmptyStr;
  FCodigoEmpresa  := EmptyStr;
  FCNPJ           := EmptyStr;
end;

destructor TEntidadeFinanceira.Destroy;
begin
  if Assigned(FBanco) then
    FBanco.Destroy;
  inherited Destroy;
end;

{ TSubUnidadeOrcamentaria }

constructor TSubUnidadeOrcamentaria.Create;
begin
  inherited Create;
  FAbreviacao := EmptyStr;
  FVinculo    := tipoVinculoUm;
  FUnidadeOrcamentaria := TUnidadeOrcamentaria.Create;
  FSetor := TGenerico.Create;
  FTipoPrevidencia   := False;
  FContribIndividual := False;
  FCodigoOrgaoBanco  := EmptyStr;
  FEventoBase := TGenerico.Create;
  FCalculaATS := False;
  FCalculaSalarioFamilia := False;
  FDescontoIRRF := False;
  FPagaRecisao  := False;
  FInativos     := False;
  FGeraRAIS     := False;
  FTetoVencimentoBase := 0.0;
  FTetoSalario        := 0.0;
  FPagamentoFUNDEB := False;
  FGeraDIRF        := False;
  FGeraGFIP        := False;
end;

destructor TSubUnidadeOrcamentaria.Destroy;
begin
  if Assigned(FUnidadeOrcamentaria) then
    FUnidadeOrcamentaria.Destroy;
  if Assigned(FSetor) then
    FSetor.Destroy;
  if Assigned(FEventoBase) then
    FEventoBase.Destroy;
  inherited Destroy;
end;

{ TContaBancoServidor }

constructor TContaBancoServidor.Create;
begin
  inherited Create;
  FIDConta   := 0;
  FTipoConta := tipoContaCorrente;
  FServidor  := TServidor.Create;
end;

destructor TContaBancoServidor.Destroy;
begin
  if Assigned(FServidor) then
    FServidor.Destroy;
  inherited Destroy;
end;

{ TDependente }

constructor TDependente.Create;
begin
  inherited Create;
  FServidor   := TServidor.Create;
  FParentesco := parentescoOutros;
  FRegistroCartorio    := TRegistroCartorio.Create;
  FEstudante           := False;
  FDeficiente          := False;
  FAtivoSalarioFamilia := False;
  FAtivoIRRF           := False;
  FPercentualPensaoAliment := 0.0;
  FValorPensaoAliment      := 0.0;
end;

destructor TDependente.Destroy;
begin
  if Assigned(FServidor) then
    FServidor.Destroy;
  if Assigned(FRegistroCartorio) then
    FRegistroCartorio.Destroy;
  inherited Destroy;
end;

{ TCartorio }

constructor TCartorio.Create;
begin
  inherited Create;
  FCidade := EmptyStr;
  FUF     := EmptyStr;
end;

destructor TCartorio.Destroy;
begin
  inherited Destroy;
end;

{ TRegistroCartorio }

constructor TRegistroCartorio.Create;
begin
  inherited Create;
  FNumero := EmptyStr;
  FLivro  := EmptyStr;
  FFolha  := EmptyStr;
end;

destructor TRegistroCartorio.Destroy;
begin
  inherited Destroy;
end;

{ TInicializaMesServidor }

function TInicializaMesServidor.GetBaseCalculoHoraAula: Integer;
begin
  Result := CargoFuncao.BaseCalculoHoraAula;
end;

function TInicializaMesServidor.GetBloqueaLanctoEventoAuto: Boolean;
begin
  Result := FServidor.BloqueaLanctoEventoAuto;
end;

function TInicializaMesServidor.GetCalculaATSVencimentoBase: Boolean;
begin
  Result := CargoFuncao.CalculaATSVencimentoBase;
end;

function TInicializaMesServidor.GetCalculaIRRF: Boolean;
begin
  Result := FServidor.CalculaIRRF;
end;

function TInicializaMesServidor.GetCalculaPrevidencia: Boolean;
begin
  Result := FServidor.CalculaPrevidencia;
end;

function TInicializaMesServidor.GetCalculaVencimentoBase: Boolean;
begin
  Result := FServidor.CalculaVencimentoBase;
end;

function TInicializaMesServidor.GetCargaHorariaMensal: Integer;
begin
  Result := FServidor.CargaHorariaMensal;
end;

function TInicializaMesServidor.GetCargoFuncao: TCargoFuncao;
begin
  Result := FServidor.CargoOrigem;
end;

function TInicializaMesServidor.GetCategoriaSEFIP: String;
begin
  Result := FServidor.CategoriaSEFIP;
end;

function TInicializaMesServidor.GetDataAdimissao: TDateTime;
begin
  Result := FServidor.DataAdmissao;
end;

function TInicializaMesServidor.GetDataBaseCalculoATS: TDateTime;
begin
  Result := FServidor.DataBaseCalculoATS;
end;

function TInicializaMesServidor.GetDepartamento: TGenerico;
begin
  Result := FServidor.Departamento;
end;

function TInicializaMesServidor.GetDesvioFuncao: Boolean;
begin
  Result := FServidor.DesvioFuncao;
end;

function TInicializaMesServidor.GetEfetivo: Boolean;
begin
  Result := FServidor.Efetivo;
end;

function TInicializaMesServidor.GetEstadoFuncional: TEstadoFuncional;
begin
  Result := FServidor.EstadoFuncional;
end;

function TInicializaMesServidor.GetFormaCalculo: TFormaCalculo;
begin
  Result := CargoFuncao.FormaCalculo;
end;

function TInicializaMesServidor.GetNaoCalculaATS: Boolean;
begin
  Result := FServidor.NaoCalculaATS;
end;

function TInicializaMesServidor.GetOcorrenciaSEFIP: String;
begin
  Result := FServidor.OcorrenciaSEFIP;
end;

function TInicializaMesServidor.GetQuantidadeDependenteIRRF: Integer;
begin
  Result := FServidor.QuantidadeDependenteIRRF;
end;

function TInicializaMesServidor.GetSituacaoTCM: TGenerico;
begin
  Result := FServidor.SituacaoTCM;
end;

function TInicializaMesServidor.GetSubUnidadeOrcamentaria: TSubUnidadeOrcamentaria;
begin
  Result := FServidor.SubUnidadeOrcamentaria;
end;

function TInicializaMesServidor.GetTipoSalario: TTipoSalario;
begin
  Result := CargoFuncao.TipoSalario;
end;

function TInicializaMesServidor.GetUnidadeLocacao: TUnidadeLotacao;
begin
  Result := FServidor.UnidadeLotacao;
end;

function TInicializaMesServidor.GetVencimentoBase: Currency;
begin
  Result := FServidor.VencimentoBase;
end;

procedure TInicializaMesServidor.SetBaseCalculoHoraAula(Value: Integer);
begin
  CargoFuncao.BaseCalculoHoraAula := Value;
end;

procedure TInicializaMesServidor.SetCalculaVencimentoBase(Value: Boolean);
begin
  FServidor.CalculaVencimentoBase := Value;
end;

procedure TInicializaMesServidor.SetCargoFuncao(Value: TCargoFuncao);
begin
  FServidor.CargoOrigem := Value;
end;

procedure TInicializaMesServidor.SetFormaCalculo(Value: TFormaCalculo);
begin
  CargoFuncao.FormaCalculo := Value;
end;

procedure TInicializaMesServidor.SetTipoSalario(Value: TTipoSalario);
begin
  CargoFuncao.TipoSalario := Value;
end;

procedure TInicializaMesServidor.SetVencimentoBase(Value: Currency);
begin
  FServidor.VencimentoBase := Value;
end;

procedure TInicializaMesServidor.CarregarDados;
begin
  ;
end;

constructor TInicializaMesServidor.Create;
begin
  inherited Create;
  FAnoMes    := EmptyStr;
  FServidor  := TServidor.Create;
  FRubrica   := EmptyStr;
  FCargoFuncao2      := TCargoFuncao.Create;
  FDiasTrabalhados   := 0;
  FDataMovimento1    := StrToDateTime('30/12/1899');
  FTipoMovimento1    := tipoMovimentoNulo;
  FDataMovimento2    := StrToDateTime('30/12/1899');
  FTipoMovimento2    := tipoMovimentoNulo;
  FTempoServico      := EmptyStr;
  FProgressoSalarial := TProgressoSalarial.Create;
  FQuantidadeDependenteSalFamilia   := 0;
  FQuantidadeDependentePAlimentacao := 0;
  FTempoServicoATS      := EmptyStr;
  FDataPrimeiraAdmissao := StrToDateTime('30/12/1899');
end;

destructor TInicializaMesServidor.Destroy;
begin
  if Assigned(FServidor) then
    FServidor.Destroy;
  if Assigned(FCargoFuncao2) then
    FCargoFuncao2.Destroy;
  if Assigned(FProgressoSalarial) then
    FProgressoSalarial.Destroy;
  inherited Destroy;
end;

{ TProgressoSalarial }

constructor TProgressoSalarial.Create;
begin
  inherited Create;
  FID    := 1;
  FCargo := TCargoFuncao.Create;
  FValor := 0.0;
end;

destructor TProgressoSalarial.Destroy;
begin
  if Assigned(FCargo) then
    FCargo.Destroy;
  inherited Destroy;
end;

{ TBaseCalculoMesServidor }

constructor TBaseCalculoMesServidor.Create;
begin
  inherited Create;
  FInicializaMes := TInicializaMesServidor.Create;
  FParcela       := '0';
  FCargaHorariaFaltaProfessor := 0;
  FBaseCalculoSalarioFamilia  := 0.0;
  FBaseCalculoATS      := 0.0;
  FBaseCalculoFerias   := 0.0;
  FBaseCalculoDecTerceito := 0.0;
  FBaseCalculoFalta       := 0.0;
  FBaseCalculoPrevidencia := 0.0;
  FBaseCalculoIRRF   := 0.0;
  FBaseCalculoOutra1 := 0.0;
  FBaseCalculoOutra2 := 0.0;
  FBaseCalculoOutra3 := 0.0;
  FTotalVencimento := 0.0;
  FTotalDesconto   := 0.0;
  FSalarioLiquido  := 0.0;
  FDataPagamento   := StrToDateTime('30/12/1899');
end;

destructor TBaseCalculoMesServidor.Destroy;
begin
  if Assigned(FInicializaMes) then
    FInicializaMes.Destroy;
  inherited Destroy;
end;

{ TEventoBaseCalculoMesServidor }

constructor TEventoBaseCalculoMesServidor.Create;
begin
  inherited Create;
  FBaseCalculoMesServidor := TBaseCalculoMesServidor.Create;
  FEventoBaseCalculo      := TEvento.Create;
  FQuantidade := 0.0;
  FValor      := 0.0;
  FObservacao := EmptyStr;
end;

destructor TEventoBaseCalculoMesServidor.Destroy;
begin
  if Assigned(FBaseCalculoMesServidor) then
    FBaseCalculoMesServidor.Destroy;
  if Assigned(FEventoBaseCalculo) then
    FEventoBaseCalculo.Destroy;
  inherited Destroy;
end;

function TEventoBaseCalculoMesServidor.GetEventoID: Integer;
begin
  Result := FEventoBaseCalculo.ID;
end;

{ TEventoFixoServidor }

constructor TEventoFixoServidor.Create;
begin
  inherited Create;
  FServidor   := TServidor.Create;
  FEvento     := TEvento.Create;
  FQuantidade := 0.0;
  FValor      := 0.0;
  FObservacao      := EmptyStr;
  FValidadeInicial := FormatDateTime('YYYYMM', Date);
  FValidadeFinal   := '209912';
  FCalcularDecimoTerc := False;
  FParticipa          := True;
end;

destructor TEventoFixoServidor.Destroy;
begin
  if Assigned(FServidor) then
    FServidor.Destroy;
  if Assigned(FEvento) then
    FEvento.Destroy;
  inherited Destroy;
end;

end.
