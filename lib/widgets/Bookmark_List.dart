import 'package:bookmarkapp/widgets/ShowBoorkMarkdetail.dart';
import 'package:flutter/material.dart';
import '../modals/data.dart';
import '../screens/homepage.dart';

class ShowBookMarkList extends StatelessWidget {
  List<BookMarkData> dataA;
  final Function show;
  ShowBookMarkList({required this.dataA, required this.show});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        width: (MediaQuery.of(context).size.width / 2) - 20,
        child: ListView.builder(
            itemCount: dataA.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dataA[index].title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            show(dataA[index], true);
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
