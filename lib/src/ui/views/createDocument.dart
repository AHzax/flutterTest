import 'package:docapp/src/controllers/createProjectController.dart';
import 'package:docapp/src/ui/widgets/forms/textfields/textformfield_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/config/uidata.dart';

import '../widgets/common_scaffold.dart';

class CreateDocumentPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<CreateProjectController>(builder: (_) {
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
                    hintText: "Project Name",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.nameController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Owner",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "inter",
                      color: UIDataColors.fieldGreenColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextFormFieldContainer(
                    commonColor: UIDataColors.fieldGreenColor,
                    hintText: "Owner Name",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.ownerController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 35,
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
                    hintText: "Project Type",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.typeController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 35,
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
                        // dropdownColor: Color.fromARGB(255, 172, 255, 180),
                        hint: Text("Status"),
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
                        hint: Text("Priority"),
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
                height: 35,
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
                    hintText: "Project Department",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.black38),
                    controllerText: _.departmentController,
                    // labelText: "Project Name",
                  ),
                ],
              ),
              SizedBox(
                height: 35,
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
      appTitle: 'Create Documents',
    );
  }
}
