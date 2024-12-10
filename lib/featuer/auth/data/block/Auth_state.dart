// ignore_for_file: file_names

class AuthState{}

class Authinital extends AuthState{}

//login
class LoginLoadinState extends AuthState{}
class LoginSuccesState extends AuthState{}

//register
class RegisterLoadinState extends AuthState{}
class RegisterSuccesState extends AuthState{}

//error
class AuthErrorState extends AuthState{
  String error;
  AuthErrorState(this.error);

}