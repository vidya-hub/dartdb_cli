import 'dart:io';
import './services/hive_service.dart';
import "./utils/command_parser.dart";

Future<void> main(List<String> arguments) async {
  await HiveService.init();

  while (true) {
    stdout.write('\ndartDbCli> ');
    var input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      continue;
    }
    var inputData = input.trim();
    CommandParser parser = CommandParser(inputData);
    await parser.parse();
  }
}
