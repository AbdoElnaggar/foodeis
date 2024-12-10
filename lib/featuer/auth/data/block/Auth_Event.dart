// ignore_for_file: file_names
class AuthEvent {}

class LoginEvent extends AuthEvent{
  String email;
  String password;
  LoginEvent({required this.email,required this.password});
}

class RegisterEvent extends AuthEvent{
  String name;
  String email;
   String password;
  RegisterEvent({required this.name,required this.password,required this.email});
}
