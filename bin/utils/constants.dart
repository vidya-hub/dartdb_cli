class Constants {
  static String lineBreakChar = ";";
  static final Map<String, String> commands = {
    "create db <name>": "to create new database with <name>",
    "list databases": "list all databases",
    "get collections from <dbName>": "get Collection list from <dbName>",
    "create collection <dbName>.<collectionName>":
        "to create new collection with <collectionName> in <dbName>",
    "create collection <dbName>.<collectionName>.schema(params: [\"param1\", \"param2\", ...], types: {\"param1\": \"type\", \"param2\": \"type\", ...})":
        "to create a new collection with <collectionName> in <dbName> with a schema definition.\n"
            "Example: create collection myDatabase.myCollection.schema(params: [\"name\", \"age\", \"email\", \"isAvailable\"], types: {\"name\": \"string\", \"age\": \"int\", \"email\": \"string\", \"isAvailable\": true})",
    "whoami": "To show logged userName",
    "clear": "clear the screen",
    "logout": "Logout current DB user",
    'exit': 'Exits the CLI application.',
  };
  static RegExp help = RegExp(r'help');
  static RegExp whoami = RegExp(r'whoami');
  static RegExp clear = RegExp(r'clear');
  static RegExp exitExp = RegExp(r'exit');
  static RegExp logout = RegExp(r'logout');
}
