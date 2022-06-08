import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
            'Login.',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
          )),
          SizedBox(height: 74,),
          Textfield(hintText: 'Enter Your Email',icon: Icons.email,),
          Textfield(hintText: 'Enter Your Password',icon:Icons.key),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 15),
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child: Text('Forgot Password ?',style: TextStyle(color: Colors.white),))),
          ),
          Button(text: 'Login'),
          SizedBox(height: 65,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 15),
            child: Align(
                alignment: Alignment.center,
                child: TextButton(onPressed: (){}, child: Text('New User ? Signup',style: TextStyle(color: Colors.white),))),
          ),
        ],
      ),
    );
  }
}


class Textfield extends StatelessWidget {
  final String hintText;
  final  IconData icon;
  const Textfield({Key? key, required this.hintText, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 38,vertical: 15),
        child: Container(
          width: 284,
          height: 56,
          decoration: BoxDecoration(
              color:const Color.fromRGBO(214, 224, 239, 1),
              borderRadius: BorderRadius.circular(13)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                  suffixIcon: Icon(icon)

              ),
            ),
          ),

        ));
  }
}


class Button extends StatelessWidget {
  final String text;
  final onTap;
  const Button({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 38,vertical: 15),
          child: Container(
            width: 284,
            height: 56,
            decoration: BoxDecoration(
                color:const Color.fromRGBO(214, 224, 239, 1),
                borderRadius: BorderRadius.circular(13)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text,style: TextStyle(color: Color.fromRGBO(18, 38, 67, 1),fontSize: 24,fontWeight: FontWeight.bold),)
              ),
            ),

          )),
    );
  }
}
