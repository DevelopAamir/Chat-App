import 'dart:io';

import 'package:chatapp/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../complete.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future signup(
      String email, String password, String confirmPass, context) async {
    var user;
    if (password == confirmPass) {
      try {
        user = await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CompleteProfile(user: value.user);
                },
              ),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message.toString());
      }
    } else {
      Fluttertoast.showToast(msg: 'Password Is Not Matched');
    }
    return user;
  }

  complete({required User user, name, number, image, context}) async {
    try {
      await firestore.collection('user').add({
        'email': user.email,
        'name': name,
        'number': number,
        'image': image,
      }).then(
        (value) {
          Fluttertoast.showToast(msg: 'Profile Completed');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Dashboard();
              },
            ),
          );
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  login(email, pass, context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass).then(
        (value) {
          Fluttertoast.showToast(msg: 'Logged In');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Dashboard();
              },
            ),
          );
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future getInfo() async {
    var email = auth.currentUser!.email;
    var datas;
    try {
      final response = await firestore.collection('user').get();
      final data =
          response.docs.where((element) => element['email'] == email).first;
      datas = data;
    } catch (e) {}
    return datas;
  }

  static Future selectImage(context)async{
    final storage =FirebaseStorage.instance;
    var url;

    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    showDialog(context: context, builder: (context){
      return const AlertDialog(
        title: Text('File Uploading.......'),
        content: Center(
          child: CircularProgressIndicator(color: Colors.indigo,),
        ),
      );
    });
    try{
      final uploaded = await storage.ref(image!.name).putFile(File(image.path));
      var u = await uploaded.ref.getDownloadURL();
      url = u;

    }catch(e){

    }

    Navigator.pop(context);


    return url;

  }
}
