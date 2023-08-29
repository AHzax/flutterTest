import 'package:intl/intl.dart';

class Project {
  final String? name;
  final String? type;
  final String? status;
  final String? department;
  final DateTime? startDate;

  final String? priority;

  final DateTime? endDate;

  Project({
    this.name,
    this.type,
    this.status,
    this.department,
    this.startDate,
    this.endDate,
    this.priority,
  });



 factory Project.fromJson(Map<String, dynamic> data) {
    return Project(
      name: data['name'],
      // type: data['project_type'],
      // status: data['status'],
      // department: data['department'],
      // priority: data["priority"],
      // startDate: data["expected_start_date"],
      // endDate: data["expected_end_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'project_name': name,
      'project_type': type,
      'status': status,
      'department': department,
      'expected_start_date': startDate,
      'expected_end_date': endDate,
      "priority": priority,
    };
  }

  Map<String, dynamic> toApiJson() {
    return {
      'name': name,
      'project_name': name,
      'project_type': type,
      'status': status,
      'department': department,
      'expected_start_date': startDate != null
          ? DateFormat('yyyy-MM-dd hh:mm:ss').format(startDate!)
          : null,
      'expected_end_date': endDate != null
          ? DateFormat('yyyy-MM-dd hh:mm:ss').format(endDate!)
          : null,
      "priority": priority,
    };
  }
  
 
}
