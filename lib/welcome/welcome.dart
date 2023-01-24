import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidationbloc/screens/bloc/sign_in_bloc.dart';
import 'package:formvalidationbloc/screens/sign_in_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 30, color: Colors.teal),
              ),
            ),
            SizedBox(
              height: 600,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => SignInBloc(),
                                  child: SignInScreen(),
                                )));
                  },
                  child: Center(child: Text("Sign In with Email"))),
            )
          ],
        ),
      ),
    );
  }
}
