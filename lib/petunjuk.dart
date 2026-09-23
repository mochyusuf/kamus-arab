import 'dart:async';
import 'package:flutter/material.dart';
import 'Petunjuk/petunjuk_kamus.dart';
import 'Petunjuk/petunjuk_latihan.dart';
import 'Petunjuk/petunjuk_pengembang.dart';
import 'Petunjuk/petunjuk_petunjuk.dart';
import 'Petunjuk/petunjuk_prakarta.dart';
import 'Petunjuk/petunjuk_referensi.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Petunjuk extends StatelessWidget {
  const Petunjuk({super.key});

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
                                    image: AssetImage('assets/image/61.png'),
                                    fit: BoxFit.fill,
                                  )),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 40, 10, 40),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                            child: Container(
                                              width: double.infinity,
                                              height: 5,
                                              color: const Color(0xff8F8A6D),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   child: Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 10, 0, 0, 0),
                                          //         child: Container(
                                          //           width: 58,
                                          //           height: 200 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/6.png'),
                                          //             fit: BoxFit.fitWidth,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 0, 15, 0, 0),
                                          //         child: Container(
                                          //           width: 240,
                                          //           height: 58 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/150.png'),
                                          //             fit: BoxFit.fitHeight,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   onTap: () {
                                          //     Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               const Petunjuk_Prakarta()),
                                          //     );
                                          //   },
                                          // ),
                                          // Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       0, 10, 0, 10),
                                          //   child: Container(
                                          //     width: double.infinity,
                                          //     height: 5,
                                          //     color: const Color(0xff8F8A6D),
                                          //   ),
                                          // ),
                                          // GestureDetector(
                                          //   child: Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 10, 0, 0, 0),
                                          //         child: Container(
                                          //           width: 58,
                                          //           height: 200 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/8.png'),
                                          //             fit: BoxFit.fitWidth,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 0, 15, 0, 0),
                                          //         child: Container(
                                          //           width: 240,
                                          //           height: 58 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/151.png'),
                                          //             fit: BoxFit.fitHeight,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   onTap: () {
                                          //     Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               const Petunjuk_Petunjuk()),
                                          //     );
                                          //   },
                                          // ),
                                          // Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       0, 10, 0, 10),
                                          //   child: Container(
                                          //     width: double.infinity,
                                          //     height: 5,
                                          //     color: const Color(0xff8F8A6D),
                                          //   ),
                                          // ),
                                          GestureDetector(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Container(
                                                    width: 58,
                                                    height: 200 / 4,
                                                    decoration:
                                                        const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                      image: AssetImage(
                                                          'assets/image/12.png'),
                                                      fit: BoxFit.fitWidth,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 15, 0, 0),
                                                  child: Container(
                                                    width: 240,
                                                    height: 58 / 4,
                                                    decoration:
                                                        const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                      image: AssetImage(
                                                          'assets/image/152.png'),
                                                      fit: BoxFit.fitHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Petunjuk_Kamus()),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                            child: Container(
                                              width: double.infinity,
                                              height: 5,
                                              color: const Color(0xff8F8A6D),
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: Container(
                                                    width: 58,
                                                    height: 200 / 4,
                                                    decoration:
                                                        const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                      image: AssetImage(
                                                          'assets/image/10.png'),
                                                      fit: BoxFit.fitWidth,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 15, 0, 0),
                                                  child: Container(
                                                    width: 240,
                                                    height: 58 / 4,
                                                    decoration:
                                                        const BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                      image: AssetImage(
                                                          'assets/image/153.png'),
                                                      fit: BoxFit.fitHeight,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Petunjuk_Latihan()),
                                              );
                                            },
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       0, 10, 0, 10),
                                          //   child: Container(
                                          //     width: double.infinity,
                                          //     height: 5,
                                          //     color: const Color(0xff8F8A6D),
                                          //   ),
                                          // ),
                                          // GestureDetector(
                                          //   child: Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 10, 0, 0, 0),
                                          //         child: Container(
                                          //           width: 58,
                                          //           height: 200 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/14.png'),
                                          //             fit: BoxFit.fitWidth,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 0, 15, 0, 0),
                                          //         child: Container(
                                          //           width: 240,
                                          //           height: 58 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/154.png'),
                                          //             fit: BoxFit.fitHeight,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   onTap: () {
                                          //     Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               const Petunjuk_Referensi()),
                                          //     );
                                          //   },
                                          // ),
                                          // Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       0, 10, 0, 10),
                                          //   child: Container(
                                          //     width: double.infinity,
                                          //     height: 5,
                                          //     color: const Color(0xff8F8A6D),
                                          //   ),
                                          // ),
                                          // GestureDetector(
                                          //   child: Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 10, 0, 0, 0),
                                          //         child: Container(
                                          //           width: 58,
                                          //           height: 200 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/16.png'),
                                          //             fit: BoxFit.fitWidth,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //       Padding(
                                          //         padding:
                                          //             const EdgeInsets.fromLTRB(
                                          //                 0, 15, 0, 0),
                                          //         child: Container(
                                          //           width: 240,
                                          //           height: 58 / 4,
                                          //           decoration:
                                          //               const BoxDecoration(
                                          //                   image:
                                          //                       DecorationImage(
                                          //             image: AssetImage(
                                          //                 'assets/image/155.png'),
                                          //             fit: BoxFit.fitHeight,
                                          //             alignment:
                                          //                 Alignment.centerLeft,
                                          //           )),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   onTap: () {
                                          //     Navigator.push(
                                          //       context,
                                          //       MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               const Petunjuk_Pengembang()),
                                          //     );
                                          //   },
                                          // ),
                                        ],
                                      )),
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
                              fit: BoxFit.fill,
                            )),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: Text(
                                  'PETUNJUK \nPENGGUNAAN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ])),
                ]))));
  }
}
