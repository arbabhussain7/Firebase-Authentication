import 'package:firebase/Widgets/custom_button.dart';
import 'package:firebase/Widgets/custom_textfield.dart';
import 'package:firebase/constants/colors.dart';
import 'package:firebase/views/authentication/signin_screen.dart';
import 'package:firebase/views/utils/utils_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

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
                height: 62.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register your account",
                      style: GoogleFonts.montserrat(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: greyColor),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    Text(
                      "Username",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextfield(
                      controller: namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Username ";
                        }
                        return null;
                      },
                      hinttext: "Ahmaed Shah",
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextfield(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Enter your email";
                        } else if (!GetUtils.isEmail(value)) {
                          return " Please enter valid email ";
                        }
                        return null;
                      },
                      hinttext: "iamzaibi905@gmail.com",
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Phone Number (Optional)",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextfield(
                        controller: numbercontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else if (!GetUtils.isPhoneNumber(value)) {
                            return " Enter valid phone number ";
                          }
                          return null;
                        },
                        hinttext: "03465651215",
                        inputType: TextInputType.phone),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextfield(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your password";
                          }
                          return null;
                        },
                        isPassword: true,
                        secureText: true,
                        obscureText: true,
                        hinttext: "must have 8 charcters",
                        inputType: TextInputType.visiblePassword),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextfield(
                        controller: confirmpasswordcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your password";
                          }
                          return null;
                        },
                        isPassword: true,
                        secureText: true,
                        obscureText: true,
                        hinttext: "must have 8 charcters",
                        inputType: TextInputType.visiblePassword),
                    SizedBox(
                      height: 85.h,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          auth
                              .createUserWithEmailAndPassword(
                                  email: emailcontroller.text.toString(),
                                  password: passwordcontroller.text.toString())
                              .then(
                            (value) {
                              Get.to(SignInScreen());
                              setState(() {
                                loading = false;
                              });
                            },
                          ).onError(
                            (error, stackTrace) {
                              UtilsScreen().toastmessage(error.toString());
                              setState(() {
                                loading = false;
                              });
                            },
                          );
                        }
                      },
                      texts: "Create",
                      loading: loading,
                    ),
                    SizedBox(
                      height: 4.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
