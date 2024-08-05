import 'dart:io';

import 'constants.dart';
import './db_executor.dart';
import '../services/hive_service.dart';

class CommandParser {
  final String query;

  const CommandParser(this.query);

  Future<void> parse() async {
    if (Constants.help.hasMatch(query)) {
      DbHelper.showHelp();
    } else if (Constants.whoami.hasMatch(query)) {
      print("\n ${HiveService.getUserName}");
    } else if (Constants.clear.hasMatch(query)) {
      stdout.write('\x1B[2J\x1B[0;0H');
    } else if (Constants.logout.hasMatch(query)) {
      print('\n Logout Successfully! \n');
      await HiveService.clearDbCreds();
      await DbHelper.handleInit();
    } else if (Constants.exitExp.hasMatch(query)) {
      print('\n Goodbye! \n');
      await DbHelper.exitCli();
    } else {
      String response = await DbHelper.execQuery(
        userName: HiveService.getUserName ?? "",
        password: HiveService.getPassword ?? "",
        query: query,
      );
      print(response);
      // print(
      //   'Unknown command: $query. Type "help" to see available commands.',
      // );
    }
  }
}
