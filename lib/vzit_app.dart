import 'package:flutter/material.dart';
import 'package:vzit_app/models/location.dart';
import 'package:vzit_app/widgets/visited.dart';
import 'package:vzit_app/widgets/wish.dart';

class VzitApp extends StatefulWidget {
  const VzitApp({super.key});
  @override
  State<VzitApp> createState() {
    return _VzitAppState();
  }
}

class _VzitAppState extends State<VzitApp> {
  final List<Location> sampleLocations = [
    Location(
      name: "Cape Town",
      dateToVisit: DateTime(2025, 6, 15),
      continent: Continent.africa,
    ),
    Location(
      name: "Tokyo",
      dateToVisit: DateTime(2025, 9, 10),
      continent: Continent.asia,
    ),
    Location(
      name: "Antarctic Peninsula",
      dateToVisit: DateTime(2026, 1, 20),
      continent: Continent.antarctica,
    ),
    Location(
      name: "Sydney",
      dateToVisit: DateTime(2025, 12, 5),
      continent: Continent.australia,
    ),
    Location(
      name: "Paris",
      dateToVisit: DateTime(2025, 7, 22),
      continent: Continent.europe,
    ),
    Location(
      name: "Vancouver",
      dateToVisit: DateTime(2025, 8, 14),
      continent: Continent.northAmerica,
    ),
    Location(
      name: "Rio de Janeiro",
      dateToVisit: DateTime(2025, 11, 3),
      continent: Continent.southAmerica,
    ),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vzit App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wish(locations: sampleLocations),
              const SizedBox(height: 40),
              Visited(locations: sampleLocations),
            ],
          ),
        ),
      ),
    );
  }
}
