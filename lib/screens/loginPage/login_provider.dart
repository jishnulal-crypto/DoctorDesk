import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/Department/department_page.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController? usernameController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  bool validated = false;
  void validate() {
    validated = formkey.currentState!.validate();
    notifyListeners();
  }

  void onchange(String value) {
    notifyListeners();
  }

  void login(BuildContext context) {
    if (validated == false) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return DepartmentPage();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('fill the Fields')),
      );
    }

    notifyListeners();
  }
}
