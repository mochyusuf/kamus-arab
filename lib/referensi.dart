import 'dart:async';
import 'package:flutter/material.dart';

class Referensi extends StatelessWidget {
  const Referensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/image/5.png'),
                      fit: BoxFit.fitHeight,
                    )),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Stack(children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 330,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/58.png'),
                                    fit: BoxFit.fill,
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 60, 20, 70),
                                    child: Container(
                                        width: 330,
                                        height: 748 / 2,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(
                                              'assets/image/162.png'),
                                          fit: BoxFit.fitHeight,
                                        ))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                        Center(
                          child: Container(
                            height: 80,
                            width: 250,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/image/25.png'),
                              fit: BoxFit.fitHeight,
                            )),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  'REFERENSI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
                ]))));
  }
}
