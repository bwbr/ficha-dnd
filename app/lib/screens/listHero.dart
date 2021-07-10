import 'dart:convert';
import 'dart:html';

import 'package:fichadnd/models/heros.dart';
import 'package:fichadnd/screens/ViewHero.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const _titleAppBar = 'LISTA DOS HEROIS';

class ListHero extends StatelessWidget {
  final String documentId = '1i6QzuvebV00jKhRxIY5';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference profiles =
        firestore.collection('profiles').doc(documentId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: Text(_titleAppBar),
      ),
      body: FutureBuilder<QuerySnapshot<HeroModel>>(
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
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  itemCount: heros.length,
                  itemBuilder: (context, index) {
                    print(heros);
                    final HeroModel hero = heros[index];
                    return Card(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                            (MaterialPageRoute(
                              builder: (context) => ViewHero(),
                            ))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  'https://image.flaticon.com/icons/png/512/1538/1538462.png',
                                  fit: BoxFit.fitHeight,
                                  height: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Nome"),
                                ),
                                Text(hero.name.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Column(),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }

          return Text("loading");
        },
      ),
    );
  }
}
