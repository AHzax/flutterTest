  
  List<items> itemsFromJson(dynamic str) => List<items>.from(str.map((x) => items.fromJson(x)));

class items {
  String? name;

  items({this.name});

  items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}