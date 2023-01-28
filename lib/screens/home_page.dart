import 'package:flutter/material.dart';
import 'package:lists/screens/new_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _listitem = [
    //#Icon1
    Container(
      height: 160,
      width: 170,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.document_scanner_rounded,
              size: 40,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: Text(
              "All",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 110),
            child: Text(
              "23 Tasks",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
    //#Icon2
    Container(
      height: 160,
      width: 170,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.work,
              size: 40,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: Text(
              "Work",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 110),
            child: Text(
              "14 Tasks",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
    //#Icon3
    Container(
      height: 160,
      width: 170,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.music_note_sharp,
              size: 40,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: Text(
              "Music",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 110),
            child: Text(
              "6 Tasks",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
    //#Icon4
    Container(
      height: 160,
      width: 170,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.travel_explore,
              size: 40,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: Text(
              "Travel",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 110),
            child: Text(
              "1 Tasks",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
    //#Icon5
    Container(
      height: 160,
      width: 170,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.purple,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: Text(
              "Study",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 110),
            child: Text(
              "2 Tasks",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
    //#Icon6
    Container(
      height: 160,
      width: 170,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.home,
              size: 40,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 80),
            child: Text(
              "Home",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 110),
            child: Text(
              "14 Tasks",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.menu),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Lists',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                children: _listitem.map((item) => widget(item)).toList()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTask(),
            ),
          );
          final prefs = await SharedPreferences.getInstance();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget widget(var item) {
  return TextButton(
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 121, 115, 115),
              blurRadius: 2,
            ),
          ],
        ),
        child: item,
      ),
    ),
  );
}
