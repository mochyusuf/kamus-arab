import 'dart:async';
import 'package:flutter/material.dart';

class Pengembang extends StatelessWidget {
  const Pengembang({super.key});

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
                                    image: AssetImage('assets/image/60.png'),
                                    fit: BoxFit.fill,
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 40, 20, 40),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                          width: 330,
                                          height: 2100 / 2,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/161.png'),
                                            fit: BoxFit.fitHeight,
                                          ))),
                                    ),
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
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: Text(
                                  'PENGEMBANG',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 22,
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
