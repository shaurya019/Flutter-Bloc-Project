import 'package:bloc_flutter/blocs/validation/signin_event.dart';
import 'package:bloc_flutter/blocs/validation/signin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/validation/signin_bloc.dart';

class Validation_screen extends StatefulWidget {
  const Validation_screen({Key? key}) : super(key: key);

  @override
  State<Validation_screen> createState() => _Validation_screenState();
}

class _Validation_screenState extends State<Validation_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign IN"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            children: [
              BlocBuilder<SignIn_bloc,SignInState>(
                  builder: (context,state) {
                    if(state is SignInErrorState){
                      return Text(state.errorMessage , style: TextStyle(color: Colors.red),);
                    }else{
                      return Container();
                    }
                  },
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailController,
                onChanged: (val){
                  BlocProvider.of<SignIn_bloc>(context).add(
                    SignInTextChangedEvent(emailController.text, passwordController.text)
                  );
                },
                decoration: InputDecoration(
                  hintText: "Email Address"
                ),
              ),
              SizedBox(height: 10,),

              TextField(
                controller: passwordController,
                onChanged: (val){
                  BlocProvider.of<SignIn_bloc>(context).add(
                      SignInTextChangedEvent(emailController.text, passwordController.text)
                  );
                },
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
              SizedBox(height: 10,),
    BlocBuilder<SignIn_bloc,SignInState>(
    builder: (context,state) {
      // if(state is SignInLoadingState){
      //   return CircularProgressIndicator();
      // }
      return  CupertinoButton(
          onPressed: () {
            // if(state is SignInValidState){
            //   BlocProvider.of<SignIn_bloc>(context).add(
            //       SignInSubmittedEvent(emailController.text, passwordController.text)
            //   );
            // }
          },
          color:(state is SignInValidState) ? Colors.blue : Colors.red,
          child: Text('Submit')
      );
    }),
            ],
          ),
        ),
      ),
    );
  }
}
