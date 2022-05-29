// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ['App Problem', 'Quarantine Problem'];
    String? selectedItem = 'App Problem';
    final number = '+905558885511';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    "HELP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    height: 130,
                    width: 300,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(27, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26, 30, 30, 10),
                          child: Text(
                            "Contact Number",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "+90-555-555-55-11",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  primary: primaryColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                              child: Text("Call"),
                              onPressed: () async {
                                // ignore: deprecated_member_use
                                await launch("tel://$number");
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(27, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Problem Type",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    filled: true, fillColor: Color(0xFFF7F5F2)),
                                value: selectedItem,
                                items: items
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (item) => setState(
                                    () => selectedItem = item as String),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Note",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Card(
                            color: Color(0xFFF7F5F2),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 5, 8, 2),
                              child: TextField(
                                maxLines: 8, //or null
                                decoration: InputDecoration.collapsed(
                                    hintText: "Enter your text here"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: primaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 18)),
                    child: Text("Send"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
