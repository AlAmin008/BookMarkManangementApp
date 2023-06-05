import 'package:bookmarkapp/modals/categoryType.dart';
import 'package:flutter/material.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void visibility() {
    setState(() {
      newCategoryFieldVisibility = true;
    });
  }

  void addCategory(String title, String url, categoryTypes categorytypes) {
    setState(() {
      dataA.add(
          BookMarkData(title: title, url: url, categoryType: categorytypes));
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
                            onPressed: () {
                              print(usertitle.text);
                              print(userUrl.text);
                              print(userCategory.text);
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
    setState(() {
      ShowBookMarkDetail(dataA: dataA, showdetails: showdetails);
    });
  }

  bool showdetails = false;
  List<BookMarkData> dataA = [
    BookMarkData(
        title: 'Java', url: 'www', categoryType: categoryTypes.Category_A),
    BookMarkData(
        title: 'Angular basics',
        url: 'www',
        categoryType: categoryTypes.Category_A),
    BookMarkData(
        title: 'React', url: 'www', categoryType: categoryTypes.Category_A),
  ];

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
                ShowBookMarkList(dataA: dataA, show: showDetail),
                Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 10),
                  child: Text('Category B',
                      style: Theme.of(context).textTheme.displayLarge),
                ),
                ShowBookMarkList(dataA: dataA, show: showDetail),
              ],
            ),
            ShowBookMarkDetail(dataA: dataA[0], showdetails: true),
          ],
        ),
      ),
    );
  }
}
