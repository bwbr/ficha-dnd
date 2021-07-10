import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListHero extends StatelessWidget {
  final String documentId = '1i6QzuvebV00jKhRxIY5';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference profiles = firestore.collection('profiles').doc(documentId);

    return FutureBuilder<QuerySnapshot>(
      future: profiles.collection('heros').get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        // if (snapshot.hasData && !snapshot.data.exists) {
        //   return Text("Document does not exist");
        // }


        if (snapshot.connectionState == ConnectionState.done) {
          snapshot.data.docs.forEach((element) {print(element.data());});
        }

        return Text("loading");
      },
    );
  }
}
