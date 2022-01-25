import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_sample/util/app_utils.dart';
import 'package:getx_sample/view/widget/custom_textfield.dart';
import 'package:getx_sample/view/widget/customer_button.dart';
import 'package:getx_sample/viewmodel/signup_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends GetView<SignupViewModel> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050406),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Let\'s create account.',
                  style: GoogleFonts.anaheim(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text('Welcome back.',
                  style:
                      GoogleFonts.anaheim(fontSize: 25, color: Colors.white)),
              Text('you\'ve been missed.',
                  style:
                      GoogleFonts.anaheim(fontSize: 25, color: Colors.white)),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Column(
                children: [
                  CustomTextField(
                    hint: 'Name',
                    controller: nameController,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hint: 'Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hint: 'Age',
                    controller: ageController,
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    textInputType: TextInputType.text,
                    hint: 'Password',
                    isObscure: true,
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text('Already have an account? SingIn',
                    style:
                        GoogleFonts.poppins(fontSize: 17, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return controller.loading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : CustomButton(
                        backgroundColor: Colors.white,
                        title: "Sign Up",
                        onPress: () {
                          if (nameController.text.isEmpty) {
                            Utils().showSnackbar(
                                msg: 'Name must be entered.',
                                snackbarTitle: 'Error');
                          } else if (emailController.text.isEmpty) {
                            Utils().showSnackbar(
                                msg: 'Email must be entered.',
                                snackbarTitle: 'Error');
                          } else if (!GetUtils.isEmail(emailController.text)) {
                            Utils().showSnackbar(
                                msg: 'Email must be valid.',
                                snackbarTitle: 'Error');
                          } else if (ageController.text.isEmpty) {
                            Utils().showSnackbar(
                                msg: 'Age must be entered.',
                                snackbarTitle: 'Error');
                          } else if (!GetUtils.isGreaterThan(
                                  int.parse(ageController.text), 14) ||
                              !GetUtils.isLowerThan(
                                  int.parse(ageController.text), 100)) {
                            Utils().showSnackbar(
                                msg: 'Age must be 14 years or above.',
                                snackbarTitle: 'Error');
                          } else if (passwordController.text.isEmpty) {
                            Utils().showSnackbar(
                                msg: 'Password must be entered.',
                                snackbarTitle: 'Error');
                          } else if (!GetUtils.isLengthGreaterOrEqual(
                              passwordController.text, 8)) {
                            Utils().showSnackbar(
                                msg: 'Password must be 8 character.',
                                snackbarTitle: 'Error');
                          } else {
                            controller.registerUser(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                                int.parse(ageController.text));
                          }
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
