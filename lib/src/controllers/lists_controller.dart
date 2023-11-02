import 'package:get/get.dart';

import '../models/createCustomer.dart';
import '../models/createProj.dart';
import '../models/createTask.dart';
import '../models/error.dart';
import '../services/restclient.dart';
import '../utils/helpers/frappeHelpers.dart';

class ListsController extends GetxController {
  final FrappeHelper frappeHelper = FrappeHelper();

  String docType = Get.arguments['docType'];

  bool isLoading = true;
  RestClient restClient = Get.find<RestClient>();
  dynamic res;
  List allPro = [];
  Map data = {};
  List<Project>? proj = [];
  List<Task>? task = [];
  List<Customer>? customer = [];

  dynamic resItems;

  Map projects = {};
  String? owner;
  String? ownerName;
  String? time;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    // await getUser();
    await getAllProject();

    switch (docType) {
      case 'project':
        await getProjData();

        break;
      case 'task':
        await getTaskData(false);
        break;

      case 'customer':
        await getCustomerData();
        break;

      default:
        await getProjData();
    }

    //  owner = allPro["data"]["owner"];
    // await getProject();

    isLoading = false;
    super.onReady();
  }

  // Future<void> getUser() async {
  //   try {
  //     res =
  //         await restClient.sendRequest('/resource/User', type: RequestType.get);
  //     data.addAll(res);

  //     update();
  //     print("Check Data ${res}");
  //   } catch (e) {
  //     print("Error is: ${e.toString()}");
  //   }
  // }

  Future<void> getAllProject() async {
    try {
      String path;
      switch (docType) {
        case 'project':
          path = '/method/$docType';
          break;
        case 'task':
          path = '/method/$docType';
          break;
        case 'customer':
          path = '/method/$docType';
          break;

        default:
          path = '/resource/$docType';
          break;
      }

      allPro = [];
      res = await restClient.sendRequest(path, type: RequestType.get);
      if (res["data"] != null) {
        if (res["data"].length > 0) {
          allPro = res["data"];
        }
      }

      update();
      print("Check Data allProoooooooooo;${allPro.toString()}");
    } catch (e, s) {
      print("Error is allProoooooooooo: ${e}");
      print("Error is stack allProoooooooooo: ${s}");
    }
  }

  String getTitle(String d, int i) {
    String title = '';
    switch (d) {
      case 'project':
        title = "${proj![i].name}";
        if (title.length > 11) {
          title = title.substring(0, 11);
        }
        break;
      case 'customer':
        title = "Lead: Jhon";

        break;
      case 'task':
        title = "${task![i].subject ?? ''}";

        break;
    }
    return title;
  }

  String getSubTitle(String d, int i) {
    String subtitle = '';
    switch (d) {
      case 'project':
        subtitle = "${proj![i].department ?? ''}";
        break;
      case 'customer':
        subtitle = "${customer![i].name ?? ''}";

        break;
      case 'task':
        subtitle = "Priority: ${task![i].priority ?? ''}";

        break;
    }
    return subtitle;
  }

  String getRTitle(String d, int i) {
    String rTitle = '';
    switch (d) {
      case 'project':
        rTitle = "${proj![i].endDate ?? ""}";
        if (rTitle.length > 11) {
          rTitle = rTitle.substring(0, 11);
        }
        break;
      case 'customer':
        rTitle = "${customer![i].territory ?? ''}";

        break;
      case 'task':
        rTitle = "${task![i].endDate ?? ''}";
        if (rTitle.length > 11) {
          rTitle = rTitle.substring(0, 11);
        }
        break;
    }
    return rTitle;
  }

  String getRSubtitle(String d, int i) {
    String rTitle = '';
    switch (d) {
      case 'project':
        rTitle = "${proj![i].status ?? ""}";

        break;
      case 'customer':
        rTitle = "";

        break;
      case 'task':
        rTitle = "${task![i].status ?? ''}";

        break;
    }
    return rTitle;
  }

  String getbelowRSub(String d, int i) {
    String type = '';
    switch (d) {
      case 'project':
        if (type.length > 11) {
          type = type.substring(0, 9);
        } else {
          type = "type: ${proj![i].type ?? ''}";
        }
        // type.toString() == "Human Resources" ? type = "HR" : null;
        break;
      case 'customer':
        type = "group: ${customer![i].type ?? ''}";

        break;
      case 'task':
        type = '${task![i].type}';

        break;
    }
    return type;
  }

  String getBelowSub(String d, int i) {
    String bSub = '';
    switch (d) {
      case 'project':
        bSub = "${proj![i].owner ?? ""}";
        // type.toString() == "Human Resources" ? type = "HR" : null;
        break;
      case 'customer':
        bSub = "Type: ${customer![i].group ?? ""}";

        ///different in postman vs frappe!!!

        break;
      case 'task':
        bSub = "${task![i].project ?? ""}";

        break;
      default:
        bSub = "${allPro[i]["owner"] ?? ""}";
        break;
    }
    return bSub;
  }

  Future<void> getProjData() async {
    await frappeHelper.getItem(
      doctype: "Project",
      fields:
          '["project_name","expected_end_date","project_type","department","status","owner"]',
      filters: [
        // ["Item", "item_code", "not like", " %service%"],
        // ["Item", "disabled", "in", "no"]
      ],
    );
    // print(frappeHelper.response);
    // List<Item> res = [];
    // print(Item());
    frappeHelper.response.forEach((e) {
      print('hahahahahha${e['project_name']}');
      proj!.add(Project.fromJson({
        'project_name': e['project_name'],
        "project_type": e['project_type'],
        "status": e['status'],
        "department": e['department'],
        "owner": e["owner"],
        "expected_end_date": e["expected_end_date"],
      }));
    });
    // frappeHelper.convertToItemList();
    print("###############################$proj");
    // isLoading = false;
    update();
  }

  Future<void> getTaskData(bool? filter) async {
    filter == true
        ? await frappeHelper.getItem(
            doctype: "Task",
            fields:
                '["subject","exp_end_date","type","status","project","priority"]', 
            filters: [
              // ["Item", "item_code", "not like", "%service%"],
              ["Task", "status", "in", "Open"],
            ],
          )
        : await frappeHelper.getItem(
            doctype: "Task",
            fields:
                '["subject","exp_end_date","type","status","project","priority"]',
            filters: [
              // ["Item", "item_code", "not like", "%service%"],
              // ["Task", "status", "in", "Open"],
            ],
          );
    // print(frappeHelper.response);
    // List<Item> res = [];
    // print(Item());

    frappeHelper.response.forEach((e) {
      print('hahahahahha${e['subject']}');
      task!.add(Task.fromJson({
        'subject': e['subject'],
        "type": e['type'],
        "status": e['status'],
        "project": e['project'],
        "priority": e["priority"],
        "exp_end_date": e["exp_end_date"],
      }));
    });
    // frappeHelper.convertToItemList();
    print("###############################$task");
    // isLoading = false;
    update();
  }

  Future<void> getCustomerData() async {
    await frappeHelper.getItem(
      doctype: "Customer",
      fields: '["customer_name","customer_type","customer_group","territory"]',
      filters: [
        // ["Item", "item_code", "not like", "%service%"],
      ],
    );
    // print(frappeHelper.response);
    // List<Item> res = [];
    // print(Item());
    frappeHelper.response.forEach((e) {
      print('hahahahahha${e['customer_name']}');
      customer!.add(Customer.fromJson({
        'customer_name': e['customer_name'],
        "customer_type": e['customer_type'],
        "customer_group": e['customer_group'],
        "territory": e['territory'],
      }));
    });
    // frappeHelper.convertToItemList();
    print("###############################$task");
    isLoading = false;
    update();
  }

 
}
