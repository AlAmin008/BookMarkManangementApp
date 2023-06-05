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
          padding: const EdgeInsets.all(20),
          height: 150,
          width: (MediaQuery.of(context).size.width / 2) - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title : ${widget.dataA.title}'),
              const SizedBox(
                height: 5,
              ),
              FittedBox(
                  child: Text(
                'URL :  ${widget.dataA.url}',
                style: Theme.of(context).textTheme.bodyMedium,
              )),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Category :  ${widget.dataA.categoryType.name}',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
