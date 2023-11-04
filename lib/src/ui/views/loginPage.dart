// flutter imports
import 'package:flutter/material.dart';

// package imports
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../utils/config/uidata.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/buttons/raised_button.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/forms/textfields/text_field.dart';

// utils

// services
// import '../../../../utils/config/uidata.dart';
// import '../../../../utils/routes/app_routes.dart';

// import '../../../widgets/buttons/raised_button.dart';
// import '../../../widgets/common_scaffold.dart';
// import '../../../widgets/forms/textfields/text_field.dart';
// import '../controller/login_controller.dart';

// widgets

//Dynamic list

class LoginPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<LoginController>(
      builder: (_) {
        return SafeArea(
          child: SingleChildScrollView(
            
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bgb.png',
                    ),
                    fit: BoxFit.scaleDown),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Please login to your Account",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 120),
                  Form(
                    // key: _.form,
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: _.username,
                          hintText: "Email",
                          labelText: "Email",
                          prefix: const Icon(
                            Icons.email_outlined,
                            size: 17,
                          ),
                          // isTextHidden :true,
                        ),
                        const SizedBox(height: 20),
                        CommonTextField(
                          controller: _.pass,
                          hintText: "Password",
                          labelText: "Password",
                          prefix: const Icon(
                            Icons.lock_outline,
                            size: 17,
                          ), // isTextHidden :true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Forget pasword?",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        // ReusableButton(
                        //   label: 'Login',
                        //   buttonCurve: 9,
                        //   onPressed: () {
                        //     _.loginInitiated();
                        //   },
                        //   color: UIDataColors.commonColor,
                        // ),
                        SizedBox(
                          width: Get.width * 0.5,
                          // height: Get.height * 0.13,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Obx(
                              () => _.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ReusableButton(
                                      buttonCurve: 30.0,
                                      onPressed: () {
                                        _.signIn();
                                      },
                                      label: 'Login',
                                      color: UIDataColors.commonColor,
                                      showBorder: false,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 23),
                        // const Text(
                        //   " Do not have account Register Now",
                        //   style: TextStyle(
                        //     fontSize: 9,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.signUpRoute),
                          child: RichText(
                            text: TextSpan(
                              text: 'Do not have account? ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Register Now',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: UIDataColors.commonColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).marginAll(30),
            ),
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
