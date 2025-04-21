import 'package:flutter/material.dart';
import 'package:vzit_app/models/location.dart';
import 'package:vzit_app/widgets/location_card.dart';

class Visited extends StatelessWidget {
  const Visited({
    super.key,
    required this.locations,
    required this.onNotVisited,
    required this.onDeleteLocation,
  });

  final void Function(Location location) onNotVisited;
  final void Function(Location location) onDeleteLocation;

  final List<Location> locations;
  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Visited",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (ctx, index) {
              final currentLocation = locations[index];
              return LocationCard(
                onDelete: onDeleteLocation,
                location: currentLocation,
                onToggleVisited: onNotVisited,
              );
            },
          ),
        ),
      ],
    );
  }
}
