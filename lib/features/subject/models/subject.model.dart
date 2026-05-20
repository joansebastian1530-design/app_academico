import 'dart:convert';

SubjectResponse subjectFromJson(String str) =>
    SubjectResponse.fromJson(json.decode(str));

String subjectToJson(SubjectResponse data) =>
    json.encode(data.toJson());

class SubjectResponse {
  List<Subject> subjects;

  SubjectResponse({
    required this.subjects,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      SubjectResponse(
        subjects: List<Subject>.from(
          json["subjects"].map((x) => Subject.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "subjects":
            List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}

class Subject {
  int id;
  String code;
  String name;
  int credits;
  int hours;
  String knowledgeArea;
  String career;
  String level;

  Subject({
    required this.id,
    required this.code,
    required this.name,
    required this.credits,
    required this.hours,
    required this.knowledgeArea,
    required this.career,
    required this.level,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        credits: json["credits"],
        hours: json["hours"],
        knowledgeArea: json["knowledgeArea"],
        career: json["career"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "credits": credits,
        "hours": hours,
        "knowledgeArea": knowledgeArea,
        "career": career,
        "level": level,
      };
}