import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lists/screens/home_page.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final now = DateTime.now();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 135, top: 37),
                child: Text(
                  'New task',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 320, top: 30),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'What are you planning ',
              ),
            ),
          ),
          Row(
            children: [
              Icon(Icons.notifications),
              Text(
                intl.DateFormat.MMMd().add_Hm().format(
                      DateTime.now(),
                    ),
              ),
            ],
          ),
          Icon(Icons.note),
          Icon(Icons.category)
        ],
      ),
    );
  }
}
