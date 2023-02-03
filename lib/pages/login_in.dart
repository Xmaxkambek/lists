import 'package:flutter/material.dart';
import 'package:lists/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginIn extends StatefulWidget {
  const LoginIn({super.key});

  @override
  State<LoginIn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginIn> {
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
                decoration: InputDecoration(
                    hintText: 'example@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 11, left: 10),
                      child: const Icon(Icons.person),
                    )),
              ),
            ),
            // SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'password ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 11, left: 10),
                    child: const Icon(Icons.key),
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
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blueAccent,
                        size: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 15),
                  const Text(
                    'New User?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                    },
                    child: Text('Sign up'),
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
