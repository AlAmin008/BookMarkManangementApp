import 'package:flutter/material.dart';
import '../modals/data.dart';

class ShowBookMarkDetail extends StatefulWidget {
  BookMarkData dataA;
  bool showdetails;

  ShowBookMarkDetail({required this.dataA, required this.showdetails});

  @override
  State<ShowBookMarkDetail> createState() => _ShowBookMarkDetailState();
}

class _ShowBookMarkDetailState extends State<ShowBookMarkDetail> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showdetails,
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(20),
          height: 100,
          width: (MediaQuery.of(context).size.width / 2) - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title : ${widget.dataA.title}'),
              SizedBox(
                height: 5,
              ),
              FittedBox(child: Text('URL :  : ${widget.dataA.url}')),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.dataA.categoryType.name,
              )
            ],
          ),
        ),
      ),
    );
  }
}
