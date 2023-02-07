import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lists/CategoryPages/All.dart';
import 'package:lists/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      String? i = prefs.getString('newtask1');
      Map e = jsonDecode(i!);
      setState(() {
        olingan = e['newtask1.0'];
      });
    });

    super.initState();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
    print('object');
  }

  String dropdownValue = '';
  DateTime? _selectedDate;
  String olingan = '';
  final now = DateTime.now();
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'New task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'what are you planning?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              bottom: 18,
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18),
              maxLines: 6,
              controller: _controller,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.notifications),
              const SizedBox(
                width: 10,
              ),
              Text(
                intl.DateFormat.d().add_MMMM().add_Hm().format(
                      DateTime.now(),
                    ),
              ),
              const Spacer(),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(
                  Icons.edit,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.note),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add note',
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                const Icon(Icons.category),
                const SizedBox(
                  width: 10,
                ),
                const Text('Category'),
                const Spacer(),
                Expanded(
                  child: DropdownButton(
                    value: dropdownValue,
                    isExpanded: true,
                    iconSize: 35,
                    dropdownColor: Colors.white,
                    items: const [],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(8),
            color: const Color(0xff5786FF),
            height: 50,
            width: double.infinity,
            child: TextButton(
              child: Text(
                'Create',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString(
                    'newtask1', jsonEncode({'newtask1.0', _controller.text}));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => All(
                      title: _controller.text,
                      date: _selectedDate!,
                      note: _controller1.text,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
