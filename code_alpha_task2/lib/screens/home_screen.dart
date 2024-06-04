import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  List<String> _quotes = [
    "You can do it",
    "Be Strong",
    "Maybe your path is harder because your calling is higher",
    "Work in silence, Let your success be your shine"
  ];
  Random random = Random();
  late int randomIndex;
  late String randomQuote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote App"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            randomIndex = random.nextInt(_quotes.length);
            randomQuote = _quotes[randomIndex];
            print(randomQuote);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text(randomQuote),
                      actions: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () async {
                                await Share.share(randomQuote);
                              },
                              child: Text("Share")),
                        ),
                      ],
                    ));
          },
          child: Text("Generate Quote"),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blueAccent),
        ),
      ),
    );
  }
}
