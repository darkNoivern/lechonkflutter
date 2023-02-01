import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:geodude/screens/newCard.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {


  List<dynamic> clrs = [Color.fromRGBO(228, 0, 124, 1), Color.fromRGBO(255, 189, 57, 1),Colors.teal, Colors.white30,];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.uid.toString())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> firebasecards = snapshot.data?['cards'];
            var controller = FixedExtentScrollController(initialItem: firebasecards.length ~/ 2);
            return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    'Your Card Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Montserrat_500',
                    ),
                  )),
              backgroundColor: Color(0xFF161927),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: ListWheelScrollView(
                  controller: controller,
                  itemExtent: 200,
                  children: firebasecards.asMap().entries.map((entry) =>
                    Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          // color: Color(0xFF576EE0),
                          color: clrs[(entry.key)%4],
                        ),
                      ),
                      Positioned(
                          top: 32,
                          right: 16,
                          child: Container(
                            height: 96,
                            // width: 20,
                            child: Image.asset('assets/images/logo.png'),
                            // color: Colors.black,
                          )),
                      Positioned(
                          bottom: 128,
                          left: 16,
                          child: Text(
                            '${entry.value['cardNumber']}',
                            style: TextStyle(fontFamily: 'Montserrat_500', color: Colors.white),
                          )),
                      Positioned(
                          bottom: 96,
                          left: 16,
                          child: Row(
                            children: [
                              Text(
                                'Expire Date : ',
                                style: TextStyle(
                                    fontFamily: 'Montserrat_500', color: Colors.white),
                              ),
                              Text(
                                '${entry.value['expiryDate']}',
                                style: TextStyle(
                                    fontFamily: 'Montserrat_500', color: Colors.white),
                              ),
                            ],
                          )),
                      Positioned(
                          bottom: 64,
                          left: 16,
                          child: Row(
                            children: [
                              Text(
                                "Card Holder : ",
                                style: TextStyle(
                                    fontFamily: 'Montserrat_500', color: Colors.white),
                              ),
                              Text(
                                '${entry.value['cardHolderName']}',
                                style: TextStyle(
                                    fontFamily: 'Aquire',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                      Positioned(
                          bottom: 32,
                          left: 16,
                          child: Row(
                            children: [
                              Text(
                                "CVV : ",
                                style: TextStyle(
                                    fontFamily: 'Montserrat_500', color: Colors.white),
                              ),
                              Text(

                                '${entry.value['cvvCode']}',
                                style: TextStyle(
                                    fontFamily: 'Aquire',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ],
                  ),
                  ).toList(),
                ),
              ),

              // bottomNavigationBar: Container(padding: EdgeInsets.symmetric(vertical: 8.0),),
              floatingActionButton: Container(
                child: FloatingActionButton(
                    backgroundColor: Color(0xFF576EE0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewCard()),
                      );
                    },
                    child: Icon(Icons.credit_score_rounded)),
              ),
            );
          } else {
            return  Scaffold(
              backgroundColor: Color(0xFF161927),
              body: Center(child: CircularProgressIndicator(color: Colors.white)),
            );
          }
        });
  }
}
