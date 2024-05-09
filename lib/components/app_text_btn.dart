import 'package:flutter/material.dart';
import 'package:pulse_play/theme/theme.dart';

class AppTextBtn extends StatelessWidget {
  const AppTextBtn({Key? key, required this.label, required this.onTap}) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: primaryclr,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: whiteClr, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
