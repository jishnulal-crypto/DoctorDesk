import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/models/departments_model.dart';
import 'package:project/models/doctors_model.dart';
import 'package:project/screens/booked/booked.dart';
import 'package:project/screens/datesPage/dates_page.dart';
import 'package:project/utils/backend.dart';

class DoctorsProvider extends ChangeNotifier {
  Doctors? allDoctorsjson = Doctors.fromJson(allDoctos);
  String? currentToken = tokens.first;

  bool tokenSelected = false;
  String? date = datesAvailable.first;
  String? time = availabletimes.first;
  String? selectedDoctor;
  String? selectedDepartment;

  void doctor(int index) {
    selectedDoctor = allDoctorsjson!.doctors![index].name;
    selectedDepartment = allDoctorsjson!.doctors![index].department;
    notifyListeners();
  }

  void oncancelled(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Token not selected"),
      duration: Duration(seconds: 3),
    ));
    notifyListeners();
  }

  void toast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Booking completed\nClick show"),
      duration: Duration(seconds: 3),
    ));
  }

  void navigate(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return BookingCompleted();
      }));
    });
  }

  void ontap(String token, BuildContext context) {
    currentToken = token;
    tokenSelected = true;
    notifyListeners();
    toast(context);
    navigate(context);
  }

  void showSelectionSheet(BuildContext context, int index) async {
    Scaffold.of(context).showBottomSheet((context) {
      if (allDoctorsjson!.doctors![index].available ==
          "Book now select Token") {
        return bookIfDrAvailable(
          context,
        );
      }
      return bookIfDrAvailableAfter(context);
    });

    // if (tokenSelected == true) {
    //   navigate(context);
    // }
    // dateTime = await showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime.utc(2023),
    //     lastDate: DateTime.utc(2023, 5, 1));
    // if (dateTime == null) {
    //   return;
    // }

    // timeOfDay =
    //     await showTimePicker(context: context, initialTime: TimeOfDay.now());
    // if (timeOfDay == null) {
    //   return;
    // }

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("Booking completed"),
    //   duration: Duration(seconds: 3),
    // ));
    // Future.delayed(Duration(seconds: 4), () {
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //     return BookingCompleted();
    //   }));
    // });

    // Scaffold.of(context).showBottomSheet((context) {
    //   return Container(
    //       color: Colors.blue,
    //       width: MediaQuery.of(context).size.width,
    //       height: 300,
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [

    //           ],
    //         ),
    //       ));
    // });
  }

  Widget bookIfDrAvailableAfter(BuildContext context) {
    // if (tokenSelected = true) {
    //   tokenSelected = false;
    // }
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: Colors.blue[100],
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Available Dates",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      tokenSelected = false;
                      currentToken = "";
                      setState(
                        () {},
                      );
                    },
                    icon: Icon(Icons.close),
                    label: Text("back"))
              ],
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: datesAvailable.length,
                itemBuilder: ((context, index) {
                  return RadioListTile<String>(
                      title: Text(datesAvailable[index]),
                      value: datesAvailable[index],
                      groupValue: date,
                      onChanged: ((value) {
                        print(value);
                        date = value!;
                        setState(() {});
                      }));
                })),
            Text("  Available Time",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: availabletimes.length,
                itemBuilder: ((context, index) {
                  return RadioListTile<String>(
                      title: Text(availabletimes[index]),
                      value: availabletimes[index],
                      groupValue: time,
                      onChanged: ((value) {
                        print(value);
                        time = value!;
                        setState(
                          () {},
                        );
                      }));
                })),
            OutlinedButton(
              onPressed: () {
                currentToken = duratedToken.removeLast();
                tokenSelected = true;
                Navigator.pop(context);
                toast(context);
                setState(
                  () {},
                );
              },
              child: Text("submit"),
            )
          ],
        ),
      );
    });
  }

  Widget bookIfDrAvailable(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        color: Colors.blue[100],
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Select Token",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    label: Text("back"))
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: availabletimes.length,
                itemBuilder: ((context, index) {
                  return RadioListTile<String>(
                      title: Text(tokens[index]),
                      value: tokens[index],
                      groupValue: currentToken,
                      onChanged: ((value) {
                        currentToken = value;
                        setState(() {});
                      }));
                })),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  tokenSelected = true;
                  navigate(context);
                  Navigator.pop(context);
                  toast(context);
                  setState(
                    () {},
                  );
                },
                child: Text("submit"),
              ),
            )
          ],
        ),
      );
    });
  }

  bool enabledOrDisabledpopUp(int index) {
    if (allDoctorsjson!.doctors![index].available == "available") {
      return true;
    } else {
      return false;
    }
  }

  // void onselected(String value, BuildContext context) {
  //   currentToken = value;
  //   tokenSelected = true;
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));

  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //     return BookingCompleted();
  //   }));
  //   notifyListeners();
  // }

  // void ontap(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //     return TokenPage();
  //   }));
  //   notifyListeners();
  // }
}
