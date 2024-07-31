import 'dart:io';
import "./utils/command_parser.dart";
import "./utils/db_executor.dart";

Future<void> main(List<String> arguments) async {
  await DbHelper.handleInit();
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
