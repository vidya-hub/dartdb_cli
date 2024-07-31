class Constants {
  static final Map<String, String> commands = {
    "register -u userName -p password":
        "To create a new database user credentials.",
    "login -u userName -p password":
        "To login with existing database user credentials.",
    "run -h": "Get info about run command",
    "run <Query>": "execute database query",
    "logout": "Logout current DB user",
    'exit': 'Exits the CLI application.',
  };
  static RegExp login = RegExp(r'login -u (\w+) -p (\w+)');
  static RegExp register = RegExp(r'register -u (\w+) -p (\w+)');
  static RegExp run = RegExp(r'run (\w+)');
  static RegExp help = RegExp(r'help');
  static RegExp exitExp = RegExp(r'exit');
  static RegExp logout = RegExp(r'logout');
}
