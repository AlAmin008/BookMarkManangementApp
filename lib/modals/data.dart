import 'package:flutter/foundation.dart';

class BookMarkData {
  String title;
  String url;
  Enum categoryType;
  var category = [
    {'Category A': 'Java', 'Category B': 'Burger'}
  ];

  BookMarkData(
      {required this.title, required this.url, required this.categoryType});
}
