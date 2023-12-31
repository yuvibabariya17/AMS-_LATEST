import 'dart:convert';

CourseListModel courseListModelFromJson(String str) =>
    CourseListModel.fromJson(json.decode(str));

String courseListModelToJson(CourseListModel data) =>
    json.encode(data.toJson());

class CourseListModel {
  int status;
  String message;
  List<courselist> data;
  int totalRecord;
  int totalPages;

  CourseListModel({
    required this.status,
    required this.message,
    required this.data,
    required this.totalRecord,
    required this.totalPages,
  });

  factory CourseListModel.fromJson(Map<String, dynamic> json) =>
      CourseListModel(
        status: json["status"],
        message: json["message"],
        data: List<courselist>.from(json["data"].map((x) => courselist.fromJson(x))),
        totalRecord: json["totalRecord"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalRecord": totalRecord,
        "totalPages": totalPages,
      };
}

class courselist {
  String id;
  String name;
  String thumbnailUrl;
  int duration;
  int fees;
  String description;
  int createdAt;
  VendorInfo vendorInfo;
  ThumbnailUrlInfo thumbnailUrlInfo;

  courselist({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.duration,
    required this.fees,
    required this.description,
    required this.createdAt,
    required this.vendorInfo,
    required this.thumbnailUrlInfo,
  });

  factory courselist.fromJson(Map<String, dynamic> json) => courselist(
        id: json["_id"],
        name: json["name"],
        thumbnailUrl: json["thumbnail_url"],
        duration: json["duration"],
        fees: json["fees"],
        description: json["description"],
        createdAt: json["created_at"],
        vendorInfo: VendorInfo.fromJson(json["vendor_info"]),
        thumbnailUrlInfo: ThumbnailUrlInfo.fromJson(json["thumbnail_url_info"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "thumbnail_url": thumbnailUrl,
        "duration": duration,
        "fees": fees,
        "description": description,
        "created_at": createdAt,
        "vendor_info": vendorInfo.toJson(),
        "thumbnail_url_info": thumbnailUrlInfo.toJson(),
      };
}

class ThumbnailUrlInfo {
  String image;

  ThumbnailUrlInfo({
    required this.image,
  });

  factory ThumbnailUrlInfo.fromJson(Map<String, dynamic> json) =>
      ThumbnailUrlInfo(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class VendorInfo {
  String? vendorType;
  String companyName;
  String? contactNo1;
  String emailId;
  String? whatsappNo;
  String role;
  String? userName;
  String contactPersonName;

  VendorInfo({
    required this.vendorType,
    required this.companyName,
    required this.contactNo1,
    required this.emailId,
    required this.whatsappNo,
    required this.role,
    required this.userName,
    required this.contactPersonName,
  });

  factory VendorInfo.fromJson(Map<String, dynamic> json) => VendorInfo(
        vendorType: json["vendor_type"],
        companyName: json["company_name"],
        contactNo1: json["contact_no1"],
        emailId: json["email_id"],
        whatsappNo: json["whatsapp_no"],
        role: json["role"],
        userName: json["user_name"],
        contactPersonName: json["contact_person_name"],
      );

  Map<String, dynamic> toJson() => {
        "vendor_type": vendorType,
        "company_name": companyName,
        "contact_no1": contactNo1,
        "email_id": emailId,
        "whatsapp_no": whatsappNo,
        "role": role,
        "user_name": userName,
        "contact_person_name": contactPersonName,
      };
}
