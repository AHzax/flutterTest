import 'package:docapp/src/ui/widgets/buttons/raised_button.dart';
import 'package:docapp/src/ui/widgets/forms/textfields/textformfield_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/createTaskController.dart';
import '../../utils/config/uidata.dart';

import '../widgets/common_scaffold.dart';

class CreateTaskPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<CreateTaskController>(builder: (_) {
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
                    "Subject",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter",
                      color: UIDataColors.fieldGreenColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextFormFieldContainer(
                    commonColor: UIDataColors.fieldGreenColor,
                    hintText: "Subject Name",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.NameController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reference",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter",
                      color: UIDataColors.fieldGreenColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextFormFieldContainer(
                    commonColor: UIDataColors.fieldGreenColor,
                    hintText: "Project Ref",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.OwnerController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Status / priority",
              //       style: TextStyle(
              //         fontSize: 17,
              //         fontFamily: "inter",
              //         color: UIDataColors.fieldGreenColor,
              //         fontWeight: FontWeight.w300,
              //       ),
              //     ),
              //     TextFormFieldContainer(
              //       commonColor: UIDataColors.fieldGreenColor,
              //       hintText: "Project Status",
              //       hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
              //       controllerText: _.controller,
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
                          "Status",
                          style: TextStyle(color: UIDataColors.fieldGreenColor),
                        ),
                        iconEnabledColor: UIDataColors.fieldGreenColor,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Open',
                            child: Text('Open'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Completed',
                            child: Text('Completed'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Cancelled',
                            child: Text('Cancelled'),
                          ),
                        ],
                        onChanged: (value) {}),
                  ),
                  Container(
                    width: Get.width / 3,
                    child: DropdownButtonFormField(
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
                          "Priority",
                          style: TextStyle(color: UIDataColors.fieldGreenColor),
                        ),
                        iconEnabledColor: UIDataColors.fieldGreenColor,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'High',
                            child: Text('High'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Medium',
                            child: Text('Medium'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Low',
                            child: Text('Low'),
                          ),
                        ],
                        onChanged: (value) {}),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter",
                      color: UIDataColors.fieldGreenColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextFormFieldContainer(
                    commonColor: UIDataColors.fieldGreenColor,
                    hintText: "Task Type",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.TypeController,
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
                    height: Get.width / 9,
                    width: Get.width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1.3,
                          color: Color(0xFF91CF97),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(4)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                            color: Color(0xFF91CF97),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      onPressed: () => _.openDatePicker(1),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _.selectedDate1.value.toString().split(' ')[0],
                                style: TextStyle(color: Color(0xFF91CF97)),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF91CF97),
                              )
                            ],
                          )),
                    ),
                  ),
                  ////////////////////////////////////////////
                  Container(
                    height: Get.width / 9,
                    width: Get.width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 1.3,
                          color: Color(0xFF91CF97),
                        ),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(4)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                            color: Color(0xFF91CF97),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      onPressed: () => _.openDatePicker(2),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _.selectedDate2.value.toString().split(' ')[0],
                                style: TextStyle(color: Color(0xFF91CF97)),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF91CF97),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Department",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter",
                      color: UIDataColors.fieldGreenColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextFormFieldContainer(
                    commonColor: UIDataColors.fieldGreenColor,
                    hintText: "Task Department",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.DepartmentController,
                    // labelText: "Project Name",
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableButton(
                        padding: EdgeInsets.only(
                            left: 35, right: 35, top: 10, bottom: 10),
                        elevation: 3,
                        fontsize: 17,
                        onPressed: () {},
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
              SizedBox(
                height: 20,
              ),
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
      appTitle: 'Create Tasks',
    );
  }
}
