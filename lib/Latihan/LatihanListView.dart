import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamus_arab/Latihan/LatihanKategori.dart';
import 'package:kamus_arab/API.dart';
import 'package:kamus_arab/Latihan/LatihanSoal.dart';
import 'package:kamus_arab/Singleton.dart';

import 'latihan_soal.dart';

class LatihanListView extends StatelessWidget {
  late BuildContext context1;
  @override
  Widget build(BuildContext context) {
    context1 = context;
    return FutureBuilder<List<LatihanKategori>>(
      future: _fetchLatihan(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<LatihanKategori>? data = snapshot.data;
          return _latihanListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<LatihanKategori>> _fetchLatihan() async {
    API api = API();
    final latihanListAPIUrl = Uri.parse(api.getBASEURLLatihan());
    final response = await http.get(latihanListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((latihan) => LatihanKategori.fromJson(latihan))
          .toList();
    } else {
      throw Exception('Failed to load latihan from API');
    }
  }

  Future _fetchLatihanSoal(int id) async {
    API api = API();
    final latihanListAPIUrl = Uri.parse(api.getBASEURLLatihanSoal(id));
    final response = await http.get(latihanListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<LatihanSoal> data =
          jsonResponse.map((latihan) => LatihanSoal.fromJson(latihan)).toList();
      Singleton singleton = Singleton();
      singleton.setlistSoal(data);
      singleton.setindexSoal(0);
      singleton.setSkor(0);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context1,
        MaterialPageRoute(builder: (context) => const Latihan_Soal()),
      );
    } else {
      throw Exception('Failed to load latihan from API');
    }
  }

  Column _latihanListView(data) {
    for (var i = 0; i < data.length; i++) {}
    return Column(
      children: <Widget>[
        for (var i in data)
          (Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  width: double.infinity,
                  height: 5,
                  color: const Color(0xff8F8A6D),
                ),
              ),
              GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          i.nama,
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
                onTap: () {
                  print("Click");
                  _fetchLatihanSoal(i.id);
                },
              ),
            ],
          )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Container(
            width: double.infinity,
            height: 5,
            color: const Color(0xff8F8A6D),
          ),
        ),
      ],
    );
  }
}
