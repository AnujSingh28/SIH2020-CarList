//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih2020/components/vehicle.dart';
import 'package:sih2020/components/side_menu_drawer.dart';
import 'package:sih2020/screens/add_new_vehicle_screen.dart';

import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

Future<List<Vehicle>> _getcars() async {
  print("frst step");
  // final url = 'http://localhost:4000/carList';
  // final response = await http
  //     .get(Uri.encodeFull(url), headers: {"accept": 'application/json'});

  // print(response);
  List response = [
    {
      "lastTravelled": "Not Travelled",
      "completedJourney": 0,
      "distanceCovered": 0,
      "_id": "5f1da2833ee1476874461c84",
      "name": "Lamborghini",
      "fuelType": "Petrol",
      "fuelTankSize": "infinite",
      "__v": 0
    },
    {
      "lastTravelled": "Not Travelled",
      "completedJourney": 0,
      "distanceCovered": 0,
      "_id": "5f1da2a93ee1476874461c85",
      "name": "Maserati",
      "fuelType": "Petrol",
      "fuelTankSize": "finite",
      "__v": 0
    },
    {
      "lastTravelled": "Never",
      "completedJourney": 0,
      "distanceCovered": 0,
      "_id": "5f224c7f0dfa254a4c03dd53",
      "name": "jazz",
      "fuelType": "Petrol",
      "fuelTankSize": "100L",
      "__v": 0
    }
  ];
  List<Vehicle> allvehicles = [];

  for (var i in response) {
    Vehicle vehi = Vehicle(
        carName: i['carName'],
        distanceCovered: i['distanceCovered'],
        completedJourney: i['completedJourney'],
        lastTravelled: i['lastTravelled']);

    allvehicles.add(vehi);
  }

  return allvehicles;
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
  var listofvehicles = List<Vehicle>();
  Future<List<Vehicle>> futurecars;

  void initstate() {
    super.initState();
    futurecars = _getcars();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: Container(
        child: FutureBuilder(
          future: _getcars(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              print("vvdd");
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              print("lll");
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].carName),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
