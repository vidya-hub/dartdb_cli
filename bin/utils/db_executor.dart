import 'dart:io';

import '../services/db_services.dart';
import './constants.dart';

class DbExecutor {
  static void showHelp() {
    stdout.write('\n DART DB CLI \n');
    for (var command in (Constants.commands).entries) {
      stdout.write('  ${command.key}: ${command.value} \n');
    }
  }

  static Future<String> registerUser({
    required String userName,
    required String password,
  }) async {
    return await DbService.createUser(
      userName: userName,
      password: password,
    );
  }

  static Future<String> loginUser({
    required String userName,
    required String password,
  }) async {
    return await DbService.loginUser(
      userName: userName,
      password: password,
    );
  }
}
