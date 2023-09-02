import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_project/modules/resetpasswordscreen.dart';
import 'package:training_project/modules/signupscreen.dart';
import 'package:training_project/shared/components/components/defaultbutton.dart';
import 'package:training_project/shared/components/components/defaulttextfield.dart';
class DB
{
late Database database;
void createDatabase() async
{
  database = await openDatabase(
    'todo.db',
    version: 1,
    onCreate: (db, version) async {
      print("database created");
      // await db.execute(
      //   'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,status TEXT) '
      // );
      db.execute('CREATE TABLE  (id INTEGER PRIMARY KEY,title TEXT,date TEXT,status TEXT,time TEXT) ').then((value) {
        print("Table created");
      }).catchError((onError){
        print("error when creating Table ${onError.toString()}");
      });
    },
    onOpen: (db) async{
      print("database opened");
    },
  );
}

Future inserttoDB(
    {
      required String date,
      required String time,
      required String title,

    }) async
{
  return await database.transaction(
          (txn) {
        txn.rawInsert('INSERT INTO  tasks(title,date,time,status) VALUES("$title","$date","$time","new")').then((value) {
          print("$value is inserted");
        }).catchError((error){
          print("${error.toString()} my error");
        });
        return Future(() => null);
      }
  );
}
Future<void> deleteTable() async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'tasks',
    // // Use a `where` clause to delete a specific dog.
    // where: 'id = ?',
    // // Pass the Dog's id as a whereArg to prevent SQL injection.
    // whereArgs: [id],
  ).then((value) {
    print("table deleted");
  });
}
Future<void> deleteItem(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'tasks',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  ).then((value) {
    print("item : $value deleted");
  });
}

}
