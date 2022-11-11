import 'package:cnc_shop/model/product_model.dart';
import 'package:cnc_shop/service/database_service.dart';
import 'package:cnc_shop/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final databaseService =
        Provider.of<DatabaseService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorsWhite,
        title: Text(
          'CNC Shop',
          style: Theme.of(context).textTheme.headline2,
        ),
        // สร้างเส้นคั่นระหว่าง appbar กับ body
        shape: Border(bottom: BorderSide(color: kColorsCream, width: 1.5)),

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
              onPressed: () {
                Navigator.pushNamed(context, '/add-product');
              },
              // icon: Icon(Icons.add, color: Colors.black,),
              icon: SvgPicture.asset('assets/icons/add.svg')),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset('assets/icons/msg.svg')),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: SvgPicture.asset('assets/icons/me.svg')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: StreamBuilder<List<Product>>(
          stream: databaseService.getStreamListProduct(),
          builder: (context, snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.75),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/product-info');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(color: kColorsRed),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Product name',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '\$price',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: kColorsPurple),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
