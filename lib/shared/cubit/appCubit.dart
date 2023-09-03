import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/shared/cubit/appStates.dart';
import 'package:sqflite/sqflite.dart';


class CairoTemp{
  String name;
  double temp;

  CairoTemp(this.name, this.temp);
}

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(infoInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  final dio = Dio();
  bool isLoading = false;

  CairoTemp cairo = CairoTemp("", 0);




  bool ispass=true;

  bool ispassword = true;

  bool isConfirmedpassword = true;
  bool ispass1=true;
  bool ispass2=true;


  void changePassword(bool value){
    ispass = !value;
    emit(changePasswordState());
  }
  void changeSignPassword(bool value){
    ispassword = !value;
    emit(changeSignPasswordState());
  }
  void changeConfirmPassword(bool value){
    isConfirmedpassword = !value;
    emit(changeConfirmPasswordState());
  }
  void changeResetPassword(bool value){
    ispass1 = !value;
    emit(changeresetPasswordState());
  }
  void changeResetConfirmPassword(bool value){
    ispass2 = !value;
    emit(changeresetConfirmPasswordState());
  }


  getWeather() async {
    isLoading = true;
    emit(GetDataLoadingState());
    Response response = await dio.get('http://api.weatherapi.com/v1/current.json?key=e3a6705d6d6d42f2907225815233008&q=Egypt&aqi=no');
    String region = (response.data["location"]["region"]);
    double temp = (response.data["current"]["temp_c"]);
    cairo = CairoTemp(region, temp);
    isLoading = false;
    emit(GetDataSuccessState());
  }



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

          emit(AppGetDataBase());
        });
        print("database opened");
      },

    ).then((value){
      database = value;
      emit(AppCreateDataBase());
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
            emit(AppInsertDataBase());
            getDataFromDatabase(database).then((value){

              info = value;
              print(info);

              emit(AppGetDataBase());
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