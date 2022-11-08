import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg', color: kColorsWhite,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: kColorsPurple,
        title: Text('Add Product', style: Theme.of(context).textTheme.headline3,),
        // สร้างเส้นคั่นระหว่าง appbar กับ body
        shape: Border(
          bottom: BorderSide(color: kColorsCream, width: 1.5)
        ),

        // ระดับของเงา
        elevation: 0,

        // ความสูงของ appbar ด้านบน
        toolbarHeight: 60,
        
        // สร้างปุ่มด้านขวา
        actions: [
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/msg.svg', color: kColorsWhite,)
          ),
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/me.svg', color: kColorsWhite,)
          ),
        ],
      ),
    );
  }
}