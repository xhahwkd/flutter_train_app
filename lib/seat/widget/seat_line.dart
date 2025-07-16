import 'package:flutter/material.dart';
import 'package:flutter_train_reservation_app/seat/widget/seat_box.dart';

class SeatLine extends StatelessWidget {
  final int index;
  final String? selectedSeat;
  final ValueChanged<String> onSelected;

  const SeatLine({
    Key? key,
    required this.index,
    required this.selectedSeat,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seatNames = ['A-$index', 'B-$index', 'C-$index', 'D-$index'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SeatBox(
            seatName: seatNames[0],
            isSelected: selectedSeat == seatNames[0],
            onSelected: onSelected,
          ),
          SizedBox(width: 4),
          SeatBox(
            seatName: seatNames[1],
            isSelected: selectedSeat == seatNames[1],
            onSelected: onSelected,
          ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: Text('$index'),
          ),
          SeatBox(
            seatName: seatNames[2],
            isSelected: selectedSeat == seatNames[2],
            onSelected: onSelected,
          ),
          SizedBox(width: 4),
          SeatBox(
            seatName: seatNames[3],
            isSelected: selectedSeat == seatNames[3],
            onSelected: onSelected,
          ),
        ],
      ),
    );
  }
}
