class ListPegawaiModel {
  String status;
  List<DataListPegawaiModel> data;

  ListPegawaiModel({this.status, this.data});

  ListPegawaiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<DataListPegawaiModel>();
      json['data'].forEach((v) {
        data.add(new DataListPegawaiModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataListPegawaiModel {
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  DataListPegawaiModel(
      {this.id,
      this.employeeName,
      this.employeeSalary,
      this.employeeAge,
      this.profileImage});

  DataListPegawaiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeName = json['employee_name'];
    employeeSalary = json['employee_salary'];
    employeeAge = json['employee_age'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_name'] = this.employeeName;
    data['employee_salary'] = this.employeeSalary;
    data['employee_age'] = this.employeeAge;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
