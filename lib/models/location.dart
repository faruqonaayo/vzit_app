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
  Continent.africa: "asset/images/afr.jpg",
  Continent.asia: "asset/images/asia.jpg",
  Continent.antarctica: "asset/images/ant.jpg",
  Continent.australia: "asset/images/aus.jpg",
  Continent.europe: "asset/images/eur.jpg",
  Continent.northAmerica: "asset/images/namr.jpg",
  Continent.southAmerica: "asset/images/samr.jpg",
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
