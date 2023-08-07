import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String fact = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                Response factResponse = await get(
                  Uri.parse("https://cat-fact.herokuapp.com/facts")
                );

                dynamic factResponseData = jsonDecode(factResponse.body);
                // print(factResponseData[1]['text']);

                setState(() {
                  fact = factResponseData[1]['text'];
                });
              },
              color: Colors.green,
              child: Text("Get the Fact", style: TextStyle(color: Colors.white),),
            ),
            Text(fact)
          ],
        ),
      ),
    );
  }
}



// GET API => Gives you stuff(response) without any request
// POST API => Gives you stuff(response) on the basis of a request body