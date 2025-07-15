import 'package:flutter/material.dart';
import 'package:flutter_train_reservation_app/home/widget/select_station_box.dart';
import 'package:flutter_train_reservation_app/seat/seat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ), //AppBar 타이틀
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SelectStationBox("출발역"),
                    Container(width: 2, height: 50, color: Colors.grey[400]),
                    SelectStationBox("도착역"),
                  ],
                ),
              ),
            ), //역 선택 박스
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeatPage()),
                  );
                },
                child: Text(
                  "좌석 선택",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), //좌석 선택 버튼
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
