import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lists/screens/home_page.dart';

final List<String> list = <String>['Work', 'Music', 'Travel', 'Study', 'Home'];

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final now = DateTime.now();
  final _controller = TextEditingController();
  final controller1 = TextEditingController();
  DateTime? _selectedDate;

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

  String dropdownValue = list.first;
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
               const   Expanded(
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
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    icon:const Icon(Icons.clear),
                  ),
                ],
              ),
            ],
          ),
        const  SizedBox(
            height: 25,
          ),
       const   Text(
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
              style: const TextStyle(fontSize: 21),
              maxLines: 6,
              controller: _controller,
            ),
          ),
          Row(
            children: [
             const Icon(Icons.notifications),
           const   SizedBox(
                width: 10,
              ),
              Text(
                intl.DateFormat.d().add_MMMM().add_Hm().format(
                      DateTime.now(),
                    ),
              ),
            const  Spacer(),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(
                  Icons.edit,
                ),
              ),
            ],
          ),
          Row(
            children:const  [
              Icon(Icons.note),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
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
              const   SizedBox(
                  width: 10,
                ),
              const   Text('Category'),
              const   Spacer(),
                DropdownButton<String>(
                  value: dropdownValue,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
             const    SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        const  Spacer(),
          Container(
            margin: const EdgeInsets.all(8),
            color:  Color(0xff5786FF),
            height: 50,
            width: double.infinity,
            child: TextButton(
              child:  const Text(
                'Create',
                style:  TextStyle(
                  color:  Colors.white,
                ),
              ),
              onPressed: (() {}),
            ),
          )
          // TextButton(onPressed: (){}, child: Text('Create'))
        ],
      ),
    );
  }
}
