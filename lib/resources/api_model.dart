// class ApiModel {
//   String? error;
//   String? status;
//   List<Datum>? data;
//   String? message;

//   ApiModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//   ApiModel.withError(String errorMessage) {
//     error = errorMessage;
//   }

//   factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
//         status: json["status"],
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//       };
// }

// class Datum {
//   int? id;
//   String? employeeName;
//   int? employeeSalary;
//   int? employeeAge;
//   String? profileImage;

//   Datum({
//     this.id,
//     this.employeeName,
//     this.employeeSalary,
//     this.employeeAge,
//     this.profileImage,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         employeeName: json["employee_name"],
//         employeeSalary: json["employee_salary"],
//         employeeAge: json["employee_age"],
//         profileImage: json["profile_image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "employee_name": employeeName,
//         "employee_salary": employeeSalary,
//         "employee_age": employeeAge,
//         "profile_image": profileImage,
//       };
// }

// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
  String? error;
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ApiModel({
    this.error,
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });
  ApiModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        error: json["error"],
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
        "error": error,
      };
}
