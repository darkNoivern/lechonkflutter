import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddBill extends StatefulWidget {
  const AddBill({Key? key}) : super(key: key);

  @override
  State<AddBill> createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  TextEditingController _billNameController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();
  DateTime _dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.uid.toString())
            .snapshots(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Scaffold(
                    backgroundColor: Color(0xFF161927),
                    body: SingleChildScrollView(
                      child: Container(
                        // height: (MediaQuery.of(context).size.height ),
                        // color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 128.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Montserrat_600',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'New Bill',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Montserrat_600',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 32.0),
                              child:
                              TextField(
                                controller: _billNameController,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintText: 'Example : Electric Bill',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat_400'),
                                  labelText: 'Name of the Bill',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat_400'),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.description_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,

                                // keyboardAppearance: ,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),

                            SizedBox(height: 16.0,),
                            Container(
                              child: TextField(
                                controller: _amountController,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintText: 'Some Amount',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Montserrat_400'),
                                  labelText: 'Enter amount to pay',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat_400'),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.description_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Selected Date : ${_dueDate.day}/${_dueDate.month}/${_dueDate.year}',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat_400'),
                                      )),
                                    )),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () async {
                                      DateTime? dateSelected =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2001),
                                        lastDate: DateTime(2030),
                                      );

                                      if (dateSelected != null) {
                                        setState(() {
                                          _dueDate = dateSelected;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 56,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Color(0xFF576EE0),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Select Date',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat_600',
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24.0),
                              child: InkWell(
                                child: Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Color(0xFF576EE0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Montserrat_600',
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                onTap: () {

                                  if(_billNameController.text.isEmpty){
                                    final snackBar = SnackBar(
                                      /// need to set following properties for best effect of awesome_snackbar_content
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Snap!',
                                        message: 'Please fill out the name !!',
                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.failure,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                    return ;
                                  }

                                  if(_amountController.text.isEmpty){
                                    final snackBar = SnackBar(
                                      /// need to set following properties for best effect of awesome_snackbar_content
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Snap !!',
                                        message: 'Please fill out the amount to be paid !!',
                                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                        contentType: ContentType.failure,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(snackBar);
                                    return ;
                                  }


                                  var rng = new Random();
                                  int randomNumber =
                                      rng.nextInt(900000) + 100000;
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth.instance.currentUser?.uid
                                      .toString())
                                      .update({
                                    'bills': FieldValue.arrayUnion([
                                      {
                                        'name': _billNameController.text.toString(),
                                        'amount': int.parse(_amountController.text.toString()),
                                        'createdAt': Timestamp.now(),
                                        'dueDate': _dueDate,
                                        'id': randomNumber,
                                      }
                                    ])
                                  });

                                  _amountController.clear();
                                  _billNameController.clear();
                                  setState(() {
                                    _dueDate = DateTime.now();
                                  });

                                  final snackBar = SnackBar(
                                    /// need to set following properties for best effect of awesome_snackbar_content
                                    elevation: 0,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      title: 'Hi User!',
                                      message: 'Bill injected succesfully',
                                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                      contentType: ContentType.success,
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )));
          } else {
            return  Scaffold(
              backgroundColor: Color(0xFF161927),
              body: Center(child: CircularProgressIndicator(color: Colors.white)),
            );
          }
        });
  }
}
