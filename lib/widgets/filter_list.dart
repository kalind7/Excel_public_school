import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project_work/controller/select_list_controller.dart';


class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  var controller = Get.put(SelectedListController());

  // void openFilterDialog() async {
  //   await FilterListDialog.display<String>(
  //     context,
  //     listData: defaultList,
  //     selectedListData: controller.getSelectedList(),
  //     headlineText: "your skills",
  //     choiceChipLabel: (item) => item,
  //     validateSelectedItem: (list, val) => list!.contains(val),
  //     onItemSearch: (item, text) {
  //       return item.toLowerCase().contains(text.toLowerCase());
  //     },
  //     onApplyButtonClick: (list) {
  //       controller.setSelectedList(List<String>.from(list!));
  //       Navigator.of(context).pop();
  //     },
  //   );
  // }

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Mr. Ram Prasad Yadav", "email": "ramprasad@gmail.com"},
    {"id": 2, "name": "Mr. Hari Prasad Acharya", "email": "hari22@gmail.com"},
    {"id": 3, "name": "Mrs. Laxmi Bhandari", "email": "iamlaxmi@gmail.com"},
    {"id": 4, "name": "Mr. Kamal Khatri", "email": "kk18@gmail.com"},
    {"id": 5, "name": "Mr. Kalind Koirala", "email": "kk17@gmail.com"},
    {"id": 6, "name": "Mrs. Shanta Banjade", "email": "sb45.com"},
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers.where((user) =>
          user["name"].toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.grey.shade300,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundUsers[index]['name']),
                    subtitle: Text(
                        '${_foundUsers[index]["email"].toString()} '),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

