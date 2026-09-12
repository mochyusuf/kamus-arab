import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/home.dart';
import 'package:kamus_arab/latihan.dart';
import 'package:kamus_arab/Latihan/latihan_soal.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import '../Singleton.dart';

class Latihan_Akhir extends StatelessWidget {
  const Latihan_Akhir({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int skor;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor1);
    Singleton singleton = Singleton();
    skor = singleton.getSkor();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor1);
    super.dispose();
  }

  bool myInterceptor1(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Stack(children: [
          Container(
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
                        image: AssetImage('assets/image/80.png'),
                        fit: BoxFit.fitHeight,
                      )),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Column(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 350,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage('assets/image/61.png'),
                                      fit: BoxFit.fill,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: SizedBox(
                                        width: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            "SCORE : $skor",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                              height: 85,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/25.png'),
                                fit: BoxFit.fitHeight,
                              )),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    'SELESAI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Singleton singleton = Singleton();
                              singleton.setSkor(0);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Latihan()),
                              );
                            },
                          ),
                        ])),
                  ]))),
        ]));
  }
}
