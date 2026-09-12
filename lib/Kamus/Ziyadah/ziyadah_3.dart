import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/kamus.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class Ziyadah_3 extends StatelessWidget {
  const Ziyadah_3({super.key});

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
    print("back ziyadah 3");
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
                          child: SizedBox(
                              height: 457,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(children: [
                                    Container(
                                      width: 324,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image:
                                            AssetImage('assets/image/65.png'),
                                        fit: BoxFit.fitWidth,
                                      )),
                                    ),
                                  ])))),
                    ])))));
  }
}
