import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorsWhite,
        title: Text('CNC Shop', style: Theme.of(context).textTheme.headline2,),
        // สร้างเส้นคั่นระหว่าง appbar กับ body
        shape: Border(
          bottom: BorderSide(color: kColorsCream, width: 1.5)
        ),

        // ระดับของเงา
        elevation: 0,

        // ความสูงของ appbar ด้านบน
        toolbarHeight: 60,
        
        // สร้าง appbar ด้านล่าง
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60), 
          child: Container(
            height: 60,
          ),
        ),
        // สร้างปุ่มด้านขวา
        actions: [
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/add.svg')
          ),
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/msg.svg')
          ),
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/me.svg')
          ),
        ],
      ),
    );
  }
}