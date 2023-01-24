import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationbloc/screens/bloc/sign_in_bloc.dart';
import 'package:formvalidationbloc/screens/bloc/sign_in_event.dart';
import 'package:formvalidationbloc/screens/bloc/sign_in_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Sign In Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailContoller,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailContoller.text, passwordContoller.text));
                },
                decoration: InputDecoration(hintText: "Email Address"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordContoller,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailContoller.text, passwordContoller.text));
                },
                decoration: InputDecoration(hintText: "Password "),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {

                    if(state is SignInLoadingState){

                      return Center(child: CircularProgressIndicator());
                    }


                    return Container(
                      height: 50,
                      width: 650,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: CupertinoButton(
                        onPressed: () {
                          if(state is SignInValidState){
                            BlocProvider.of<SignInBloc>(context).add(
                                SignInSubmittedEvent(
                                    emailContoller.text, passwordContoller.text));

                          }

                        },
                        color: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey,
                        child: Text("Sign in"),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
