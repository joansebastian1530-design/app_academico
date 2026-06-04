import 'dart:convert';

DocumentResponse documentResponseFromJson(String str) =>
    DocumentResponse.fromJson(json.decode(str));

String documentResponseToJson(DocumentResponse data) =>
    json.encode(data.toJson());

class DocumentResponse {
  List<Document> documents;

  DocumentResponse({
    required this.documents,
  });

  factory DocumentResponse.fromJson(Map<String, dynamic> json) =>
      DocumentResponse(
        documents: json["documents"] == null
            ? []
            : List<Document>.from(
                json["documents"].map((x) => Document.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  int id;
  String documentNumber;
  String type;
  String title;
  String description;
  int studentId;
  String sender;
  String receiver;
  String department;
  String status;
  String priority;
  DateTime createdAt;
  DateTime? approvedAt;
  List<String> attachments;
  String verificationCode;

  Document({
    required this.id,
    required this.documentNumber,
    required this.type,
    required this.title,
    required this.description,
    required this.studentId,
    required this.sender,
    required this.receiver,
    required this.department,
    required this.status,
    required this.priority,
    required this.createdAt,
    this.approvedAt,
    required this.attachments,
    required this.verificationCode,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: _toInt(json["id"]),
        documentNumber: json["documentNumber"] ?? '',
        type: json["type"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        studentId: _toInt(json["studentId"]),
        sender: json["sender"] ?? '',
        receiver: json["receiver"] ?? '',
        department: json["department"] ?? '',
        status: json["status"] ?? '',
        priority: json["priority"] ?? '',
        createdAt: DateTime.tryParse(json["createdAt"] ?? '') ?? DateTime.now(),
        approvedAt: json["approvedAt"] != null
            ? DateTime.tryParse(json["approvedAt"])
            : null,
        attachments: json["attachments"] == null
            ? []
            : List<String>.from(json["attachments"].map((x) => x.toString())),
        verificationCode: json["verificationCode"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "documentNumber": documentNumber,
        "type": type,
        "title": title,
        "description": description,
        "studentId": studentId,
        "sender": sender,
        "receiver": receiver,
        "department": department,
        "status": status,
        "priority": priority,
        "createdAt": createdAt.toIso8601String(),
        "approvedAt": approvedAt?.toIso8601String(),
        "attachments": attachments,
        "verificationCode": verificationCode,
      };

  static int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }
}