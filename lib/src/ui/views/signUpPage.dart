// flutter imports
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// package imports
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../utils/config/uidata.dart';
import '../widgets/buttons/raised_button.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/forms/textfields/text_field.dart';

// utils

// services

// import '../../../../utils/config/uidata.dart';
// import '../../../widgets/buttons/raised_button.dart';
// import '../../../widgets/common_scaffold.dart';
// import '../../../widgets/forms/textfields/text_field.dart';
// import '../controller/login_controller.dart';

// widgets

//Dynamic list

class SignUpPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<LoginController>(
      builder: (_) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bgb.png',
                  ),
                  fit: BoxFit.scaleDown),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Signup",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(height: 5),
                Text(
                  "Please Signup to your Account",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.grey),
                ),
                SizedBox(height: 120),
                Form(
                    // key: _.form,
                    child: Column(
                  children: [
                    CommonTextField(
                      controller: _.signupFirstname,
                      hintText: "FirstName",
                      labelText: "FirstName",
                      prefix: Icon(
                        Icons.person_outline,
                        size: 17,
                      ),
                    ),
                    SizedBox(height: 20),
                    CommonTextField(
                      controller: _.signupLastname,
                      hintText: "LastName",
                      labelText: "LastName",
                      prefix: const Icon(
                        Icons.email_outlined,
                        size: 17,
                      ),
                    ),
                    SizedBox(height: 20),
                    CommonTextField(
                      controller: _.signupEmail,
                      hintText: "Email",
                      labelText: "Email",
                      prefix: Icon(
                        Icons.lock_outline,
                        size: 17,
                      ), // isTextHidden :true,
                    ),
                    SizedBox(height: 20),
                    CommonTextField(
                      controller: _.signupPassword,
                      hintText: "Password",
                      labelText: "Password",
                      prefix: Icon(
                        Icons.lock_outline,
                        size: 17,
                      ), // isTextHidden :true,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    ReusableButton(
                      label: 'Submit',
                      buttonCurve: 9,
                      onPressed: () {
                        // Get.to(const DashboardScreen());
                        _.signUpUser();
                      },
                      color: UIDataColors.commonColor,
                      showBorder: false,
                    ),
                    SizedBox(height: 23),
                    GestureDetector(
                      onTap: () => Get.to({}),
                      child: RichText(
                        text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            children: <TextSpan>[
                              //   <-- 2
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: UIDataColors.commonColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    // color: UIDataColors.commonColor,
                                  ),
                                  children: <TextSpan>[
                                    //  <-- 3 (children of 2 textspan
                                    TextSpan(
                                      text: '',
                                    )
                                  ]),
                            ]),
                      ),
                    )
                  ],
                ))
              ],
            ).marginAll(30),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: false,
      enableHeader: false,
      headerName: false,
      showFAB: false,
      showAppBar: false,
      showBottomNav: false,
    );
  }
}
