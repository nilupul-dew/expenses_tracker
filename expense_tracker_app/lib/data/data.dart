import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon':const FaIcon(FontAwesomeIcons.burger,  color: Colors.white),
    'color': Colors.yellow,
    'name': 'Food',
    'totalAmount': '-Rs.2000',
    'date': 'Today'
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.bagShopping,  color: Colors.white),
    'color': Colors.purple,
    'name': 'Shopping',
    'totalAmount': '-Rs.5000',
    'date': 'Today'
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.ticket,  color: Colors.white),
    'color': Colors.red,
    'name': 'Entertainment',
    'totalAmount': '-Rs.2000',
    'date': 'Yessterday'
  },
  {
    'icon':const FaIcon(FontAwesomeIcons.plane,  color: Colors.white),
    'color': Colors.green,
    'name': 'Travel',
    'totalAmount': '-Rs.3000',
    'date': 'Today'
  }
];
