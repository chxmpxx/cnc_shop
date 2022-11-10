import 'package:cnc_shop/model/user_model.dart';
import 'package:cnc_shop/service/auth_service.dart';
import 'package:cnc_shop/service/database_service.dart';
import 'package:cnc_shop/themes/color.dart';
import 'package:cnc_shop/utils/showSnackBar.dart';
import 'package:cnc_shop/widgets/coin_btn_widget.dart';
import 'package:cnc_shop/widgets/main_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TopUpScreen extends StatefulWidget {
  TopUpScreen({Key? key}) : super(key: key);

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  int topup = 0;
  List<int> amountList = [100, 300, 500, 700, 1000, 2000];
  User? user;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.currentUser().then((currentUser) {
      if (!mounted) return;
      setState(() {
        user = currentUser;
      });
    });
    return Scaffold(
      backgroundColor: kColorsCream,
      appBar: AppBar(
        title: Text('Top Up', style: Theme.of(context).textTheme.headline3),
        backgroundColor: kColorsPurple,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg', color: kColorsWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/msg.svg',
                  color: kColorsWhite)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon:
                  SvgPicture.asset('assets/icons/me.svg', color: kColorsWhite))
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          topUp(),
          Positioned(top: 325, child: inputAmount()),
          Positioned(
              bottom: 20,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Top up'),
                      content: Text('Top up ${topup} coin.'),
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              user!.coin = user!.coin! + topup;

                              final databaseService =
                                  Provider.of<DatabaseService>(context,
                                      listen: false);

                              databaseService
                                  .updateUserFromUid(
                                      uid: user!.uid, user: user!)
                                  .then((value) {
                                // success state
                                showSnackBar('success',
                                    backgroundColor: Colors.green);
                              }).catchError((e) {
                                //handle error
                                showSnackBar(e, backgroundColor: Colors.red);
                              });
                              Navigator.pop(context, 'Ok');
                            },
                            child: Text('Ok')),
                      ],
                    ),
                  );
                },
                child: MainBtnWidget(
                    colorBtn: kColorsPurple,
                    textBtn: 'Top Up',
                    isTransparent: true,
                    haveIcon: false),
              ))
        ],
      ),
    );
  }

  // Create Top Up Menu
  Widget topUp() {
    return Stack(
      children: [
        Container(
          height: 325,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
              color: kColorsPurple),
        ),
        Positioned(
          top: 50,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: kColorsWhite,
                      boxShadow: [
                        BoxShadow(
                          color: kColorsBlack.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Top Up value',
                        style: Theme.of(context).textTheme.headline4),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: kColorsCream),
                      ),
                    ),
                    Container(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            runSpacing: 10.0,
                            spacing: 30.0,
                            children: [
                              ...List.generate(
                                amountList.length,
                                (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        topup = amountList[index];
                                      });
                                    },
                                    child: CoinBtnWidget(
                                        textBtn: '${amountList[index]}')),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // Create input Amount Tab
  Widget inputAmount() {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: kColorsWhite,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Input Amount',
                  style: Theme.of(context).textTheme.headline4),
              Text(
                '\$ $topup',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: kColorsRed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
