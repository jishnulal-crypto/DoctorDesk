import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/departments_model.dart';
import 'package:project/screens/DoctorsList/doctors_listing.dart';
import 'package:project/utils/backend.dart';

class DepartmentProvider extends ChangeNotifier {
  Departments? allDepartmentsjson = Departments.fromJson(allDepartments);
  String? selectedDepartment;
  // void getdepartments() {
  //   allDepartmentsjson = ;
  //   notifyListeners();
  // }
  void setCurrentDepartment(int index) {
    selectedDepartment = allDepartmentsjson!.departments![index].name;
    print(selectedDepartment);
    notifyListeners();
  }

  void ontap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DoctorsPage(
        whichdepartment: selectedDepartment,
      );
    }));
    notifyListeners();
  }
}
