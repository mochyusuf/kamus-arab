import 'dart:async';
import 'package:flutter/material.dart';

class Petunjuk_Referensi extends StatelessWidget {
  const Petunjuk_Referensi({super.key});

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
                      child: Container(
                        height: 500,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/image/54.png'),
                          fit: BoxFit.fitHeight,
                        )),
                      )),
                ]))));
  }
}
