import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/kamus.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Detail/detail_4.dart';
import 'package:kamus_arab/Kamus/Ziyadah/Detail/detail_5.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class Ziyadah_4 extends StatelessWidget {
  const Ziyadah_4({super.key});

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
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  width: 648 / 2.1,
                                  height: 28 / 2.1,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/110.png'),
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
                                  image: AssetImage('assets/image/165.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Detail_4()),
                                );
                              },
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  width: 655 / 2.1,
                                  height: 912 / 2.1,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/112.png'),
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
                                  image: AssetImage('assets/image/166.png'),
                                  fit: BoxFit.fitHeight,
                                )),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Detail_5()),
                                );
                              },
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  width: 1246 / 2.1,
                                  height: 914 / 2.1,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/114.png'),
                                    fit: BoxFit.fitHeight,
                                  )),
                                )),
                          ])),
                    ])))));
  }
}
