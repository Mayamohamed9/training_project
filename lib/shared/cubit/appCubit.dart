import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/shared/cubit/appStates.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(infoInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

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



}