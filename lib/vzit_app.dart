import 'package:flutter/material.dart';
import 'package:vzit_app/models/location.dart';
import 'package:vzit_app/widgets/new_location.dart';
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
  final List<Location> sampleLocations = [];

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

  void addNewLocation(Location location) {
    setState(() {
      sampleLocations.add(location);
    });
  }

  void _handleShowModalBottomSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewLocation(onAddNewLocation: addNewLocation);
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
