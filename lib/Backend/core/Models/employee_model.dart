// ignore_for_file: prefer_initializing_formals, prefer_collection_literals

class EmployeeModel {
  String? id;
  String? name;
  String? imageUrl;

  String? phone;

  EmployeeModel({
    this.id,
    this.imageUrl,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = imageUrl;
    data["phone"] = phone;

    return data;
  }

  EmployeeModel.fromJson(json, id) {
    this.id = id;
    name = json['name'];
    imageUrl = json['image'];
    phone = json["phone"];
  }
}
