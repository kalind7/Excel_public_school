// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
    EventModel({
        required this.success,
        required this.data,
        this.message,
    });

    bool success;
    List<Datum> data;
    dynamic message;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.eventTitle,
        required this.eventLocation,
        required this.eventDes,
        required this.fromDate,
        required this.toDate,
        required this.upladImageFile,
        required this.activeStatus,
        this.createdAt,
        this.updatedAt,
        required this.createdBy,
        required this.updatedBy,
        required this.schoolId,
    });

    int id;
    String eventTitle;
    String eventLocation;
    String eventDes;
    DateTime fromDate;
    DateTime toDate;
    String upladImageFile;
    int activeStatus;
    dynamic createdAt;
    dynamic updatedAt;
    int createdBy;
    int updatedBy;
    int schoolId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        eventTitle: json["event_title"],
        eventLocation: json["event_location"],
        eventDes: json["event_des"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        upladImageFile: json["uplad_image_file"],
        activeStatus: json["active_status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        schoolId: json["school_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "event_title": eventTitle,
        "event_location": eventLocation,
        "event_des": eventDes,
        "from_date": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        "to_date": "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "uplad_image_file": upladImageFile,
        "active_status": activeStatus,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "school_id": schoolId,
    };
}
