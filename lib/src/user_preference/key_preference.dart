enum KeyPreferences {
  //Responsavel por setar a pasta que vai ser baixada os download
  downloadFolder(key: 'downloadFolder'),
  //Responsavel por pausar todos os downloads
  downloadPauseAll(key: 'downloadPause', defaultValue: false),
  isShowWarningDownload(key: 'isShowWarningDownload'),
  // marca se deve exibir a introdução
  isBetaSearch(key: 'isBetaSearch'),
  // marca se deve exibir a introdução
  isIntruce(key: 'isIntruce'),
  // salva o objeto blocklist que contem a lista de mangas bloqueado e +18
  blockList(key: 'blockList'),
  //salva as iniciais do avatar do usuario
  avatar(key: 'avatar'),
  //dados da config atual do app
  configApp(key: 'ConfigApp'),
  // dia da ultima sugestão que foi enviada do app em int
  sugestao(key: 'sugestao'),
  // token de fcm usado para notificação
  tonkenFcm(key: 'tonkenFcm'),
  //Salvar o usuario logado
  user(key: 'user'),
  //versão atual do banco local.
  versionDatabase(key: 'versionDatabase', defaultValue: '1.0'),
  // indica se o filtro de obras +18 está ativo
  filterContentOver18(
    key: 'filterContentOver18',
    defaultValue: true,
  ),
  //mostrar aviso de mostra opção leitor
  mostraAvisoLeitor(key: 'mostraAvisoLeitor', defaultValue: true),
  // inverte a listagem capitulos no manga
  invertCapitulos(key: 'invertCapitulos'),
  // data da ultima ADS em timestaimp
  ultimaADS(key: 'ultimaADS'),
  // data da ultima sincronização em timestaimp
  ultimaSincronizacao(
    key: 'ultimaSincronizacao',
    defaultValue: '',
  ),
  // salva a pagina de onde parou nos capitulos
  salvePag(key: 'spc'),
  // Preferencias do usuario
  prefsUser(key: 'UserConfigModel'),
  // Muda o layout da pesquisa avançada
  selectLayoutSearch(key: 'selectLayoutSearch', defaultValue: false),
  // Histórico da pesquisa avançada
  searchHistory(key: 'searchHistory'),
  // indice do tema atual em int
  theme(key: 'themeApp', defaultValue: 0);

  final String key;
  final dynamic defaultValue;

  const KeyPreferences({required this.key, this.defaultValue});
}
