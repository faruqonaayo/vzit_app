import 'package:flutter/material.dart';
import 'package:vzit_app/models/location.dart';
import 'package:vzit_app/widgets/location_card.dart';

class Wish extends StatelessWidget {
  const Wish({super.key, required this.locations});

  final List<Location> locations;
  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Wish Locations",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (ctx, index) {
                final currentLocation = locations[index];
                return LocationCard(location: currentLocation);
              },
            ),
          ),
        ],
      ),
    );
  }
}
