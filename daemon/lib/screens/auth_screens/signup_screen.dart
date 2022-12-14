import 'package:daemon/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  //Function to validate inputs
  void _submitValidate() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint("alright");
    }
    //further tasks - storing data into db
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Hello",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const Text(
                    "Get Started !",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter your name",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return "Enter correct name ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter your email",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Enter valid email ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Create Password",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                        return "Enter valid password ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: _submitValidate,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  const SizedBox(
                    height: 120,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      },
                      child: const Text("Continue without Signing up."))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
