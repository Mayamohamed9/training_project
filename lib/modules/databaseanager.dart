import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_project/modules/resetpasswordscreen.dart';
import 'package:training_project/modules/signupscreen.dart';
import 'package:training_project/shared/components/components/defaultbutton.dart';
import 'package:training_project/shared/components/components/defaulttextfield.dart';
class DB
{
late Database database;
List<Map> info =[] ;
void createDatabase()
{
   openDatabase(
    'dataMe.db',
    version: 1,
    onCreate: (database, version) {
      print("database created");

       database.execute(
          'CREATE TABLE info (id INTEGER PRIMARY KEY,name TEXT,email TEXT,phone TEXT,password TEXT,age INTEGER, height NUMERIC) ')
          .then((value) {
        print("Table created");
      }).catchError((onError) {
        print("error when creating Table ${onError.toString()}");
      });
    },
    onOpen: (database) {
      getDataFromDatabase(database).then((value) {
        info = value;
        print(info);

        //emit(todoGetState());
      });
      print("database opened");
    },

  ).then((value){
    database = value;
   // emit(todoCreateState());
  });

}

Future inserttoDB(
    {
      required String name,
      required String email,
      required String phone,
      required String password,
      required int age,
      required int height,

    }) async
{
  await database.transaction(
          (txn) {
        txn.rawInsert('INSERT INTO info(name,email,phone,password,age,height) VALUES("$name","$email","$phone","$password","$age","$height")').
        then((value) {
          print("$value is inserted");
         // emit(todoInsertState());
          getDataFromDatabase(database).then((value){

            info = value;
            print(info);

            //emit(todoGetState());
          });
        }).catchError((error){
          print("${error.toString()} my error");
        });
        return Future(() => null);
      }
  );
}

Future<List<Map>> getDataFromDatabase(database) async
{
  List<Map> info = await database.rawQuery('SELECT * FROM info');
  return [];

}


Future<void> deleteTable() async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'info',
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
