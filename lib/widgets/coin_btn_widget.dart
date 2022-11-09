import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';

class CoinBtnWidget extends StatelessWidget {
  String textBtn;
  CoinBtnWidget({Key? key, required this.textBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: 81,
      decoration: BoxDecoration(
        color: kColorsRed,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          textBtn, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsWhite),
        ),
      ),
    );
  }
}