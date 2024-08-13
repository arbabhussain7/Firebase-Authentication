import 'package:firebase/Widgets/custom_button.dart';
import 'package:firebase/Widgets/custom_textfield.dart';
import 'package:firebase/constants/colors.dart';
import 'package:firebase/views/authentication/signin_with_phone.dart';
import 'package:firebase/views/authentication/signup_screen.dart';
import 'package:firebase/views/home_screen.dart';
import 'package:firebase/views/utils/utils_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
  bool loading = false;
  bool? isChecked = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/signup-img.png",
              ),
              SizedBox(
                height: 42.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: textColor),
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff212121)),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextfield(
                      suffixIcons: null,
                      inputType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      hinttext: "Fleacttech@gmail.com",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Please Your Enter Email";
                        } else if (!GetUtils.isEmail(value)) {
                          return " Please Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextfield(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password ";
                          }
                          return null;
                        },
                        inputType: TextInputType.visiblePassword,
                        suffixIcons: null,
                        secureText: true,
                        isPassword: true,
                        obscureText: true,
                        hinttext: "must have 8 charcters"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: isChecked,
                            activeColor: orangeColor,
                            onChanged: (newbool) {
                              setState(() {
                                isChecked = newbool;
                              });
                            }),
                        Text(
                          "Remember me",
                          style: GoogleFonts.montserrat(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: greyAccentColor),
                        ),
                        SizedBox(
                          width: 155.w,
                        ),
                        Text(
                          "Forgot Password?",
                          style: GoogleFonts.montserrat(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          auth
                              .signInWithEmailAndPassword(
                            email: emailcontroller.text.toString(),
                            password: passwordcontroller.text.toString(),
                          )
                              .then(
                            (value) {
                              Get.to(HomeScreen());
                              UtilsScreen()
                                  .toastmessage(value.user!.email.toString());
                              setState(() {
                                loading = false;
                              });
                            },
                          ).onError(
                            (error, stackTrace) {
                              debugPrint(error.toString());
                              UtilsScreen().toastmessage(error.toString());
                              setState(() {
                                loading = false;
                              });
                            },
                          );
                        }
                      },
                      texts: "Login",
                      loading: loading,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                                  color: blackAccentColor.withOpacity(0.1))),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Or sign in with",
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: greyAccentColor),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: Divider(
                                color: blackAccentColor.withOpacity(0.1)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.h, vertical: 22.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: blackAccentColor.withOpacity(0.1)),
                              ),
                              child: Image.asset(
                                "assets/images/google.png",
                                width: 26.w,
                                height: 27.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 22.w,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.h),
                              // width: 160.w,
                              // height: 55.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: blackAccentColor.withOpacity(0.1)),
                              ),
                              child: Image.asset(
                                "assets/images/apple.png",
                                width: 26.w,
                                height: 27.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(SignInWithPhone());
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(12.h),
                          height: 50.h,
                          width: 233.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: orangeColor,
                              ),
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Text(
                            "Sign In with Phone Number ",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: orangeColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 92.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: "Don’t have an account?",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " Sign Up",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: blueColor))
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
