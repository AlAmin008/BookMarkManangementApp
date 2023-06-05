import 'package:bookmarkapp/widgets/ShowBoorkMarkdetail.dart';
import 'package:flutter/material.dart';
import '../modals/data.dart';
import '../screens/homepage.dart';

class ShowBookMarkList extends StatelessWidget {
  // List<BookMarkData> dataA;
  List<List<dynamic>> data;
  final Function show;
  ShowBookMarkList({required this.data, required this.show});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        width: (MediaQuery.of(context).size.width / 2) - 20,
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[index][0].toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            show(data[index], true);
                          },
                          child: Text('Details'))
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
