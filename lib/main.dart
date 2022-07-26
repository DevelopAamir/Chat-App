import 'package:chatapp/Auth/auth.dart';
import 'package:chatapp/components.dart';
import 'package:chatapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final email  = TextEditingController();

    final pass = TextEditingController();

   bool spin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 38, 67, 1),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
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
                  Textfield(hintText: 'Enter Your Email',icon: Icons.email,controller: email,),
                  Textfield(hintText: 'Enter Your Password',icon:Icons.key,controller: pass,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 15),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: Text('Forgot Password ?',style: TextStyle(color: Colors.white),))),
                  ),
                  Button(text: 'Login',
                  onTap: ()async {
                    setState(() {
                      spin = true;
                    });
                    await Auth().login(email.text.trim(), pass.text.trim(), context);
                    setState(() {
                      spin = false;
                    });
                  },
                  ),
                  SizedBox(height: 65,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38,vertical: 15),
                    child: Align(
                        alignment: Alignment.center,
                        child: TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SignupPage();
                          }));
                        }, child: Text('New User ? Signup',style: TextStyle(color: Colors.white),))),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: spin,

                child: Center(child: CircularProgressIndicator(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}


