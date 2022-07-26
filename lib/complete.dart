import 'package:chatapp/Auth/auth.dart';
import 'package:chatapp/components.dart';
import 'package:chatapp/dashboard.dart';
import 'package:flutter/material.dart';


class CompleteProfile extends StatelessWidget {
  final user;
  CompleteProfile({Key? key, this.user}) : super(key: key);
  final name = TextEditingController();
  final number = TextEditingController();
  var image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 38, 67, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
                'Complete.',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
              )),
          SizedBox(height: 74,),
          Textfield(hintText: 'Enter Your Name',icon: Icons.title,controller: name,),
          Textfield(hintText: 'Enter Your Number',icon:Icons.phone,controller: number,),
          Textfield(hintText: 'Select Your Photo',icon:Icons.person,
          onTap: ()async{
            image  = await Auth.selectImage(context);


          },
          ),
          SizedBox(
            height: 20,
          ),
          Button(text: 'Complete',
          onTap: ()async{
             await Auth().complete(user: user,name: name.text.trim(),number: number.text.trim(),image: image,context: context);
          },
          ),
          SizedBox(height: 65,),

        ],
      ),
    );
  }
}
