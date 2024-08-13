import 'package:firebase/Widgets/custom_button.dart';
import 'package:firebase/constants/colors.dart';
import 'package:firebase/views/home_screen.dart';
import 'package:firebase/views/utils/utils_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class VertifiedNumber extends StatefulWidget {
  final String verificationId;
  const VertifiedNumber({super.key, required this.verificationId});

  @override
  State<VertifiedNumber> createState() => _VertifiedNumberState();
}

class _VertifiedNumberState extends State<VertifiedNumber> {
  final verifiedcontroller = TextEditingController();
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
              controller: verifiedcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Add OTP"),
            ),
          ),
          SizedBox(
            height: 42.h,
          ),
          CustomButton(
              texts: " Verified OTP",
              loading: loading,
              onPressed: () async {
                setState(() {
                  loading = true;
                });

                final creadential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verifiedcontroller.text.toString());

                try {
                  await auth.signInWithCredential(creadential);
                  Get.to(HomeScreen());
                } catch (e) {
                  setState(() {
                    loading = false;
                    UtilsScreen().toastmessage(e.toString());
                  });
                }
              }),
        ],
      ),
    );
  }
}
