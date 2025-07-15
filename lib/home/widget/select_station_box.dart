import 'package:flutter/material.dart';
import 'package:flutter_train_reservation_app/station_list/station_list_page.dart';

class SelectStationBox extends StatefulWidget {
  final String stationType;

  const SelectStationBox(this.stationType, {super.key});

  @override
  State<SelectStationBox> createState() => _SelectStationBoxState();
}

class _SelectStationBoxState extends State<SelectStationBox> {
  String? selectedStation;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${widget.stationType}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          child: Text(selectedStation ?? "선택", style: TextStyle(fontSize: 40)),
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StationListPage()),
            );
            if (result != null && result is String) {
              setState(() {
                selectedStation = result;
              });
            }
          },
        ),
      ],
    );
  }
}
