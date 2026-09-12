import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/Kamus.dart';
import 'CariListView.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class Pencarian extends StatelessWidget {
  const Pencarian({super.key});

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
                      image: AssetImage('assets/image/80.png'),
                      fit: BoxFit.fitHeight,
                    )),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Stack(children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/78.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                                ),
                                Container(
                                  width: 350,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/79.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: CariListView()),
                                ),
                                Container(
                                  height: 50,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/image/77.png'),
                                    fit: BoxFit.fill,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        )),
                        GestureDetector(
                            child: Container(
                              height: 70,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/25.png'),
                                fit: BoxFit.fitHeight,
                              )),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    'بَحْثٌ لِمَرَّةٍ أُخْرَى',
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
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Kamus()),
                              );
                            }),
                      ])),
                ]))));
  }
}
