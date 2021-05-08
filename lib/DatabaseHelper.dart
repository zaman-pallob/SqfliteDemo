import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflitedemo/Model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._initializer();
  DatabaseHelper._initializer();
  static Database _database;
  static String table = "Mytable";
  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database == null) {
      _database = await init();
    }
    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "mydatabase.db");
    var database = openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''CREATE TABLE $table(name TEXT,age TEXT,height TEXT)''');
  }

  void insert(Model model) async {
    Database db = await _instance.db;
    db.insert(table, model.toMap());
  }

  Future<List<Map<String, dynamic>>> read() async {
    Database db = await _instance.db;
    Future<List<Map<String, dynamic>>> model;
    model = db.query(table);
    return model;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}
}
