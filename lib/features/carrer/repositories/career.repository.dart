import '../models/career.model.dart';

class CareerRepository {
  final List<Career> _careers = [
    Career(id: 1, name: "Software"),
    Career(id: 2, name: "Electrónica"),
    Career(id: 3, name: "Administración"),
  ];

  List<Career> getAll() => _careers;
}