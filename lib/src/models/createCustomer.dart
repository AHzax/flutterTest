class Customer {
  final String? name;
  final String? type;
  final String? group;
  final String? territory;

  Customer({
    required this.name,
    required this.type,
    this.group,
    required this.territory,
  });

  factory Customer.fromJson(Map<String, dynamic> data) {
    return Customer(
      name: data['customer_name'],
      type: data['customer_type'],
      group: data['customer_group'],
      territory: data['territory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_name': name,
      'customer_type': type,
      'customer_group': group,
      'territory': territory,
    };
  }

  Map<String, dynamic> toApiJson() {
    return {
      'name': name,
      'customer_type': type,
      'customer_group': group,
      'territory': territory,
    };
  }
}
