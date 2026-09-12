import 'dart:async';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:kamus_arab/Latihan/LatihanSoal.dart';

import '../Singleton.dart';
import '../latihan.dart';
import './latihan_akhir.dart';

class Latihan_Soal extends StatelessWidget {
  const Latihan_Soal({super.key});
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
  late List<LatihanSoal> listSoal;
  late int indexSoal;
  bool visible_benar = false;
  bool visible_salah = false;
  bool click = false;

  String benar = "";

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    Singleton singleton = Singleton();
    indexSoal = singleton.getindexSoal();
    listSoal = singleton.getlistSoal();
    if (listSoal[indexSoal].benar_a == 1) {
      benar = listSoal[indexSoal].jawaban_a!;
    }
    if (listSoal[indexSoal].benar_b == 1) {
      benar = listSoal[indexSoal].jawaban_b!;
    }
    if (listSoal[indexSoal].benar_c == 1) {
      benar = listSoal[indexSoal].jawaban_c!;
    }
    if (listSoal[indexSoal].benar_d == 1) {
      benar = listSoal[indexSoal].jawaban_d!;
    }
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Latihan()),
    );
    return true;
  }

  void _changed(bool visibility, String field) {
    setState(() {
      Singleton singleton = Singleton();
      int skor = singleton.getSkor();
      if (click == false) {
        if (field == "benar") {
          skor = skor + 20;
          visible_benar = visibility;
        }
        if (field == "salah") {
          visible_salah = visibility;
        }
        singleton.setSkor(skor);
      }
      click = true;
    });
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
                      child: Container(
                          height: 150,
                          width: 300,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/image/27.png'),
                            fit: BoxFit.fill,
                          )),
                          child: Center(
                            child: Text(
                              "${listSoal[indexSoal].soal}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))),
                  SizedBox(
                      height: 60,
                      width: 300,
                      child: Center(
                          child: Text(
                        "${listSoal[indexSoal].pertanyaan}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3D0C01),
                        ),
                      ))),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      child: Container(
                          height: 100,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/image/28.png'),
                            fit: BoxFit.fill,
                          )),
                          child: Center(
                              child: Text(
                            "${listSoal[indexSoal].jawaban_a}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3D0C01),
                            ),
                          ))),
                      onTap: () {
                        if (listSoal[indexSoal].benar_a == 1) {
                          _changed(true, "benar");
                        } else {
                          _changed(true, "salah");
                        }
                      },
                    ),
                    GestureDetector(
                      child: Container(
                          height: 100,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/image/28.png'),
                            fit: BoxFit.fill,
                          )),
                          child: Center(
                              child: Text(
                            "${listSoal[indexSoal].jawaban_b}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3D0C01),
                            ),
                          ))),
                      onTap: () {
                        if (listSoal[indexSoal].benar_b == 1) {
                          _changed(true, "benar");
                        } else {
                          _changed(true, "salah");
                        }
                      },
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      child: Container(
                          height: 100,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/image/28.png'),
                            fit: BoxFit.fill,
                          )),
                          child: Center(
                              child: Text(
                            "${listSoal[indexSoal].jawaban_c}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3D0C01),
                            ),
                          ))),
                      onTap: () {
                        if (listSoal[indexSoal].benar_c == 1) {
                          _changed(true, "benar");
                        } else {
                          _changed(true, "salah");
                        }
                      },
                    ),
                    GestureDetector(
                      child: Container(
                          height: 100,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/image/28.png'),
                            fit: BoxFit.fill,
                          )),
                          child: Center(
                              child: Text(
                            "${listSoal[indexSoal].jawaban_d}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3D0C01),
                            ),
                          ))),
                      onTap: () {
                        if (listSoal[indexSoal].benar_d == 1) {
                          _changed(true, "benar");
                        } else {
                          _changed(true, "salah");
                        }
                      },
                    ),
                  ]),
                  Visibility(
                      visible: visible_benar,
                      child: Column(children: [
                        const SizedBox(
                            height: 40,
                            width: 300,
                            child: Center(
                                child: Text(
                              "* Tekan Untuk Melanjutkan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3D0C01),
                              ),
                            ))),
                        GestureDetector(
                          child: Stack(children: [
                            Center(
                                child: Container(
                                    height: 70,
                                    width: 300,
                                    margin: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      "assets/image/29.png",
                                      height: 70,
                                      width: 300,
                                      fit: BoxFit.fill,
                                    ))),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "الصحيح : $benar",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )
                          ]),
                          onTap: () {
                            if (indexSoal < (listSoal.length - 1)) {
                              Singleton singleton = Singleton();
                              singleton.setindexSoal(indexSoal + 1);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Latihan_Soal()),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Latihan_Akhir()),
                              );
                            }
                          },
                        ),
                      ])),
                  Visibility(
                      visible: visible_salah,
                      child: Column(children: [
                        const SizedBox(
                            height: 40,
                            width: 300,
                            child: Center(
                                child: Text(
                              "* Tekan Untuk Melanjutkan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3D0C01),
                              ),
                            ))),
                        GestureDetector(
                          child: Stack(children: [
                            Center(
                                child: Container(
                                    height: 70,
                                    width: 300,
                                    margin: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      "assets/image/30.png",
                                      height: 70,
                                      width: 300,
                                      fit: BoxFit.fill,
                                    ))),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "الصحيح : $benar",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            )
                          ]),
                          onTap: () {
                            if (indexSoal < (listSoal.length - 1)) {
                              Singleton singleton = Singleton();
                              singleton.setindexSoal(indexSoal + 1);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Latihan_Soal()),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Latihan_Akhir()),
                              );
                            }
                          },
                        ),
                      ]))
                ]))));
  }
}
