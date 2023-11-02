import 'dart:convert';
import 'package:get/get.dart';
import '../../models/error.dart';
import '../../services/restclient.dart';

class FrappeHelper {
  RestClient restClient = Get.find<RestClient>();
  List<Map<String, dynamic>> _response = [];
  get response => _response;

  Future<void> getItem({
    required String doctype,
    required String fields,
    required List<List<String>> filters,
    String orderBy = "modified DESC",
    int start = 0,
    int pageLength = 20,
    String view = "List",
    String groupBy = "name",
    bool withCommentCount = true,
  }) async {
    try {
      Map<String, dynamic> params = {
        "doctype": doctype,
        "fields": fields,
        "filters": jsonEncode(filters),
        "order_by": orderBy,
        "start": start,
        "page_length": pageLength,
        "view": view,
        "group_by": groupBy,
        "with_comment_count": withCommentCount,
      };
      dynamic resItems = await restClient.sendRequest(
          '/method/frappe.desk.reportview.get',
          type: RequestType.post,
          data: params);
      // print('objectjjjjjjjjjjjjjjjjj');
      // print(resItems);
      parseResponse(resItems['message']);
    } on ErrorResponse catch (e) {
      print(e.statusMessage);
    } catch (e, s) {
      print("error $e");
      print("stack $s");
    }
  }

  void parseResponse(dynamic data) {
    print("datadatadata$data");
    data as Map<String, dynamic>;
    List values = data['values'];
    data['keys'] as List<dynamic>;
    Map<String, dynamic> r = {};
    List<Map<String, dynamic>> l = [];
    int i = 0;
    for (var d in values) {
      r = {};
      i = 0;
      for (var v in d) {
        r[data['keys'][i]] = v.toString();
        i++;
      }
      l.add(r);
    }
    // print('kkkkkkkkk');
    _response = l;
  }

  //   Future<void> getItem() async {
  //   try {
  //     Map<String, dynamic> params = {
  //       "doctype": "Project",
  //       "fields":
  //           '["project_name","expected_start_date","expected_end_date","project_type","department","status","owner"]',
  //       // "filters": '[["Project", "name", "in", "PROJ-0019"]]',
  //       "order_by": " modified DESC",
  //       "start": 0,
  //       "page_length": 20,
  //       "view": "List",
  //       "group_by": "name",
  //       "with_comment_count": true,
  //     };
  //     dynamic resItems = await restClient.sendRequest(
  //         '/method/frappe.desk.reportview.get',
  //         type: RequestType.get,
  //         data: params);
  //     print(resItems);
  //   } on ErrorResponse catch (e) {
  //     print(e.statusMessage);
  //   } catch (e, s) {
  //     print("error $e");
  //     print("stack $s");
  //   }
  // }
}
