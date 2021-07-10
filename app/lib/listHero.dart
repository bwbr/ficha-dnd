import 'dart:html';

import 'package:flutter/material.dart';

const _titleAppBar = "Lista de Herois";
class ListHero extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
        home: Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Nome")
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
