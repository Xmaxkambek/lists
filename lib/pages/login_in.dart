import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lists/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});

  @override
  State<LoginIn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginIn> {
  String olingan = '';
  String olingan2 = '';
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      String? i = prefs.getString('home2');
      Map e = jsonDecode(i!);
      setState(() {
        olingan = e['home2.0'];
      });
    });
    SharedPreferences.getInstance().then((prefs) {
      String? a = prefs.getString('home2.1');
      Map s = jsonDecode(a!);
      setState(() {
        olingan = s['home2.0.'];
      });
    });

    super.initState();
  }

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 170),
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 15, top: 60),
              child: TextField(
                controller: controller1,
                decoration: InputDecoration(
                    hintText: 'example@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(right: 11, left: 10),
                      child: Icon(Icons.person),
                    )),
              ),
            ),
            // SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
              child: TextField(
                controller: controller2,
                decoration: InputDecoration(
                  hintText: 'password ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 11, left: 10),
                    child: Icon(Icons.key),
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString(
                      'home2', jsonEncode({'home2.0': controller1.text}));
                  final prefs2 = await SharedPreferences.getInstance();
                  await prefs2.setString(
                      'home2.1', jsonEncode({'home2.0.1': controller2.text}));

                  print('quyildi');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    const Expanded(
                        child: Text(
                      'Login in ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blueAccent,
                        size: 15,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  const Text(
                    'New User?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () async {},
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
