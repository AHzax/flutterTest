import 'package:intl/intl.dart';

class Task {
  final String? subject;
  final String? type;
  final String? status;
  final String? project;
  final String? priority;

  final DateTime? startDate;
  final DateTime? endDate;

  final String? name;

  Task({
    required this.subject,
    required this.type,
    this.status,
    this.project,
    this.startDate,
    this.endDate,
    this.priority,
    this.name,
  });

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
      subject: data['subject'],
      type: data['type'],
      status: data['status'],
      project: data['project'],
      priority: data["priority"],
      endDate: DateTime.parse(data["exp_end_date"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      'subject': subject,
      'type': type,
      'status': status,
      'project': project,
      'exp_start_date': startDate,
      'exp_end_date': endDate,
      "priority": priority,
    };
  }

  Map<String, dynamic> toApiJson() {
    return {
      "name": name,
      'subject': subject,
      'type': type,
      'status': status,
      'project': project,
      'exp_start_date': startDate != null
          ? DateFormat('yyyy-MM-dd hh:mm:ss').format(startDate!)
          : null,
      'exp_end_date': endDate != null
          ? DateFormat('yyyy-MM-dd hh:mm:ss').format(endDate!)
          : null,
      "priority": priority,
    };
  }
}
