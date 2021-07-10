import 'dart:convert';
import 'dart:html';

import 'package:fichadnd/models/heros.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListHero extends StatelessWidget {
  final String documentId = '1i6QzuvebV00jKhRxIY5';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference profiles =
        firestore.collection('profiles').doc(documentId);

    return FutureBuilder<QuerySnapshot<HeroModel>>(
      future: profiles.collection('heros').withConverter<HeroModel>(
        fromFirestore: (snapshots, _) => HeroModel.fromJson(snapshots.data()),
        toFirestore: (hero, _) => HeroModel(hero.name, hero.slots).toJson(),
      ).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<HeroModel>> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data.docs.isEmpty) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final List<HeroModel> heros = snapshot.data.docs.map((hero) => hero.data()).toList();
          print(heros);
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
                itemCount: heros.length,
                itemBuilder: (context, index) {
                  print(heros);
                  final HeroModel hero = heros[index];
                  return Card(
                    child: Row(
                      children: [
                        Column(
                          children: [Text(hero.name)],
                        ),
                      ],
                    ),
                  );
                }),
          );
        }

        return Text("loading");
      },
    );
  }
}
