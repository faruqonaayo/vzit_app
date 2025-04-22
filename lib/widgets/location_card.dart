import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vzit_app/models/location.dart';

final DateFormat formatter = DateFormat.yMd();

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.location,
    required this.onToggleVisited,
    required this.onDelete,
  });

  final Location location;

  final void Function(Location location) onToggleVisited;
  final void Function(Location location) onDelete;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Image.asset(location.continentImageUrl, width: 80, height: 75),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  location.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  formatter.format(location.dateToVisit),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color.fromRGBO(148, 151, 152, 1),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                location.visited == false
                    ? IconButton(
                      color: Color.fromRGBO(13, 83, 99, 1),
                      style: IconButton.styleFrom(
                        backgroundColor: Color.fromRGBO(157, 237, 255, 1),
                      ),
                      constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                      iconSize: 20,
                      onPressed: () {
                        onToggleVisited(location);
                      },
                      icon: Icon(Icons.check),
                    )
                    : IconButton(
                      color: Color.fromRGBO(99, 53, 13, 1),
                      style: IconButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 224, 157, 1),
                      ),
                      constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                      iconSize: 20,
                      onPressed: () {
                        onToggleVisited(location);
                      },
                      icon: Icon(Icons.close),
                    ),
                IconButton(
                  color: Color.fromRGBO(241, 46, 46, 1),
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 165, 157, 1),
                  ),
                  constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                  iconSize: 20,
                  onPressed: () {
                    onDelete(location);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
