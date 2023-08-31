  
  List<Items> itemsFromJson(dynamic str) => List<Items>.from(str.map((x) => Items.fromJson(x)));

class Items {
  String? name;

  Items({this.name});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}