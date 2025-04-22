import 'package:flutter/material.dart';
import 'package:vzit_app/models/location.dart';
import 'package:vzit_app/widgets/location_card.dart';

class NewLocation extends StatefulWidget {
  const NewLocation({super.key, required this.onAddNewLocation});

  final void Function(Location location) onAddNewLocation;
  @override
  State<NewLocation> createState() {
    return _NewLocationState();
  }
}

class _NewLocationState extends State<NewLocation> {
  final TextEditingController _locationNameController = TextEditingController();
  Continent _selectedContinent = Continent.africa;
  DateTime? _selectedDate;

  void _handleDatePick() async {
    DateTime today = DateTime.now();

    var dateResponse = await showDatePicker(
      context: context,
      firstDate: today,
      lastDate: DateTime(2100),
    );

    setState(() {
      _selectedDate = dateResponse!;
    });
  }

  void submitForm() {
    final locationName = _locationNameController.text.trim();

    if (locationName.isEmpty || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text("Please provide a location name and select a date."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
      return;
    }

    final newLocation = Location(
      name: locationName,
      continent: _selectedContinent,
      dateToVisit: _selectedDate!,
    );

    widget.onAddNewLocation(newLocation);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _locationNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _locationNameController,
            decoration: InputDecoration(label: Text("Location")),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedContinent,
                items:
                    Continent.values
                        .map(
                          (continent) => DropdownMenuItem(
                            value: continent,
                            child: Text(continent.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedContinent = value!;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? "Select a date"
                        : formatter.format(_selectedDate!),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _handleDatePick,
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(onPressed: submitForm, child: Text("Add")),
            ],
          ),
        ],
      ),
    );
  }
}
