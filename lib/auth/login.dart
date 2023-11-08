import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:juno_pai/auth/sign_up.dart';
import 'package:juno_pai/widgets/text.dart';

import '../home_page.dart';
import '../widgets/button.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Iconsax.backward),onPressed: (){
                        Navigator.pop(context);
                    },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Sign In",style: GoogleFonts.quicksand(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.black),),
                ),
                 Texts(myController: _emailController,hintText: "Email ",isPassword: false,),
                Texts(myController: _passwordController,hintText: "Password ",isPassword: true,),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const ForgotPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Forgot Password",style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black)),
                    ),
                  ),
                ),
                Button(
                  buttonText: "Sign In",
                  buttonColor: const Color(0xFF1C5D99),
                  onPressed: ()async{
                    try{
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                      if(FirebaseAuth.instance.currentUser !=null){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomePage()));
                      }
                      else{
                        showDialog(context: context, builder: (context)=> AlertDialog(
                          title: const Text("Wrong Password or Username"),
                          actions: [
                            ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                            },
                                child: const Text("Sign Up Now"))
                          ],
                        ));
                      }
                    }on FirebaseException catch(e){
                      print(e.message);
                    }
                  },
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28,0,8,8),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text("Don't have an account?",style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpPage()));
                          },
                            child:
                        Text("Sign Up",style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w400, color:const Color(0x984E99E1)))),
                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}
