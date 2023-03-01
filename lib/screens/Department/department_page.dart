import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/screens/Department/department_provider.dart';
import 'package:project/screens/loginPage/login_provider.dart';
import 'package:provider/provider.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<DepartmentProvider>(context).;
    return Scaffold(
      appBar: AppBar(
        title: Text("Department"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                padding: EdgeInsets.only(top: 20),
                scrollDirection: Axis.vertical,
                itemCount: context
                    .read<DepartmentProvider>()
                    .allDepartmentsjson!
                    .departments!
                    .length,
                shrinkWrap: true,
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 5,
                  );
                }),
                itemBuilder: (context, index) {
                  return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      onPressed: () {
                        context
                            .read<DepartmentProvider>()
                            .setCurrentDepartment(index);
                        context.read<DepartmentProvider>().ontap(context);
                      },
                      child: ListTile(
                        leading: Text(context
                            .watch<DepartmentProvider>()
                            .allDepartmentsjson!
                            .departments![index]
                            .id
                            .toString()),
                        title: Text(context
                            .watch<DepartmentProvider>()
                            .allDepartmentsjson!
                            .departments![index]
                            .name
                            .toString()),
                        trailing: Text(context
                            .watch<DepartmentProvider>()
                            .allDepartmentsjson!
                            .departments![index]
                            .available
                            .toString()),
                      ));
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
