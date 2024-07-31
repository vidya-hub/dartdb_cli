import 'dart:io';

import '../services/db_services.dart';
import '../services/hive_service.dart';
import './constants.dart';

class DbHelper {
  static void showHelp() {
    print('\n DART DB CLI \n');
    for (var command in (Constants.commands).entries) {
      print('  ${command.key}: ${command.value} \n');
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

  static Future<String> execQuery({
    required String userName,
    required String password,
    required String query,
  }) async {
    return await DbService.callQuery(
      userName: userName,
      password: password,
      query: query,
    );
  }

  static Future<Map<String, String>> getUserInput() async {
    stdout.write(" UserName : ");
    var userName = stdin.readLineSync();
    if (userName == null || userName.isEmpty) {
      stdout.write(" Please Enter UserName : ");
      userName = stdin.readLineSync();
      if (userName == null || userName.isEmpty) {
        await exitCli();
      }
    }
    stdout.write(" Password : ");
    var password = stdin.readLineSync();
    if (password == null || password.isEmpty) {
      stdout.write(" Please Enter Password : ");
      password = stdin.readLineSync();
      if (password == null || password.isEmpty) {
        await exitCli();
      }
    }
    return {
      "userName": userName ?? "",
      "password": password ?? "",
    };
  }

  static Future<void> handleInit() async {
    await HiveService.init();
    String? currentUserName = HiveService.getUserName;
    if (currentUserName != null) {
      stdout.writeln(" \n Hey $currentUserName!..");
    } else {
      stdout.write('\n 1. Login \n');
      stdout.write(' 2. Register \n');
      stdout.write(" 3. exit \n");
      stdout.write('\n Please choose an option: ');
      var input = stdin.readLineSync();
      var inputData = input?.trim();
      switch (inputData) {
        case "1":
          Map<String, String> userInputData = await getUserInput();
          String response = await loginUser(
            userName: userInputData["userName"] ?? "",
            password: userInputData["password"] ?? "",
          );
          print(response);

        case "2":
          Map<String, String> userInputData = await getUserInput();
          String response = await registerUser(
            userName: userInputData["userName"] ?? "",
            password: userInputData["password"] ?? "",
          );
          print(response);
        default:
          await exitCli();
      }
    }
  }

  static exitCli() async {
    await HiveService.closeBox();
    exit(0);
  }
}
