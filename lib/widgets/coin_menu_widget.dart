import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinMenuWidget extends StatelessWidget {
  String iconBtn;
  String textBtn;
  CoinMenuWidget({Key? key, required this.iconBtn, required this.textBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(iconBtn, color: kColorsPurple),
        SizedBox(height: 7),
        Text(textBtn, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: kColorsPurple))
      ],
    );
  }
}