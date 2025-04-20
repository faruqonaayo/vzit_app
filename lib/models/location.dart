import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

enum Continent {
  africa,
  antarctica,
  australia,
  asia,
  europe,
  northAmerica,
  southAmerica,
}

final Map<Continent, String> continentUrl = {
  Continent.africa: "assets/images/afr.jpg",
  Continent.asia: "assets/images/asia.jpg",
  Continent.antarctica: "assets/images/ant.jpg",
  Continent.australia: "assets/images/aus.jpg",
  Continent.europe: "assets/images/eur.jpg",
  Continent.northAmerica: "assets/images/namr.jpg",
  Continent.southAmerica: "assets/images/samr.jpg",
};

class Location {
  Location({
    required this.name,
    required this.dateToVisit,
    required this.continent,
  });

  final String id = uuid.v4();
  final String name;
  final DateTime dateToVisit;
  bool visited = false;
  final Continent continent;

  void toggleVisited() {
    visited = !visited;
  }

  String get continentImageUrl {
    return continentUrl[continent]!;
  }
}
