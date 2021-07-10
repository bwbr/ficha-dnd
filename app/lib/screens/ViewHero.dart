import 'package:flutter/material.dart';

const _titleAppBar = 'DETALHES DO HERÓI';

class ViewHero extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: Text(_titleAppBar),
      ),
      body: Container(
        height: MediaQuery.of(context).size.shortestSide,
        width: MediaQuery.of(context).size.shortestSide,
        child: SingleChildScrollView(
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child:
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Caso queira colocar a história do heroi. Aqui."),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Cabeça")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Principal")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Torco")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'images/hero.png',
                                  fit: BoxFit.fitHeight,
                                  height: 300,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Colar")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Secundária")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Perna")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              color: Colors.black,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("INVENTÁRIO".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
