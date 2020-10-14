const String queryContact = '''
query queryContacts {
  table_contacts {
    id
    name
    phone
  }
}
''';

const String subContact = '''
subscription subContact {
  table_contacts {
    id
    name
    phone
  }
}
''';

const String addContact = r'''
mutation mutationContact($name: String = "", $phone: String = "") {
  insert_table_contacts(objects: {name: $name, phone: $phone}) {
    affected_rows
  }
}
''';