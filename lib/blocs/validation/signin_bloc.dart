import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/blocs/validation/signin_event.dart';
import 'package:bloc_flutter/blocs/validation/signin_state.dart';

class SignIn_bloc  extends  Bloc<SignInEvent,SignInState>{

  SignIn_bloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email addrrss"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please enter a valid Password"));
      }else{
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });


  }
}
