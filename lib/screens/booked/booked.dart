import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/screens/Department/department_provider.dart';
import 'package:project/screens/DoctorsList/doctors_listing.dart';
import 'package:project/screens/DoctorsList/doctors_listing_provider.dart';
import 'package:provider/provider.dart';

class BookingCompleted extends StatelessWidget {
  const BookingCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Booking Details"),
        ),
        body: Consumer<DoctorsProvider>(builder: ((context, value, child) {
          return Center(
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 400)),
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date of appointment :${value.date!}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Room No :${14}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Time        : ${value.time!} ",
                      style: TextStyle(fontSize: 20)),
                  Text("Token no    :" + value.currentToken.toString(),
                      style: TextStyle(fontSize: 20)),
                  Text("Doctor name : ${value.selectedDoctor.toString()}",
                      style: TextStyle(fontSize: 20)),
                  Text("Department name : ${value.selectedDepartment}",
                      style: TextStyle(fontSize: 20))
                ],
              ),
            ),
          );
        })));
  }
}
