import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Detail/detail_1.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Ziyadah_4.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Ziyadah_4_S.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'detail_4.dart';

class Detail_4_A extends StatelessWidget {
  const Detail_4_A({super.key});

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
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Ziyadah_4_S()),
    );
    print("back ziyadah 4");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
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
                        image: AssetImage('assets/image/80.png'),
                        fit: BoxFit.fitHeight,
                      )),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                          child: Center(
                              child: Stack(children: [
                            Center(
                                child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 60, 0, 0),
                                  width: 400,
                                  height: 565,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/130.png'),
                                    fit: BoxFit.fitHeight,
                                  ))),
                            )),
                            Center(
                                child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 400,
                                height: 80,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/image/120.png'),
                                  fit: BoxFit.fill,
                                )),
                                child: Center(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          height: 50,
                                          width: 150,
                                          margin: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/122.png'),
                                            fit: BoxFit.fill,
                                          )),
                                          child: const Center(
                                            child: Text(
                                              "ARAB",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Detail_4()),
                                          );
                                        },
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 0, 0, 0),
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          height: 50,
                                          width: 150,
                                          margin: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/121.png'),
                                            fit: BoxFit.fill,
                                          )),
                                          child: const Center(
                                            child: Text(
                                              "INDONESIA",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                          ])),
                        )),
                  ])))),
    );
  }
}
