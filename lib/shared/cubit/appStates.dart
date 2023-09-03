abstract class AppStates {}
class infoInitialState extends AppStates{}
class changePasswordState extends AppStates{}
class changeSignPasswordState extends AppStates{}
class changeConfirmPasswordState extends AppStates{}
class changeresetPasswordState extends AppStates{}
class changeresetConfirmPasswordState extends AppStates{}
class AppCreateDataBase extends AppStates{}
class AppGetDataBase extends AppStates{}
class AppInsertDataBase extends AppStates{}

class GetDataLoadingState extends AppStates{}
class GetDataErrorState extends AppStates{}
class GetDataSuccessState extends AppStates{}