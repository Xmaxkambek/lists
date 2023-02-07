import 'package:flutter/material.dart';
import 'package:lists/CategoryPages/All.dart';
import 'package:lists/models/models.dart';
import 'package:lists/screens/new_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Jami> _item = [
    Jami(
        icon: Icon(
          Icons.person,
          color: Colors.blueAccent,
        ),
        title: 'All',
        subtitle: '11 Tasks',
        onPressed: () {}),
    Jami(
        icon: Icon(
          Icons.work,
          color: Colors.orange,
        ),
        title: 'Work',
        subtitle: '14 Tasks',
        onPressed: () {}),
    Jami(
        icon: Icon(
          Icons.music_note,
          color: Colors.red,
        ),
        title: 'Music',
        subtitle: '6 Tasks',
        onPressed: () {}),
    Jami(
        icon: Icon(
          Icons.travel_explore,
          color: Colors.green,
        ),
        title: 'Traval',
        subtitle: '1 Tasks',
        onPressed: () {}),
    Jami(
        icon: Icon(
          Icons.menu_book_sharp,
          color: Colors.purple,
        ),
        title: 'Study',
        subtitle: '2 Tasks',
        onPressed: () {}),
    Jami(
        icon: Icon(
          Icons.home,
          color: Colors.red,
        ),
        title: 'Home',
        subtitle: '14 Tasks',
        onPressed: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    final jamiSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 13, left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  size: 35,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Lists',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 28),

              Expanded(
                child: GridView.builder(
                  itemCount: _item.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisSpacing: 13,
                    crossAxisSpacing: 13,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => _item[index].onPressed(context),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(0.5, 1),
                            blurRadius: 3,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _item[index].icon,
                            const Spacer(),
                            Text(
                              _item[index].title,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(_item[index].subtitle),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButton: Padding(
        
        padding: const EdgeInsets.only(bottom: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewTask(),
              ),
            );
          },
          child: Container(
            
            height:60,
            width:60,
            
            alignment: Alignment.center,
            decoration: const  BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
