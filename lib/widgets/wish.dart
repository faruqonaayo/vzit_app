import 'package:flutter/material.dart';
import 'package:vzit_app/models/location.dart';
import 'package:vzit_app/widgets/location_card.dart';

class Wish extends StatelessWidget {
  const Wish({
    super.key,
    required this.locations,
    required this.onVisited,
    required this.onDeleteLocation,
  });

  final void Function(Location location) onVisited;
  final void Function(Location location) onDeleteLocation;

  final List<Location> locations;
  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wish",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (ctx, index) {
              final currentLocation = locations[index];
              return Dismissible(
                key: ValueKey(currentLocation),
                onDismissed: (direction) {
                  onDeleteLocation(currentLocation);
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 247, 170, 165),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 237, 39, 24),
                      ),
                    ],
                  ),
                ),
                child: LocationCard(
                  onDelete: onDeleteLocation,
                  location: currentLocation,
                  onToggleVisited: onVisited,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
