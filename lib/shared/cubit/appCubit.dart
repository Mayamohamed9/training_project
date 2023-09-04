import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/modules/info%20class.dart';
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

  bool confirmpass=false;
  CairoTemp cairo = CairoTemp("", 0);




  bool ispass=true;
  bool ispassword = true;
  bool wrongdata = false;
  bool isConfirmedpassword = true;
  bool ispass1=true;
  bool ispass2=true;
  bool emailenteredprv=false;
  List<Info> Infos=[];
  Info? info;
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
          emit(AppInsertDataBase());
          convertingINFO();
          emit(AppGetDataBase());
        }).catchError((onError) {
          print("error when creating Table ${onError.toString()}");
        });
      },
      onOpen: (database) async {
       Infos= await infos(database);
       emit(AppGetDataBase());
        print("database opened");
      },

    ).then((value){
      database = value;
      emit(AppCreateDataBase());
    });

  }
  Future<void> convertingINFO()
  async {
    Infos= await infos(database);
  }
   inserttoDB(
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
          then((value) async {
            print("$value is inserted");
            emit(AppInsertDataBase());
            Infos=await infos(database).then((value) {
              print("infos updated after insertion");
             return Infos;
            });
            emit(AppGetDataBase());
          }).catchError((error){
            print("${error.toString()} my error");
          });
          return Future(() => null);
        }


    );
  }
int age(DateTime today , DateTime dob)
{
return today.year-dob.year;
}

  // Future<void> getDataFromDatabase(database)
  //  async {
  //   List<Map> info = [];
  //
  //   database.rawQuery('SELECT * FROM info').then((value) {
  //
  //     value.forEach((element)
  //     {
  //     info.add(element);
  //     });
  //
  //     emit(AppGetDataBase());
  //   });
  //
  // }
  Future<List<Info>> infos(database) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('info');

    emit(AppGetDataBase());
    return List.generate(maps.length, (i) {
      return Info(email: maps[i]['email'], name: maps[i]['email'] ,phone: maps[i]['email'], password: maps[i]['email'], age: maps[i]['email'], height: maps[i]['email']);
    });
  }
bool validateEmailFromDataBase(String? email)
{
  bool found=false;
  Infos.forEach((element) {
    if(element.email==email)
      {
        found=true;
      }

  });
return found;
}
bool validatePasswordFromDataBase(String? password)
{
  bool found=false;
  Infos.forEach((element) {
    if(element.password==password)
    {
      found=true;
    }

  });
  return found;
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
void validatedata(String email, String password)
{
  fillingInfo();
  Infos.forEach((element) {

    print("${element.email}");
    if(element.email==email)
    {
      print("email found");
      if(password==element.password)
      {
        print("Found");
        wrongdata=false;
        gettingInfo(email,password);
      }
      else{
        wrongdata=true;
      }
    }
    else{
      wrongdata=true;
    }

  });
  emit(Appwrongdatastate());

}
void validateconfirmpass(String pass, String Confirmed)
{
  if(pass==Confirmed)
  {
    confirmpass=true;
    print("passwords identecal");emit(AppConfirmPasssword());
  }else{
    confirmpass=false;
    print("passwords not");emit(AppConfirmPasssword());
  }

}
void emailvalid(String email) {
  fillingInfo();
  bool found = false;
  Infos.forEach((element) {
    if (element.email == email) {
      found = true;
    }
    emailenteredprv = found;
  });
}
Future<void> fillingInfo()
async {
  Infos=await infos(database);
}
void gettingInfo(String email , String password)
{
  fillingInfo();
  Infos.forEach((element) {

    if(element.email==email)
    {
      if(password==element.password)
      {
        info=element;
      }

    }


  });
  emit(Getinfo());

}
}