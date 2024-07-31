import 'package:hive/hive.dart';
import 'dart:io';
import '../utils/db_executor.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  static Box? _dbCredsBox;
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
    await _openBox("dbCreds");
  }

  // Open a box
  static Future<Box> _openBox(String boxName) async {
    if (_dbCredsBox == null || !_dbCredsBox!.isOpen) {
      _dbCredsBox = await Hive.openBox(boxName);
    }
    return _dbCredsBox!;
  }

  // Get the box
  static Box get box {
    if (_dbCredsBox == null) {
      throw Exception("Box is not opened. Call openBox() first.");
    }
    return _dbCredsBox!;
  }

  // Close the box
  static Future<void> closeBox() async {
    if (_dbCredsBox != null && _dbCredsBox!.isOpen) {
      await _dbCredsBox!.close();
      _dbCredsBox = null;
    }
  }

  static String? get getUserName {
    return _dbCredsBox?.get(userNameKey);
  }

  static String? get getPassword {
    return _dbCredsBox?.get(passwordKey);
  }

  static saveDbCreds({
    required String userName,
    required String password,
  }) {
    _dbCredsBox?.delete(userNameKey);
    _dbCredsBox?.delete(passwordKey);
    _dbCredsBox?.put(userNameKey, userName);
    _dbCredsBox?.put(passwordKey, password);
  }

  static clearDbCreds() {
    _dbCredsBox?.delete(userNameKey);
    _dbCredsBox?.delete(passwordKey);
  }
}
