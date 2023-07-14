import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';
import 'package:netapp/utilities/validators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 120.0, left: 20, right: 20, bottom: 110),
            child: Card(
              elevation: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TextWidget(
                        text: "Login to GDN Portal!",
                        color: AppColors.titleBlack,
                        fontSize: 30,
                      ),
                      const SizedBox(height: 20),
                      const TextWidget(
                        text: "Enter your email & password to login",
                        color: AppColors.titleBlack,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 50),
                      InputFieldWidget(
                        label: "Email Address",
                        hintText: "example@gmail.com",
                        onChanged: (value) {
                          formfieldkey_1.currentState?.validate();
                        },
                        textFieldkey: formfieldkey_1,
                        validator: (value) {
                          String emailError = Validator.validateEmail(
                              formfieldkey_1.currentState?.value)!;
                          return emailError;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputFieldWidget(
                        label: "Password",
                        hintText: "•••••••••",
                        onChanged: (value) {
                          formfieldkey_2.currentState?.validate();
                        },
                        textFieldkey: formfieldkey_2,
                        validator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(
                          //     context, Routes.todayDetails);
                          Navigator.pushNamed(context, Routes.options);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xff004F9F))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 110.0),
                          child: TextWidget(
                            text: "Login",
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ButtonStyle(
                      //       backgroundColor: MaterialStateColor.resolveWith(
                      //           (states) => const Color(0xff6C757D))),
                      //   child: const Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 60.0),
                      //     child: TextWidget(
                      //       text: "Register New Outlet",
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const TextWidget(
                              text: "Reset Password",
                              fontSize: 13,
                              color: AppColors.titleBlack,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  side: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  value: checkBoxValue,
                                  onChanged: (val) {
                                    setState(() {
                                      checkBoxValue = val;
                                    });
                                  }),
                              const TextWidget(
                                text: "Remember me",
                                fontSize: 13,
                                color: Color(0xff868FAE),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
