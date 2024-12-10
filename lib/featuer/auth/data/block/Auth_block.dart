// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_app/featuer/auth/data/block/Auth_Event.dart';
import 'package:graduate_app/featuer/auth/data/block/Auth_state.dart';

class AuthBlock extends Bloc<AuthEvent,AuthState>{
  
  AuthBlock() :super(Authinital()){
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }
  
   register(RegisterEvent event,Emitter<AuthState>emit) async{
    emit(RegisterLoadinState());
      try   {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
   
    email: event.email,
    password: event.password,

  );
  emit(RegisterSuccesState());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    emit(AuthErrorState('The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
        emit(AuthErrorState('The account already exists for that email.'));

  }
} catch (e) {
  print(e);
  emit(AuthErrorState(e.toString()));
}
   }
//login
   login(LoginEvent event,Emitter<AuthState>emit) async{
    emit(LoginLoadinState());
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: event.email,
    password:event.password,
  );
  emit(LoginSuccesState());
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    emit(AuthErrorState('No user found for that email.'));
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    emit(AuthErrorState('Wrong password provided for that user.'));
  }
}
   }
  
}