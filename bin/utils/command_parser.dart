import 'dart:io';

import 'constants.dart';
import './db_executor.dart';

class CommandParser {
  final String query;

  const CommandParser(this.query);

  Future<void> parse() async {
    if (Constants.login.hasMatch(query)) {
      final match = Constants.login.firstMatch(query);
      final userName = match?.group(1);
      final password = match?.group(2);
      if (userName != null && password != null) {
        String response = await DbExecutor.loginUser(
          userName: userName,
          password: password,
        );
        print(response);
      }
    } else if (Constants.register.hasMatch(query)) {
      final match = Constants.register.firstMatch(query);
      final userName = match?.group(1);
      final password = match?.group(2);
      print("UserName $userName Password $password");
      if (userName != null && password != null) {
        String response = await DbExecutor.registerUser(
          userName: userName,
          password: password,
        );
        print(response);
      }
    } else if (Constants.help.hasMatch(query)) {
      DbExecutor.showHelp();
    } else if (Constants.exitExp.hasMatch(query)) {
      print('\n Goodbye! \n');
      exit(0);
    } else {
      print(
        'Unknown command: $query. Type "help" to see available commands.',
      );
    }
  }
}
