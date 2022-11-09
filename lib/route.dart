import 'package:cnc_shop/screens/add_product_screen.dart';
import 'package:cnc_shop/screens/home_screen.dart';
import 'package:cnc_shop/screens/login_screen.dart';
import 'package:cnc_shop/screens/product_info_screen.dart';
import 'package:cnc_shop/screens/profile_screen.dart';
import 'package:cnc_shop/screens/register_screen.dart';
import 'package:cnc_shop/screens/top_up_screen.dart';
import 'package:cnc_shop/screens/transaction_screen.dart';
import 'package:cnc_shop/screens/withdraw_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  "/home": (BuildContext context) => HomeScreen(),
  "/add-product": (BuildContext context) => AddProductScreen(),
  "/product-info": (BuildContext context) => ProductInfoScreen(),
  "/profile": (BuildContext context) => ProfileScreen(),
  "/top-up": (BuildContext context) => TopUpScreen(),
  "/withdraw": (BuildContext context) => WithdrawScreen(),
  "/transaction": (BuildContext context) => TransactionScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/register": (BuildContext context) => RegisterScreen(),
};