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

  void handleVisited(Location location) {
    setState(() {
      final locationIndex = sampleLocations.indexOf(location);
      sampleLocations[locationIndex].visited = true;
    });
  }

  void handleNotVisited(Location location) {
    setState(() {
      final locationIndex = sampleLocations.indexOf(location);
      sampleLocations[locationIndex].visited = false;
    });
  }

  void handleDeleteLocation(Location location) {
    final locationIndex = sampleLocations.indexOf(location);
    setState(() {
      sampleLocations.remove(location);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Deleted ${location.name}"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              sampleLocations.insert(locationIndex, location);
            });
          },
        ),
      ),
    );
  }

  void _handleShowModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Text("Hello");
      },
    );
  }

  @override
  Widget build(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: Text("Vzit App")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child:
            isLargeScreen
                ? Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Wish(
                              onVisited: handleVisited,
                              onDeleteLocation: handleDeleteLocation,
                              locations:
                                  sampleLocations
                                      .where(
                                        (Location location) =>
                                            location.visited == false,
                                      )
                                      .toList(),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Expanded(
                            child: Visited(
                              onNotVisited: handleNotVisited,
                              onDeleteLocation: handleDeleteLocation,
                              locations:
                                  sampleLocations
                                      .where(
                                        (Location location) =>
                                            location.visited == true,
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _handleShowModalBottomSheet,
                      icon: Icon(Icons.add),
                      label: Text("Add Location"),
                    ),
                  ],
                )
                : Column(
                  children: [
                    Expanded(
                      child: Wish(
                        onVisited: handleVisited,
                        onDeleteLocation: handleDeleteLocation,
                        locations:
                            sampleLocations
                                .where(
                                  (Location location) =>
                                      location.visited == false,
                                )
                                .toList(),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: Visited(
                        onNotVisited: handleNotVisited,
                        onDeleteLocation: handleDeleteLocation,
                        locations:
                            sampleLocations
                                .where(
                                  (Location location) =>
                                      location.visited == true,
                                )
                                .toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _handleShowModalBottomSheet,
                      icon: Icon(Icons.add),
                      label: Text("Add Location"),
                    ),
                  ],
                ),
      ),
    );
  }
}
