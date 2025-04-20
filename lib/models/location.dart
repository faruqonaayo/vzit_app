import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

class Location {
  Location({required this.name, required this.dateToVisit});

  final String id = uuid.v4();
  final String name;
  final DateTime dateToVisit;
  bool visited = false;

  void toggleVisited() {
    visited = !visited;
  }
}
