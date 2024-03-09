import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathguide/student/view/student_signup.dart';
import 'package:pathguide/tutor/controller/tutor_authController.dart';
import 'package:pathguide/tutor/view/tutor_login.dart';
import 'package:pathguide/utils/app_colors.dart';
import 'package:pathguide/utils/custom_button.dart';
import 'package:pathguide/utils/custom_formfield.dart';
import 'package:pathguide/utils/custom_richtext.dart';

class TutorSignup extends StatelessWidget {
  const TutorSignup({super.key});

  @override
  Widget build(BuildContext context) {
    TutorAuthController tutorAuthController = Get.put(TutorAuthController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("images/path_guide.png"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Tutor Username",
                    hintText: "username",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: tutorAuthController.tutorname,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Tutor Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    controller: tutorAuthController.tutoremail,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: tutorAuthController.tutorpass,
                    headingText: "Password",
                    hintText: "At least 8 Character",
                    obsecureText: true,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility), onPressed: () {}),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  AuthButton(
                    onTap: () {
                      tutorAuthController.signupUser();
                    },
                    text: 'Create Account as Tutor',
                  ),
                  CustomRichText(
                    description: 'Already Have an account? ',
                    text: 'Log In here',
                    onTap: () {
                      Get.to(const TutorLogin());
                    },
                  ),
                  CustomRichText(
                    description: "   Not a Tutor ? ",
                    text: 'Create Student Account',
                    onTap: () {
                      Get.offAll(const StudentSignUp());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
