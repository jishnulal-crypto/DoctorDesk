import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/Department/department_provider.dart';
import 'package:project/screens/DoctorsList/doctors_listing_provider.dart';
import 'package:project/screens/booked/booked.dart';
import 'package:project/utils/backend.dart';
import 'package:provider/provider.dart';

class DoctorsPage extends StatelessWidget {
  DoctorsPage({this.whichdepartment, super.key});

  String? whichdepartment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        actions: [
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return BookingCompleted();
                })));
              },
              icon: Icon(
                Icons.book,
                color: Colors.white,
              ),
              label: Text(
                "show",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: context
                    .read<DoctorsProvider>()
                    .allDoctorsjson!
                    .doctors!
                    .length,
                shrinkWrap: true,
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 5,
                  );
                }),
                itemBuilder: (context, index) {
                  if (context
                          .watch<DoctorsProvider>()
                          .allDoctorsjson!
                          .doctors![index]
                          .department ==
                      whichdepartment) {
                    print(whichdepartment);
                    return OutlinedButton(
                        onPressed: () {
                          context.read<DoctorsProvider>().doctor(index);
                          context
                              .read<DoctorsProvider>()
                              .showSelectionSheet(context, index);
                        },
                        child: ListTile(
                          leading: Text(context
                              .watch<DoctorsProvider>()
                              .allDoctorsjson!
                              .doctors![index]
                              .id!
                              .toString()),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(context
                                  .watch<DoctorsProvider>()
                                  .allDoctorsjson!
                                  .doctors![index]
                                  .name
                                  .toString()),
                              Text(context
                                  .watch<DoctorsProvider>()
                                  .allDoctorsjson!
                                  .doctors![index]
                                  .available
                                  .toString())
                            ],
                          ),
                          subtitle: Text(context
                              .watch<DoctorsProvider>()
                              .allDoctorsjson!
                              .doctors![index]
                              .department
                              .toString()),
                          trailing: PopupMenuButton(
                              color: Colors.blue[100],
                              enabled: true,
                              initialValue: tokens.first,
                              onSelected: (value) {},
                              onCanceled: () {
                                // context.read<DoctorsProvider>().oncancelled();
                              },
                              itemBuilder: ((context) {
                                return List.generate(detailsList.length, (i) {
                                  return PopupMenuItem<String>(
                                      onTap: () {
                                        context
                                            .read<DoctorsProvider>()
                                            .ontap(detailsList[i], context);
                                      },
                                      child: Text(detailsList[i]));
                                });
                              })),
                        ));
                  } else {
                    return SizedBox(
                      height: 0,
                    );
                  }
                })
            // Consumer<DepartmentProvider>(builder: ((context, value, child) {
            //   // value.getdepartments();
            //   return
            // })),
          ],
        ),
      ),
    );
  }
}
