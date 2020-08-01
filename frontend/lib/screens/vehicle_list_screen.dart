import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih2020/components/vehicle.dart';
import 'package:sih2020/components/side_menu_drawer.dart';
import 'package:sih2020/screens/add_new_vehicle_screen.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static Future fetchDetails() {
    print("dcdcfdvfvfv");
    return http.get('http://localhost:4000/carList');
    // if (response.statusCode == 200) {
    //   return response;
    // } else {
    //   throw Exception('Failed to load album');
    // }
  }
}

class Cars {
  final String carName;
  final String lastTravelled;
  final IconData icon;
  final num completedJourney;
  final num distanceCovered;

  Cars({
    this.carName = 'Car',
    this.lastTravelled = 'Never',
    this.icon = FontAwesomeIcons.car,
    this.completedJourney = 0,
    this.distanceCovered = 0,
  });

  Cars.fromJson(Map json)
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
}

class VehicleListScreen extends StatefulWidget {
  static String screenID = 'vehicle_list_screen';
  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  // List<Vehicle> vehicleList = <Vehicle>[
  //   Vehicle(carName: 'MG Hector', lastTravelled: '16 hours ago'),
  //   Vehicle(carName: 'Swift', lastTravelled: 'Yesterday'),
  //   Vehicle(carName: 'Nixon', lastTravelled: '10 days ago'),
  // ];

  int selectedVehicle = 0;
  bool moreVehicleDetails = true;
  var listofcars = List<Cars>();
  var listofvehicles = List<Vehicle>();

  fetchCarDetails() {
    API.fetchDetails().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        listofcars = list.map((model) => Cars.fromJson(model)).toList();
        for (var car in listofcars) {
          listofvehicles.add(Vehicle(
              carName: car.carName,
              lastTravelled: car.lastTravelled,
              distanceCovered: car.distanceCovered,
              completedJourney: car.completedJourney,
              icon: car.icon));
        }
        print(listofcars);
        print(listofvehicles);
      });
    });
  }

  void initstate() {
    super.initState();
    fetchCarDetails();
  }

  // upto here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black45),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        elevation: 5.0,
        centerTitle: true,
        title: Text(
          'Vehicles',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            child: OutlineButton(
              onPressed: () {},
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                'Start a Journey',
                style: TextStyle(fontSize: 18.0, color: Colors.green),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Vehicle newCar = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewVehicleScreen()));
          if (newCar != null) {
            setState(() {
              listofvehicles.add(newCar);
            });
          }
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10.0),
        itemCount: listofcars.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
              onTap: () {
                if (selectedVehicle == index && moreVehicleDetails == false) {
                  moreVehicleDetails = true;
                } else if (selectedVehicle == index &&
                    moreVehicleDetails == true) {
                  moreVehicleDetails = false;
                }
                setState(() {
                  selectedVehicle = index;
                });
              },
              child: listofvehicles[index].getVehicleAsListItem(
                selectedVehicle: index == selectedVehicle,
                expandedVehicleDetails: moreVehicleDetails,
              ));
        },
        separatorBuilder: (context, int index) {
          return Divider();
        },
      ),
    );
  }
}
