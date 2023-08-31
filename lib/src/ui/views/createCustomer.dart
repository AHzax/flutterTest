import 'package:docapp/src/ui/widgets/forms/textfields/textformfield_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/createCustomerController.dart';
import '../../utils/config/uidata.dart';

import '../widgets/buttons/raised_button.dart';
import '../widgets/common_scaffold.dart';

class CreateCustomerPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<CreateCustomerController>(builder: (_) {
      return SafeArea(
        minimum: EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter",
                      color: UIDataColors.fieldGreenColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextFormFieldContainer(
                    commonColor: UIDataColors.fieldGreenColor,
                    hintText: "Customer Name",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.nameController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width / 2.8,
                    child: DropdownButtonFormField(
                        value: _.groupValue,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: UIDataColors.fieldGreenColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: UIDataColors.DarkGreenColor,
                          )),
                        ),

                        // dropdownColor: Color.fromARGB(255, 172, 255, 180),
                        hint: Text(
                          "Customer Group",
                          style: TextStyle(color: Colors.black45),
                        ),
                        iconEnabledColor: UIDataColors.fieldGreenColor,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Commercial',
                            child: Text('Commercial'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Government',
                            child: Text('Government'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Individual',
                            child: Text('Individual'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Non Profit',
                            child: Text('Non Profit'),
                          ),
                        ],
                        onChanged: (value) {
                          _.groupValue = value;
                        }),
                  ),
                  Container(
                    width: Get.width / 2.7,
                    child: DropdownButtonFormField(
                        value: _.priceListValue,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: UIDataColors.fieldGreenColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: UIDataColors.DarkGreenColor,
                          )),
                        ),

                        // dropdownColor: Color.fromARGB(255, 172, 255, 180),
                        hint: Text(
                          "Default Price List",
                          style: TextStyle(color: Colors.black45),
                        ),
                        iconEnabledColor: UIDataColors.fieldGreenColor,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Standard Selling',
                            child: Text('PKR'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Other',
                            child: Text('Others'),
                          ),
                        ],
                        onChanged: (value) {
                          _.priceListValue = value;
                        }),
                  ),
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Group",
              //       style: TextStyle(
              //         fontSize: 17,
              //         fontFamily: "inter",
              //         color: UIDataColors.fieldGreenColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //     TextFormFieldContainer(
              //       commonColor: UIDataColors.fieldGreenColor,
              //       hintText: "Customer Group ",
              //       hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
              //       controllerText: _.GroupController,
              //       // labelText: "Project Name",
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Type",
              //       style: TextStyle(
              //         fontSize: 17,
              //         fontFamily: "inter",
              //         color: UIDataColors.fieldGreenColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //     TextFormFieldContainer(
              //       commonColor: UIDataColors.fieldGreenColor,
              //       hintText: "Customer Type",
              //       hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
              //       controllerText: _.TypeController,
              //       // labelText: "Project Name",
              //     ),
              //   ],
              // ),

              // SizedBox(
              //   height: 20,
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: Get.width / 3,
              //       child: DropdownButtonFormField(
              //           // dropdownColor: Color.fromARGB(255, 172, 255, 180),
              //           hint: Text("Status"),
              //           items: const [
              //             DropdownMenuItem<String>(
              //               value: 'Open',
              //               child: Text('Open'),
              //             ),
              //             DropdownMenuItem<String>(
              //               value: 'Completed',
              //               child: Text('Completed'),
              //             ),
              //             DropdownMenuItem<String>(
              //               value: 'Cancelled',
              //               child: Text('Cancelled'),
              //             ),
              //           ],
              //           onChanged: (value) {}),
              //     ),
              //     Container(
              //       width: Get.width / 3,
              //       child: DropdownButtonFormField(
              //           hint: Text("Priority"),
              //           items: const [
              //             DropdownMenuItem<String>(
              //               value: 'external',
              //               child: Text('External'),
              //             ),
              //             DropdownMenuItem<String>(
              //               value: 'internal',
              //               child: Text('Internal'),
              //             ),

              //           ],
              //           onChanged: (value) {}),
              //     ),
              //   ],
              // ),

              SizedBox(
                height: 20,
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Territory",
              //       style: TextStyle(
              //         fontSize: 17,
              //         fontFamily: "inter",
              //         color: UIDataColors.fieldGreenColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //     TextFormFieldContainer(
              //       commonColor: UIDataColors.fieldGreenColor,
              //       hintText: "Customer Territory",
              //       hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
              //       controllerText: _.TerritoryController,
              //       // labelText: "Project Name",
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width / 3,
                    child: DropdownButtonFormField(
                        value: _.territoryValue,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: UIDataColors.fieldGreenColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: UIDataColors.DarkGreenColor,
                          )),
                        ),

                        // dropdownColor: Color.fromARGB(255, 172, 255, 180),
                        hint: Text(
                          "Territory",
                          style: TextStyle(color: Colors.black45),
                        ),
                        iconEnabledColor: UIDataColors.fieldGreenColor,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Pakistan',
                            child: Text('Pakistan'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'All Territories',
                            child: Text('All places'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Rest Of The World',
                            child: Text('Other'),
                          ),
                        ],
                        onChanged: (value) {
                          _.territoryValue = value;
                        }),
                  ),
                  Container(
                    width: Get.width / 3,
                    child: DropdownButtonFormField(
                        value: _.typeValue,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: UIDataColors.fieldGreenColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: UIDataColors.DarkGreenColor,
                          )),
                        ),

                        // dropdownColor: Color.fromARGB(255, 172, 255, 180),
                        hint: Text(
                          "Customer Type",
                          style: TextStyle(color: Colors.black45),
                        ),
                        iconEnabledColor: UIDataColors.fieldGreenColor,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Company',
                            child: Text('Company'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Individual',
                            child: Text('Individual'),
                          ),
                        ],
                        onChanged: (value) {
                          _.typeValue = value;
                        }),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableButton(
                    padding: EdgeInsets.only(
                        left: 35, right: 35, top: 10, bottom: 10),
                    elevation: 3,
                    fontsize: 17,
                    onPressed: () {
                      // _.projectName.value = _.NameController.text;

                      // _.projectType.value = _.TypeController.text;
                      _.submitForm();
                      Get.back();
                    },
                    label: "Submit",
                    buttonCurve: 2.0,
                    color: UIDataColors.fieldGreenColor,
                    showBorder: false,
                  ),
                  ReusableButton(
                    padding: EdgeInsets.only(
                        left: 35, right: 35, top: 10, bottom: 10),
                    // elevation: 3,
                    fontsize: 17,
                    onPressed: () {},
                    label: "Cancel",
                    buttonCurve: 2.0,
                    color: UIDataColors.whiteColor,
                    textcolor: UIDataColors.fieldGreenColor,
                    showBorder: true,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: true,
      enableHeader: false,
      headerName: false,
      showFAB: false,
      showAppBar: true,
      showBottomNav: false,
      appTitle: 'Create Customer',
    );
  }
}
