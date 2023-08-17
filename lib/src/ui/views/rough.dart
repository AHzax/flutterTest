    // SingleChildScrollView(
    //                                     child: Column(
    //                                       children: [
    //                                         ListView.builder(
    //                                           shrinkWrap: true,
    //                                           physics:
    //                                               NeverScrollableScrollPhysics(),
    //                                           itemCount:
    //                                               _.allPro["data"].length,
    //                                           itemBuilder: (c, i) {
    //                                             return Listcard(
    //                                               title:
    //                                                   "${_.allPro["data"][i]["name"]}",
    //                                               subtitle:
    //                                                   "${_.projects["data"]["department"]}",
    //                                               time: _.Time,
    //                                               owner: _.OwnerName,
    //                                               type:
    //                                                   "type: ${_.projects["data"]["project_type"]}",
    //                                               date:
    //                                                   "${_.projects["data"]["expected_end_date"]}",
    //                                             );
    //                                           },
    //                                         ).marginOnly(left: 15, right: 15),
    //                                       ],
    //                                     ),
    //                                   ),
                  







                  ///////////////////////////////////controller///////////////////////////////
        
  //        Future<void> getAllProject() async {
  //   try {
  //     res = await restClient.sendRequest('/resource/Project',
  //         type: RequestType.get);
  //     allPro.addAll(res);
  //     update();
  //     print("Check Data allProoooooooooo;${allPro.toString()}");
  //   } catch (e, s) {
  //     print("Error is allProoooooooooo: ${e}");
  //     print("Error is stack allProoooooooooo: ${s}");
  //   }
  // }

  // Future<void> getProject() async {
  //   try {
  //     res = await restClient.sendRequest('/resource/Project/PROJ-0001',
  //         type: RequestType.get);
  //     projects.addAll(res);
  //     spliting();
  //     update();
  //     print("Check Data projects;${projects.toString()}");
  //   } catch (e, s) {
  //     print("Error is: ${e}");
  //     print("Error is stack: ${s}");
  //   }
  // }

  // void spliting() {
  //   String owner = projects["data"]["owner"];
  //   dynamic ownerName = owner.split("@");
  //   OwnerName = ownerName[0];
  //   String time = projects["data"]["to_time"];
  //   dynamic splitTime = time.split(".");
  //   print("spliting splitingspliting spliting${splitTime[0]}");
  //   Time = splitTime[0];
  // }


  //////////////////////variables and calling/////////////////////////
  
  //  Map allPro = {};
  // Map data = {};

  // Map projects = {};

  // String? OwnerName;
  // String? Time;

