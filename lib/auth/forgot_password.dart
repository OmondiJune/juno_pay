import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/button.dart';
import '../widgets/text.dart';
import 'login.dart';

class ForgotPage extends StatefulWidget {

  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
         body: Container(
           height: MediaQuery.of(context).size.height,
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
                 child: Text(
                   "Forgot Password?",
                   style: GoogleFonts.quicksand(
                     fontSize: 35,
                     fontWeight: FontWeight.w700,
                     color: Colors.black,
                   ),
                 ),
               ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Bad Day?Don't worry you'll get it right next time",
              style: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
               Texts(
                 myController: _emailController,
                 hintText: "Email",
                 isPassword: false,
               ),
               Button(
                 buttonText: "Reset Password",
                 buttonColor:const Color(0xFF1C5D99),
                 onPressed: (){
                   Navigator.pop(context);
                 },
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(58, 8, 8, 8),
                 child: Align(
                   alignment: Alignment.center,
                   child: Row(
                     children: [
                       Text(
                         "Remember Password?",
                         style: GoogleFonts.quicksand(
                           fontSize: 20,
                           fontWeight: FontWeight.w300,
                           color: Colors.black,
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginPage()));
                         },
                         child: Text(
                           " Sign In",
                           style: GoogleFonts.quicksand(
                             fontSize: 20,
                             fontWeight: FontWeight.w400,
                             color: const Color(0x984E99E1),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               )
             ],
           ),
         ),
        )
    );
  }
}
