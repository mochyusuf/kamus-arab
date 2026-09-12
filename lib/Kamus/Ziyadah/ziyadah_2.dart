import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/kamus.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Detail/detail_1.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Detail/detail_2.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Detail/detail_3.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class Ziyadah_2 extends StatelessWidget {
  const Ziyadah_2({super.key});

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
      MaterialPageRoute(builder: (context) => const Kamus()),
    );
    print("back ziyadah 2");
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                        child: Column(children: [
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                width: 648 / 2.1,
                                height: 28 / 2.1,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/image/100.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                              )),
                          GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              width: 824 / 2.1,
                              height: 136 / 2.1,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/101.png'),
                                fit: BoxFit.fitHeight,
                              )),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Detail_1()),
                              );
                            },
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                width: 1322 / 2.1,
                                height: 914 / 2.1,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/image/102.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                              )),
                          GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              width: 824 / 2.1,
                              height: 136 / 2.1,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/103.png'),
                                fit: BoxFit.fitHeight,
                              )),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Detail_2()),
                              );
                            },
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                width: 2346 / 2.1,
                                height: 914 / 2.1,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/image/104.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                              )),
                          GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              width: 830 / 2.1,
                              height: 136 / 2.1,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/164.png'),
                                fit: BoxFit.fitHeight,
                              )),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Detail_3()),
                              );
                            },
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                width: 2028 / 2.1,
                                height: 914 / 2.1,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/image/106.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                              )),
                        ]),
                      ),
                    ])))));
  }
}
