import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Vehicle {
  final String carName;
  final String lastTravelled;
  final IconData icon;
  final num completedJourney;
  final num distanceCovered;

  Vehicle({
    this.carName = 'Car',
    this.lastTravelled = 'Never',
    this.icon = FontAwesomeIcons.car,
    this.completedJourney = 0,
    this.distanceCovered = 0,
  });

  Vehicle.fromJson(Map json)
      : icon = FontAwesomeIcons.car,
        carName = json['carName'],
        lastTravelled = json['lastTravelled'],
        completedJourney = json['completedJourney'],
        distanceCovered = json["distanceCovered"];

  Map toJson() {
    return {
      'carName': carName,
      'lastTravelled': lastTravelled,
      'completedJourney': completedJourney,
      'distanceCovered': distanceCovered
    };
  }

  Widget getVehicleAsListItem(
      {bool selectedVehicle = false, bool expandedVehicleDetails = false}) {
    return VehicleListItem(
      backgroundColor: selectedVehicle ? Color(0xff369df7) : Colors.white,
      titleColor: selectedVehicle ? Colors.white : Colors.black,
      icon: icon,
      title: carName,
      elevation: selectedVehicle ? 5.0 : 0.0,
      subtext1: 'Last Travelled - $lastTravelled',
      subtextColor: selectedVehicle ? Colors.white : Colors.grey.shade600,
      bottomWidget: selectedVehicle && expandedVehicleDetails
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Journey\'s Completed - $completedJourney',
                      style: TextStyle(
                          fontSize: 20.0, color: Colors.lightGreen.shade100),
                    ),
                    Text(
                      'Distance Covered - $distanceCovered Km',
                      style: TextStyle(
                          fontSize: 20.0, color: Colors.lightGreen.shade100),
                    ),
                    Text(
                      'Fuel Saved - 10L',
                      style: TextStyle(
                          fontSize: 20.0, color: Colors.lightGreen.shade100),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}

class VehicleListItem extends StatelessWidget {
  final Color backgroundColor;
  final Color titleColor;
  final double elevation;
  final IconData icon;
  final String title;
  final String subtext1;
  final Color subtextColor;
  final Widget bottomWidget;

  VehicleListItem({
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.elevation = 0.0,
    @required this.icon,
    @required this.title,
    this.subtext1,
    this.subtextColor,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.lightGreen.shade400,
                    size: 40.0,
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 32.0, color: titleColor),
                  ),
                  Text(
                    subtext1,
                    style: TextStyle(fontSize: 18.0, color: subtextColor),
                  ),
                ],
              ),
            ],
          ),
          Container(child: bottomWidget)
        ],
      ),
    );
  }
}
