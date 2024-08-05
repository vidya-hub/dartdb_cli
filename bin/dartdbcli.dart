import 'dart:io';
import "./utils/command_parser.dart";
import "./utils/db_executor.dart";
import "./utils/constants.dart";

Future<void> main(List<String> arguments) async {
  await DbHelper.handleInit();
  while (true) {
    List<String> input = [];
    stdout.write('\ndartDbCli> ');

    while (true) {
      String? line = stdin.readLineSync();
      if (line == null || line.trim().isEmpty) {
        break;
      }
      if (line.endsWith(Constants.lineBreakChar)) {
        input.add(line);
        break;
      }
      input.add(line);

      stdout.write('\n         > ');
      continue;
    }

    if (input.isEmpty) {
      continue;
    }

    var inputData = input.join("\n").trim().replaceAll(
          Constants.lineBreakChar,
          "",
        );
    inputData = inputData.replaceAll(
      "\n",
      " ",
    );
    if (inputData.isEmpty) {
      continue;
    }

    CommandParser parser = CommandParser(inputData);
    await parser.parse();
  }
}
