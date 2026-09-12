import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kamus_arab/singleton.dart';
import 'kamus.dart';
import 'latihan.dart';
import 'latihan/latihan_akhir.dart';
import 'pengembang.dart';
import 'petunjuk.dart';
import 'prakata.dart';
import 'referensi.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.2;
    double width = MediaQuery.of(context).size.height * 0.2 -
        (MediaQuery.of(context).size.height * 0.02);
    return Scaffold(
        appBar: null,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/image/5.png'),
                    fit: BoxFit.fitHeight,
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            child: Container(
                              height: height,
                              width: width,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/7.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PrakataPage()),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: height,
                              width: width,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/9.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Petunjuk()),
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            child: Container(
                              height: height,
                              width: width,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/13.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Kamus()),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: height,
                              width: width,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/11.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                            onTap: () {
                              Singleton singleton = Singleton();
                              singleton.setSkor(0);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Latihan()),
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            child: Container(
                              height: height,
                              width: width,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/15.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Referensi()),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: height,
                              width: width,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/17.png'),
                                fit: BoxFit.fill,
                              )),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pengembang()),
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }

  void tmpFunction() {
    // ignore: avoid_print
    print('Function Called.');
  }
}
