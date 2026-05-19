import 'package:flutter/material.dart';

import '../../carrer/repositories/career.repository.dart';

import '../models/student.model.dart';
import '../models/student_view.dart';

import '../repositories/student.repository.dart';

class StudentProvider extends ChangeNotifier {

  final StudentRepository _studentRepo =
      StudentRepository();

  final CareerRepository _careerRepo =
      CareerRepository();

  List<StudentView> _students = [];

  List<StudentView> get students => _students;

  /// =========================
  /// LOAD STUDENTS
  /// =========================
  void loadStudents() {

    final students =
        _studentRepo.getAll();

    final careers =
        _careerRepo.getAll();

    _students = students.map((student) {

      final career = careers.firstWhere(
        (c) => c.id == student.careerId,
      );

      return StudentView(
        student: student,
        career: career,
      );

    }).toList();

    notifyListeners();
  }

  /// =========================
  /// INSERT
  /// =========================
  void addStudent(Student student) {

    _studentRepo.add(student);

    loadStudents();
  }

  /// =========================
  /// UPDATE
  /// =========================
  void updateStudent(Student student) {

    _studentRepo.update(student);

    loadStudents();
  }

  /// =========================
  /// DELETE
  /// =========================
  void deleteStudent(int id) {

    _studentRepo.delete(id);

    loadStudents();
  }

  /// =========================
  /// GET ENTITY
  /// =========================
  Student? getById(int id) {

    return _studentRepo.getById(id);
  }

  /// =========================
  /// GET VIEW MODEL
  /// =========================
  StudentView? getViewById(int id) {

    try {

      return _students.firstWhere(
        (s) => s.student.id == id,
      );

    } catch (e) {

      return null;
    }
  }
}