import 'package:flutter/material.dart';
import 'package:vzit_app/widgets/location_card.dart';

class Wish extends StatelessWidget {
  const Wish({super.key});
  @override
  Widget build(context) {
    return Column(
      children: [
        Text("Wish Locations"),
        // ListView.builder(
        //   itemBuilder: (ctx, index) {
        //     return LocationCard();
        //   },
        // ),
        LocationCard(),
      ],
    );
  }
}
