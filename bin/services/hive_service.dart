import 'package:hive/hive.dart';
import 'dart:io';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  static Box? _box;
  static final String userNameKey = "userName";
  static final String passwordKey = "password";

  // Private constructor
  HiveService._internal();

  // Factory constructor
  factory HiveService() {
    return _instance;
  }

  // Initialize Hive
  static Future<void> init() async {
    var path = Directory.current.path;
    Hive.init(path);
    await _openBox("dartDb");
    String? currentUserName = HiveService.getUserName;
    if (currentUserName != null) {
      stdout.writeln(" \n Hey $currentUserName!..");
    }
  }

  // Open a box
  static Future<Box> _openBox(String boxName) async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox(boxName);
    }
    return _box!;
  }

  // Get the box
  static Box get box {
    if (_box == null) {
      throw Exception("Box is not opened. Call openBox() first.");
    }
    return _box!;
  }

  // Close the box
  Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _box = null;
    }
  }

  static String? get getUserName {
    return _box?.get(userNameKey);
  }

  static saveDbStorage({
    required String userName,
    required String password,
  }) {
    HiveService.box.put(userNameKey, userName);
    HiveService.box.put(passwordKey, password);
  }
}
