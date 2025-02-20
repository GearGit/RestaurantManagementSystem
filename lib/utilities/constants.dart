import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Color(0xFF6CA8F1),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final String databasePurchaseItem = "PurchaseItem";
final String databasePurchaseList = "PurchaseList";
