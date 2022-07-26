import 'package:chatapp/Auth/auth.dart';
import 'package:chatapp/complete.dart';
import 'package:chatapp/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatelessWidget {
   SignupPage({Key? key}) : super(key: key);
  final email = TextEditingController();
   final pass = TextEditingController();
   final confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 38, 67, 1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                    'Signup.',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
                  )),
             const SizedBox(height: 74,),
              Textfield(hintText: 'Enter Your Email',icon: Icons.email,controller: email,),
              Textfield(hintText: 'Enter Your Password',icon:Icons.key,controller: pass,),
              Textfield(hintText: 'Confirm Password',icon:Icons.key,controller: confirmPass,),
           const   SizedBox(
                height: 20,
              ),
              Button(text: 'Signup',
              onTap: ()async{

                if(email.text.isNotEmpty && pass.text.isNotEmpty){
                 await Auth().signup(email.text.trim(), pass.text.trim(), confirmPass.text.trim(),context);
                }else{
                  Fluttertoast.showToast(msg: 'Fill All The Fields Correctly');
                }

              email.clear();
                pass.clear();
                confirmPass.clear();

              },
              ),
              SizedBox(height: 65,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 15),
                child: Align(
                    alignment: Alignment.center,
                    child: TextButton(onPressed: (){}, child: Text('Already have an account ? Login',style: TextStyle(color: Colors.white),))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
