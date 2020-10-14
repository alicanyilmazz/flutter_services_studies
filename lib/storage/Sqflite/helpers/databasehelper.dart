import 'dart:async';
import 'package:flutterstudy/storage/Sqflite/models/student.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _studentTable="student";
  String _columnID="id";
  String _columnName="name";
  String _columnSurname="surname";
  int _columnGrade=6;


  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper.internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  _initializeDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory(); // "C://Users/alican/"
    String db_path = join(folder.path,'student.db');

    openDatabase(db_path,version:1,onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
     await db.execute("CREATE TABLE $_studentTable ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT,$_columnName TEXT, $_columnSurname TEXT , $_columnGrade INTEGER");
  }

 Future<int> addStudent(Student student) async{
    var db=await _getDatabase();
    var res=await db.insert(_studentTable, student.toMap());
    return res;
  }

  Future<List<Map<String,dynamic>>> getStudents() async{
    var db=await _getDatabase();
    var res= await db.query(_studentTable,orderBy: '$_columnID DESC');
    return res;
  }

  Future updateStudent(Student student) async{
    var db=await _getDatabase();
    var res= await db.update(_studentTable,student.toMap(),where: '$_columnID =?',whereArgs: [student.id]);
    return res;
  }

  Future<int> deleteStudent(int id) async{
    var db=await _getDatabase();
    var res=await db.delete(_studentTable,where: '$_columnID=?',whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllTable() async{
    var db=await _getDatabase();
    var res=await db.delete(_studentTable);
    return res;
  }


}
