import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih2020/components/vehicle.dart';

const double maxKilometersDriven = 1000.0;
const double minKilometersDriven = 0.0;
const FuelTypes initialFuelType = FuelTypes.Petrol;

enum FuelTypes {
  Petrol,
  Diesel,
  CNG,
  LPG,
  Electric
}

class NewVehicleScreen extends StatefulWidget {
  @override
  _NewVehicleScreenState createState() => _NewVehicleScreenState();
}

class _NewVehicleScreenState extends State<NewVehicleScreen> {
  String carName;
  FuelTypes fuelType = initialFuelType;
  double mileage;
  RangeValues kilometersDriven = RangeValues(minKilometersDriven,maxKilometersDriven);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
            'Add new vehicle'
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              if (carName == null) {
                print('Please type a car name. ');
              }
              else{
                Navigator.pop(
                    context,
                    Vehicle(
                      carName: carName,
                    )
                );
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                  FontAwesomeIcons.carAlt
              ),
              title: TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    hintText: "Vehicle name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 19,
                    )
                ),
                style: TextStyle(

                ),
                textAlign: TextAlign.start,
                onChanged: (String value) {
                  carName = value;
                },
              ),
            ),
            ListTile(
              leading: Icon(
                  FontAwesomeIcons.gasPump
              ),
              title: DropdownButton<FuelTypes>(
                onChanged: (FuelTypes fuel) {
                  setState(() {
                    fuelType=fuel;
                  });
                },
                value: fuelType,
                items: FuelTypes.values.map<DropdownMenuItem<FuelTypes>>((FuelTypes fuel) {
                  return DropdownMenuItem<FuelTypes>(
                    value: fuel,
                    child: Text(
                      fuel.toString().split('.')[1],
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                  );
                }).toList()
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Kilometers Driven',
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  RangeSlider(
                    onChanged: (RangeValues values) {
                      setState(() {
                        kilometersDriven = values;
                      });
                    },
                    min: minKilometersDriven,
                    max: maxKilometersDriven,
                    divisions: 13,
                    values: kilometersDriven,
                    labels: RangeLabels('${kilometersDriven.start.floor()}','${kilometersDriven.end.floor()}'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

