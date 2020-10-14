const String queryAbout = r'''
query queryAbout($limit: Int = 1) {
  table_about(limit: $limit) {
    id
    appname
    appversion
    appphone
    appmail
    apppoweredby
  }
}
''';

const String subAbout = r'''
subscription subAbout($limit: Int = 1) {
  table_about(limit: $limit) {
    id
    appname
    appversion
    appphone
    appmail
    apppoweredby
  }
}
''';