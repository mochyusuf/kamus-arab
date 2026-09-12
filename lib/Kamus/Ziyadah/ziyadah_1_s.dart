import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/kamus.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'KeteranganListView.dart';
import 'KeteranganListViewTable.dart';

class Ziyadah_1_S extends StatelessWidget {
  const Ziyadah_1_S({super.key});

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
    print("back ziyadah 1");
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
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: 
                          //     Padding(
                          //       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //       child : KeteranganListView(),
                          //     ),
                          // ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
                                child: IntrinsicWidth(
                                  child: KeteranganListViewTable(
                                    id_keterangan: '1',
                                    urutan: '1',
                                  ),
                                ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
                                child: IntrinsicWidth(
                                  child: KeteranganListViewTable(
                                    id_keterangan: '1',
                                    urutan: '2',
                                  ),
                                ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
                                child: IntrinsicWidth(
                                  child: KeteranganListViewTable(
                                    id_keterangan: '1',
                                    urutan: '3',
                                  ),
                                ),
                            ),
                          ),
                          // Container(
                          //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          //   width: 905 / 2.1,
                          //   height: 914 / 2.1,
                          //   decoration: const BoxDecoration(
                          //       image: DecorationImage(
                          //     image: AssetImage('assets/image/91.png'),
                          //     fit: BoxFit.fitHeight,
                          //   )),
                          // ),
                          // Container(
                          //     margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          //     width: 905 / 2.1,
                          //     height: 914 / 2.1,
                          //     decoration: const BoxDecoration(
                          //         image: DecorationImage(
                          //       image: AssetImage('assets/image/92.png'),
                          //       fit: BoxFit.fitHeight,
                          //     ))),
                        ])),
                  ])))),
    );
  }
}
