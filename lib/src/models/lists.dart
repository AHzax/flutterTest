// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

Projects projectsFromJson(String str) => Projects.fromJson(json.decode(str));

String projectsToJson(Projects data) => json.encode(data.toJson());

class Projects {
    String? name;
    String? owner;
    DateTime? creation;
    DateTime? modified;
    String? modifiedBy;
    int? docstatus;
    int? idx;
    String? namingSeries;
    String? projectName;
    String? status;
    String? projectType;
    String? isActive;
    String? percentCompleteMethod;
    int? percentComplete;
    String? projectTemplate;
    DateTime? expectedStartDate;
    DateTime? expectedEndDate;
    String? priority;
    String? department;
    String? customer;
    int? actualTime;
    int? estimatedCosting;
    int? totalCostingAmount;
    int? totalExpenseClaim;
    int? totalPurchaseCost;
    String? company;
    int? totalSalesAmount;
    int? totalBillableAmount;
    int? totalBilledAmount;
    int? totalConsumedMaterialCost;
    String? costCenter;
    int? grossMargin;
    int? perGrossMargin;
    int? collectProgress;
    String? frequency;
    String? fromTime;
    String? toTime;
    String? firstEmail;
    String? secondEmail;
    String? dailyTimeToSend;
    String? dayToSend;
    String? weeklyTimeToSend;
    String? doctype;
    List<dynamic>? users;

    Projects({
        this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.namingSeries,
        this.projectName,
        this.status,
        this.projectType,
        this.isActive,
        this.percentCompleteMethod,
        this.percentComplete,
        this.projectTemplate,
        this.expectedStartDate,
        this.expectedEndDate,
        this.priority,
        this.department,
        this.customer,
        this.actualTime,
        this.estimatedCosting,
        this.totalCostingAmount,
        this.totalExpenseClaim,
        this.totalPurchaseCost,
        this.company,
        this.totalSalesAmount,
        this.totalBillableAmount,
        this.totalBilledAmount,
        this.totalConsumedMaterialCost,
        this.costCenter,
        this.grossMargin,
        this.perGrossMargin,
        this.collectProgress,
        this.frequency,
        this.fromTime,
        this.toTime,
        this.firstEmail,
        this.secondEmail,
        this.dailyTimeToSend,
        this.dayToSend,
        this.weeklyTimeToSend,
        this.doctype,
        this.users,
    });

    factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        name: json["name"],
        owner: json["owner"],
        creation: json["creation"] == null ? null : DateTime.parse(json["creation"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        docstatus: json["docstatus"],
        idx: json["idx"],
        namingSeries: json["naming_series"],
        projectName: json["project_name"],
        status: json["status"],
        projectType: json["project_type"],
        isActive: json["is_active"],
        percentCompleteMethod: json["percent_complete_method"],
        percentComplete: json["percent_complete"],
        projectTemplate: json["project_template"],
        expectedStartDate: json["expected_start_date"] == null ? null : DateTime.parse(json["expected_start_date"]),
        expectedEndDate: json["expected_end_date"] == null ? null : DateTime.parse(json["expected_end_date"]),
        priority: json["priority"],
        department: json["department"],
        customer: json["customer"],
        actualTime: json["actual_time"],
        estimatedCosting: json["estimated_costing"],
        totalCostingAmount: json["total_costing_amount"],
        totalExpenseClaim: json["total_expense_claim"],
        totalPurchaseCost: json["total_purchase_cost"],
        company: json["company"],
        totalSalesAmount: json["total_sales_amount"],
        totalBillableAmount: json["total_billable_amount"],
        totalBilledAmount: json["total_billed_amount"],
        totalConsumedMaterialCost: json["total_consumed_material_cost"],
        costCenter: json["cost_center"],
        grossMargin: json["gross_margin"],
        perGrossMargin: json["per_gross_margin"],
        collectProgress: json["collect_progress"],
        frequency: json["frequency"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        firstEmail: json["first_email"],
        secondEmail: json["second_email"],
        dailyTimeToSend: json["daily_time_to_send"],
        dayToSend: json["day_to_send"],
        weeklyTimeToSend: json["weekly_time_to_send"],
        doctype: json["doctype"],
        users: json["users"] == null ? [] : List<dynamic>.from(json["users"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "naming_series": namingSeries,
        "project_name": projectName,
        "status": status,
        "project_type": projectType,
        "is_active": isActive,
        "percent_complete_method": percentCompleteMethod,
        "percent_complete": percentComplete,
        "project_template": projectTemplate,
        "expected_start_date": "${expectedStartDate!.year.toString().padLeft(4, '0')}-${expectedStartDate!.month.toString().padLeft(2, '0')}-${expectedStartDate!.day.toString().padLeft(2, '0')}",
        "expected_end_date": "${expectedEndDate!.year.toString().padLeft(4, '0')}-${expectedEndDate!.month.toString().padLeft(2, '0')}-${expectedEndDate!.day.toString().padLeft(2, '0')}",
        "priority": priority,
        "department": department,
        "customer": customer,
        "actual_time": actualTime,
        "estimated_costing": estimatedCosting,
        "total_costing_amount": totalCostingAmount,
        "total_expense_claim": totalExpenseClaim,
        "total_purchase_cost": totalPurchaseCost,
        "company": company,
        "total_sales_amount": totalSalesAmount,
        "total_billable_amount": totalBillableAmount,
        "total_billed_amount": totalBilledAmount,
        "total_consumed_material_cost": totalConsumedMaterialCost,
        "cost_center": costCenter,
        "gross_margin": grossMargin,
        "per_gross_margin": perGrossMargin,
        "collect_progress": collectProgress,
        "frequency": frequency,
        "from_time": fromTime,
        "to_time": toTime,
        "first_email": firstEmail,
        "second_email": secondEmail,
        "daily_time_to_send": dailyTimeToSend,
        "day_to_send": dayToSend,
        "weekly_time_to_send": weeklyTimeToSend,
        "doctype": doctype,
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x)),
    };
}
