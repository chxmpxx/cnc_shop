import 'package:cnc_shop/screens/add_product_screen.dart';
import 'package:cnc_shop/screens/home_screen.dart';
import 'package:cnc_shop/screens/product_info_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  "/home": (BuildContext context) => HomeScreen(),
  "/add-product": (BuildContext context) => AddProductScreen(),
  "/product-info": (BuildContext context) => ProductInfoScreen(),
};