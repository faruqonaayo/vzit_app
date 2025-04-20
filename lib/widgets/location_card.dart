import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vzit_app/models/location.dart';

final DateFormat formatter = DateFormat.yMd();

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.location});

  final Location location;
  @override
  Widget build(context) {
    return Card(
      color: Color.fromRGBO(235, 244, 246, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
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
                IconButton(
                  color: Color.fromRGBO(13, 83, 99, 1),
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromRGBO(157, 237, 255, 1),
                  ),
                  constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                  iconSize: 20,
                  onPressed: () {},
                  icon: Icon(Icons.check),
                ),
                IconButton(
                  color: Color.fromRGBO(241, 46, 46, 1),
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 165, 157, 1),
                  ),
                  constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                  iconSize: 20,
                  onPressed: () {},
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
