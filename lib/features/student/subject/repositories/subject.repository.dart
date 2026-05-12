import '../models/subject.model.dart';

class SubjectRepository {

  final List<Subject> _subjects = [

    Subject(
      id: 1,
      code: "MAT101",
      name: "Matemática Básica",
      credits: 5,
      hours: 120,
      knowledgeArea: "Ciencias Exactas",
      career: "Software",
      level: "Primer Nivel",
    ),

    Subject(
      id: 2,
      code: "PRO201",
      name: "Programación",
      credits: 6,
      hours: 140,
      knowledgeArea: "Tecnología",
      career: "Software",
      level: "Segundo Nivel",
    ),

    Subject(
      id: 3,
      code: "BD301",
      name: "Base de Datos",
      credits: 4,
      hours: 100,
      knowledgeArea: "Informática",
      career: "TI",
      level: "Tercer Nivel",
    ),
  ];

  /// GET ALL
  List<Subject> getAll() {
    return _subjects;
  }

  /// GET BY ID
  Subject? getById(int id) {
    return _subjects.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception("Subject not found"),
    );
  }

  /// INSERT
  void add(Subject subject) {
    _subjects.add(subject);
  }

  /// UPDATE
  void update(Subject subject) {
    final index =
        _subjects.indexWhere((s) => s.id == subject.id);

    if (index != -1) {
      _subjects[index] = subject;
    }
  }

  /// DELETE
  void delete(int id) {
    _subjects.removeWhere((s) => s.id == id);
  }
}