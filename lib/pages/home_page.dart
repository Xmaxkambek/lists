import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lists/pages/login_in.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue.shade400,
                Colors.blue.shade600,
                Colors.blue.shade500,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'to',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Learning',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginIn(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      const Expanded(
                          child: Text(
                        'Login in ',
                        style: TextStyle(color: Colors.purple, fontSize: 16),
                      )),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.purple),
                        child:const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}