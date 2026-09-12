import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamus_arab/Latihan/LatihanKategori.dart';
import 'package:kamus_arab/API.dart';
import 'package:kamus_arab/Kamus/Pencarian/Kamus.dart';
import 'package:kamus_arab/Kamus.dart' as kamus_scene;
import 'package:kamus_arab/Singleton.dart';

class CariListView extends StatelessWidget {
  late BuildContext context1;
  late String cari;
  @override
  Widget build(BuildContext context) {
    Singleton singleton = Singleton();
    cari = singleton.getCari();
    context1 = context;
    return FutureBuilder<List<Kamus>>(
      future: _fetchKamus(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Kamus>? data = snapshot.data;
          return _kamusListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<Kamus>> _fetchKamus() async {
    API api = API();
    late final Uri kamusListAPIUrl;
    print(cari.isEmpty);
    if (cari.isEmpty) {
      kamusListAPIUrl = Uri.parse(api.getBASEURLKamus());
    } else {
      kamusListAPIUrl = Uri.parse(api.getBASEURLKamusCari(cari));
    }
    final response = await http.get(kamusListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((kamus) => Kamus.fromJson(kamus)).toList();
    } else {
      throw Exception('Failed to load kamus from API');
    }
  }

  Column _kamusListView(data) {
    Column col = Column(
      children: [],
    );

    for (var i = 0; i < data.length; i++) {
      print(data[i].akar_kata);
      Color color_kata = Color(0x00000000);
      if (data[i].highlight) {
        color_kata = Color(0xffFFA401);
      }
      if (data[i].akar_kata != null) {
        col.children.add(Container(
            width: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/79.png'),
              fit: BoxFit.fitWidth,
            )),
            child: (((Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 5, 10, 9),
                child: Container(
                  width: double.infinity,
                  height: 5,
                  color: const Color(0xff3D0C01),
                ),
              )
            ]))))));
        col.children.add(Container(
          width: 350,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image/79.png'),
            fit: BoxFit.fitWidth,
          )),
          child: (((Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 5, 9, 0),
                child: Container(
                  width: double.infinity,
                  height: 5,
                  color: const Color(0xff8F8A6D),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 170,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          "Akar Kata",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          color: const Color(0xff8F8A6D),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          data[i].akar_kata,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 5),
                child: Container(
                  width: double.infinity,
                  height: 5,
                  color: const Color(0xff8F8A6D),
                ),
              ),
            ],
          )))),
        ));
      }
      col.children.add(Container(
          width: 350,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image/79.png'),
            fit: BoxFit.fitWidth,
          )),
          child: (((Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 5, 10, 9),
              child: Container(
                width: double.infinity,
                height: 5,
                color: const Color(0xff3D0C01),
              ),
            )
          ]))))));
      col.children.add(
        Container(
          width: 350,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image/79.png'),
            fit: BoxFit.fill,
          )),
          child: (((Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 5, 9, 0),
                child: Container(
                  width: double.infinity,
                  height: 5,
                  color: const Color(0xff8F8A6D),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              data[i].kalimat,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                          child: Container(
                            width: 191,
                            height: 5,
                            color: const Color(0xff8F8A6D),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              data[i].arti,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          color: const Color(0xff8F8A6D),
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 140,
                      decoration: BoxDecoration(color: color_kata),
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            data[i].kata,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 5),
                child: Container(
                  width: double.infinity,
                  height: 5,
                  color: const Color(0xff8F8A6D),
                ),
              ),
            ],
          )))),
        ),
      );
    }
    col.children.add(Container(
        width: 350,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/image/79.png'),
          fit: BoxFit.fitWidth,
        )),
        child: (((Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(9, 5, 10, 9),
            child: Container(
              width: double.infinity,
              height: 5,
              color: const Color(0xff3D0C01),
            ),
          )
        ]))))));
    return Column(
      children: <Widget>[col],
    );
  }
}
