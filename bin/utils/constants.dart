class Constants {
  static final Map<String, String> commands = {
    "create db <name>": "to create new database with <name>",
    "get collections from <dbName>": "get Collection list from <dbName>",
    "create collection <dbName>.<collectionName>":
        "to create new collection with <collectionName> in <dbName>",
    "whoami": "To show logged userName",
    "logout": "Logout current DB user",
    'exit': 'Exits the CLI application.',
  };
  static RegExp help = RegExp(r'help');
  static RegExp whoami = RegExp(r'whoami');
  static RegExp exitExp = RegExp(r'exit');
  static RegExp logout = RegExp(r'logout');
}
