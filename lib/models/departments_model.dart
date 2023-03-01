class Departments {
  List<Department>? departments;

  Departments({this.departments});

  Departments.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Department>[];
      json['departments'].forEach((v) {
        departments!.add(new Department.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Department {
  int? id;
  String? name;
  bool? available;

  Department({this.id, this.name, this.available});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['available'] = this.available;
    return data;
  }
}
