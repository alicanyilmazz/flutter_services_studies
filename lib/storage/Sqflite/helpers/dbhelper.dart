import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/storage/Sqflite/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DbHelper{

  Database _db;

  Future<Database> get db async {
    if(_db==null)
    {
      _db=await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
      String dbPath=join(await getDatabasesPath(),"commerce.db");
      var eTradeDb=await openDatabase(dbPath,version: 1,onCreate: createDb);
      return eTradeDb;
  }

  void createDb(Database db, int version) async {
    await db.execute("CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,description TEXT,unitPrice REAL)");
  }

  Future<List<Product>> getProducts() async{
    Database db=await this.db;
    var result=await db.query('products');
    return List.generate(result.length, (index){
      return Product.fromObject(result[index]);
    });
  }

  Future<int> insert(Product product) async{
    Database db=await this.db;
    var result=await db.insert("products",product.toMap());
    return result;
  }

  Future<int> delete(int id) async{
    Database db=await this.db;
    //var result=await db.rawDelete("delete from products where id=$id");
    var result=await db.delete("products",where:"id=?",whereArgs: [id]);
    return result;
  }

  Future<int> update(Product product) async{
    Database db=await this.db;
    var result=await db.update("products", product.toMap(),where: "id=?",whereArgs: [product.id]);
    return result;
  }

}