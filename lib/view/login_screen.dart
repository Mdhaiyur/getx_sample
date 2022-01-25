import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/util/app_utils.dart';
import 'package:getx_sample/view/signup_screen.dart';
import 'package:getx_sample/view/widget/custom_textfield.dart';
import 'package:getx_sample/view/widget/customer_button.dart';
import 'package:getx_sample/viewmodel/login_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends GetView<LoginViewModel> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050406),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Let\'s sign you in.',
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
                      hint: 'Email',
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
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
                    Get.to(SignupScreen());
                  },
                  child: Text('Don\'t have an account? Register',
                      style: GoogleFonts.poppins(
                          fontSize: 17, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx((){
                  return controller.loading
                      ? const Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  )
                      : CustomButton(
                    backgroundColor: Colors.white,
                    title: "Sign In",
                    onPress: () {
                      if (emailController.text.isEmpty) {
                        Utils().showSnackbar(
                            msg: 'Email must be entered.',
                            snackbarTitle: 'Error');
                      } else if (!GetUtils.isEmail(
                          emailController.text)) {
                        Utils().showSnackbar(
                            msg: 'Email must be valid.',
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
                        controller.loginUser(emailController.text,
                            passwordController.text);
                      }
                    },
                  );
                }),
              ],
            )),
      ),
    );
  }
}
