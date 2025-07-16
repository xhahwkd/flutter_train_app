import 'package:flutter/material.dart';

class SeatBox extends StatefulWidget {
  final String seatName;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const SeatBox({
    Key? key,
    required this.seatName,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<SeatBox> createState() => _SeatBoxState();
}

class _SeatBoxState extends State<SeatBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.seatName);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: widget.isSelected ? Colors.purple : Colors.grey[300],
        ),
      ),
    );
  }
}
