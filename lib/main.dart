import 'package:flutter/material.dart';

import 'model.dart';

void main() {
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MyData> arrayText = [];
  @override
  void initState() {
    arrayText.add(MyData("Jhon Doe", "jhon@jhon.com", "+8801977543627"));
    arrayText.add(MyData("Jane Smith", "jhan@smith.com", "+880179087641357"));
    arrayText.add(MyData("Alice Johnson", "alice@gmail.com", "+880197907645"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: ListView.builder(
        itemCount: arrayText.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Name : ${arrayText[index].name}"),
                          Text("Email : ${arrayText[index].email}"),
                          Text("Phone : ${arrayText[index].phone}"),
                        ],
                      ),
                    );
                  },
                );
              },
              child: ListTile(title: Text(arrayText[index].name)));
        },
      ),
    );
  }
}
