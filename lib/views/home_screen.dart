import 'package:firebase/views/authentication/signin_screen.dart';
import 'package:firebase/views/utils/utils_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Get.to(SignInScreen());
                }).onError(
                  (error, stackTrace) {
                    UtilsScreen().toastmessage(error.toString());
                  },
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.pink,
              ))
        ],
      ),
    );
  }
}
