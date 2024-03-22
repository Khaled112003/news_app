import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/message.dart';
import 'package:flutter_application_1/screans4/homepage.dart';
import 'package:flutter_application_1/screans4/signin.dart';
import 'package:flutter_application_1/widgets/cusstomtextfield.dart';
import 'package:flutter_application_1/widgets/custombuttonfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// Sign Up
class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email;
  String? pass;
  String? username;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'sign up ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    customtextfiald(
                      icon: Icon(Icons.person),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "Field is required";
                        }
                      },
                      onChanged: (data) {
                        username = data;
                      },
                      hintText: 'Username',
                    ),
                    SizedBox(height: 20),
                    customtextfiald(
                      icon: Icon(Icons.email),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                        if (!data.contains('@gmail.com')) {
                          return 'Email must contain @gmail.com';
                        }
                      },
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(height: 20),
                    customtextfiald(
                      icon: Icon(Icons.lock),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                      obscureText: true,
                      onChanged: (data) {
                        pass = data;
                      },
                      hintText: 'password',
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 40),
                    custombuttonfield(
                      text: ' sign up',
                      onTap: () async {
                        isloading = true;
                        setState(() {});
                    
                    
                        if (formkey.currentState!.validate()) {
                          try {
                            await User();
                            massage(context, 'success');
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return homepage();
                            },));
                            
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              massage(
                                  context, 'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              massage(context,
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            massage(context,
                                'sorry there is an error, please try again');
                          }
                        } else {
                          massage(context,
                              'sorry there is an error, please try again');
                        }
                        isloading = false;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Signin();
                            }));
                          },
                          child: Text(
                            "already have an account? sign in",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> User() async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!, 
      password: pass!,
    );
    
  }
}
