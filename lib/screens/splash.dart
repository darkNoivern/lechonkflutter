import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geodude/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')
          ));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161927),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Image.asset('assets/images/lechonk.webp')),
            ],
          ),
          Text('Lechonk Finances', style: TextStyle(
              fontFamily: 'Aquire',
              fontSize: 24, color: Colors.white),),
        ],
      ),
    );
  }
}
