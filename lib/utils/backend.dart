import 'dart:math';

int tokenno = 1000;
List<String> detailsList = [
  "profile",
  "call",
  "call asistend",
];
List<String> availabletimes = List<String>.generate(3, (index) => "12:0$index");
List<String> datesAvailable = [
  "12:01:2023",
  "12:02:2023",
  "12:03:2023",
  "12:04:2023",
];

List<DateTime> availableDates = [
  DateTime.utc(2023, 3),
  DateTime.utc(2023, 4),
  DateTime.utc(2023, 5)
];
List<String> departmentsList = ["oncology", "gynecology", "optalmology"];
List<String> doctorsnames = [
  "Dr Anirudh",
  "Dr ambedkar",
  "Dr RajKumar",
  "Dr seetharaman",
  "Dr Jayalakshmi"
];
List<String> isdoctoravailable = [
  'Book on ${availableDates[Random().nextInt(availableDates.length)].toUtc().toIso8601String().replaceRange(10, 24, " ")}',
  "Book now select Token"
];

List<String> tokens = List<String>.generate(4, (index) => "${tokenno + index}");
List<String> duratedToken =
    List<String>.generate(4, (index) => "${tokenno + index}");

var allDepartments = {
  "departments": List.generate(departmentsList.length, ((index) {
    return {'id': index, 'name': departmentsList[index], 'available': true};
  }))
};

var allDoctos = {
  "doctors": List.generate(20, ((index) {
    return {
      'id': index,
      'name': doctorsnames[Random().nextInt(doctorsnames.length)],
      'department': departmentsList[Random().nextInt(departmentsList.length)],
      'available': isdoctoravailable[Random().nextInt(isdoctoravailable.length)]
    };
  }))
};


// {"doctors":[{
//       "id": index,
//       "name": "name$index",
//       "department": "department$index",
//       "available": true
//     }]}