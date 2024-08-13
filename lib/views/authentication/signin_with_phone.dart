import 'package:firebase/Widgets/custom_button.dart';
import 'package:firebase/constants/colors.dart';
import 'package:firebase/views/authentication/veified_otp.dart';
import 'package:firebase/views/utils/utils_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({super.key});

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  final phonecontroller = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: TextFormField(
              style: GoogleFonts.montserrat(fontSize: 18.sp, color: textColor),
              controller: phonecontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "+923411463601"),
            ),
          ),
          SizedBox(
            height: 42.h,
          ),
          CustomButton(
              texts: "Send OTP",
              loading: loading,
              onPressed: () {
                setState(() {
                  loading = true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phonecontroller.text,
                    verificationCompleted: (_) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e) {
                      UtilsScreen().toastmessage(e.toString());
                    },
                    codeSent: (String verficationId, int? token) {
                      setState(() {
                        loading = false;
                      });
                      Get.to(VertifiedNumber(
                        verificationId: verficationId,
                      ));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      setState(() {
                        loading = false;
                      });
                      UtilsScreen().toastmessage(e.toString());
                    });
              }),
        ],
      ),
    );
  }
}
