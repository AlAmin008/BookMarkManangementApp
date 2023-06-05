import 'package:bookmarkapp/modals/categoryType.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

import '../modals/data.dart';
import '../widgets/Bookmark_List.dart';
import '../widgets/ShowBoorkMarkdetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usertitle = TextEditingController();
  final userUrl = TextEditingController();
  final userCategory = TextEditingController();
  final userdefineCategory = TextEditingController();
  String dropdownValue = 'category';
  bool newCategoryFieldVisibility = false;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<List<dynamic>> rows = [];

  void visibility() {
    setState(() {
      newCategoryFieldVisibility = true;
    });
  }

  void addCategory(String title, String url, categoryTypes categorytypes) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadCSV();
    _loadCSV2();
  }

  List<List<dynamic>> _data = [];
  void _loadCSV() async {
    final rawData = await rootBundle.loadString("userData.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _data = listData;
    });
  }

  List<List<dynamic>> _data2 = [];
  void _loadCSV2() async {
    final rawData = await rootBundle.loadString("userdataB.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    // print(listData[0]);
    setState(() {
      _data2 = listData;
    });
  }

  void showForm() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                scrollable: true,
                title: Text(
                  'Add Bookmark',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          maxLength: 30,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                          controller: usertitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Url',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                          controller: userUrl,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            DropdownButton<String>(
                              hint: const Text('Category'),
                              items: <String>['Category-A', 'Category-B']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: ((value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              }),
                            ),
                            IconButton(
                              onPressed: () {
                                visibility();
                              },
                              icon: const Icon(Icons.add_box_rounded),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: newCategoryFieldVisibility,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'New category',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                              ),
                            ),
                            controller: userdefineCategory,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              usertitle.clear();
                              userUrl.clear();
                              userCategory.clear();
                              Navigator.of(context).pop();
                            }),
                        ElevatedButton(
                            child: const Text("Save"),
                            onPressed: () async {
                              List<dynamic> dataRow = [];
                              dataRow.add(usertitle.text);
                              dataRow.add(userUrl.text);
                              dataRow.add(dropdownValue);

                              rows.add(dataRow);

                              String csv =
                                  const ListToCsvConverter().convert(rows);

                              print(csv.toString());
                            }),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        });
  }

  void showDetail(BookMarkData dataA, bool showdetails) {
    // setState(() {
    //   ShowBookMarkDetail(dataA: dataA, showdetails: showdetails);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Bookmark Manager',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, padding: EdgeInsets.all(10)),
              onPressed: () {
                showForm();
              },
              child: const Text(
                'Add Bookmark',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Category A',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                ShowBookMarkList(data: _data, show: showDetail),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Text('Category B',
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                ShowBookMarkList(data: _data2, show: showDetail),
              ],
            ),
            ShowBookMarkDetail(dataA: _data[0], showdetails: true),
          ],
        ),
      ),
    );
  }
}
