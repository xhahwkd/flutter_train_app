import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_reservation_app/seat/widget/alphabet_box.dart';
import 'package:flutter_train_reservation_app/seat/widget/seat_line.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    required this.departureStation,
    required this.arrivalStation,
    Key? key,
  }) : super(key: key);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedSeat;

  void onSeatSelected(String seat) {
    setState(() {
      selectedSeat = seat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.departureStation,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Icon(Icons.arrow_circle_right_outlined, size: 30),
                  Text(
                    widget.arrivalStation,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("선택됨"),
                  SizedBox(width: 20),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("선택 안 됨"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlphabetBox(alphabet: "A"),
                  SizedBox(width: 4),
                  AlphabetBox(alphabet: "B"),
                  AlphabetBox(alphabet: ""),
                  AlphabetBox(alphabet: "C"),
                  SizedBox(width: 4),
                  AlphabetBox(alphabet: "D"),
                ],
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                    20,
                    (i) => SeatLine(
                      index: i + 1,
                      selectedSeat: selectedSeat,
                      onSelected: (seat) {
                        setState(() {
                          selectedSeat = seat;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "예매하기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (selectedSeat != null)
                        ? () {
                            showCupertinoDialog(
                              context: context,
                              builder: (_) => CupertinoAlertDialog(
                                title: Text("예매 하시겠습니까?"),
                                content: Text("좌석: $selectedSeat"),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text("취소"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("확인"),
                                    onPressed: () {
                                      Navigator.pop(context); // 다이얼로그 닫기
                                      Navigator.pop(context); // SeatPage 닫기
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
