import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamus_arab/Latihan/LatihanKategori.dart';
import 'package:kamus_arab/API.dart';
import 'package:kamus_arab/Kamus/Pencarian/Kamus.dart';
import 'package:kamus_arab/Kamus.dart' as kamus_scene;
import 'package:kamus_arab/Model/KeteranganDetailModel.dart';
import 'package:kamus_arab/Singleton.dart';

import '../../Model/KeteranganBarisModel.dart';

class KeteranganListView extends StatelessWidget {
  late BuildContext context1;
  @override
  Widget build(BuildContext context) {
    Singleton singleton = Singleton();
    context1 = context;
    return FutureBuilder<List<KeteranganDetailModel>>(
      future: _fetchKeterangan(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<KeteranganDetailModel>? data = snapshot.data;
          return _keteranganListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<KeteranganDetailModel>> _fetchKeterangan() async {
    API api = API();
    late final Uri keteranganListAPIUrl;
    keteranganListAPIUrl = Uri.parse(api.getBASEURLKeteranganDetailUrutan('1','1'));
    final response = await http.get(keteranganListAPIUrl);
    print(keteranganListAPIUrl);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((keterangan) => KeteranganDetailModel.fromJson(keterangan)).toList();
    } else {
      throw Exception('Failed to load keterangan from API');
    }
  }

  Column _keteranganListView(data) {
    Row row = Row(
      children: [],
    );
    Column col = Column(
      children: [],
    );

    String current_judul = '';
    List<String> judul = [];
    List<int> id_judul = [];
    List<String> isi_1 = [];
    List<int> id_judul_1 = [];
    for (var i = (data.length - 1); i >= 0; i--) {
      if(data[i].urutan == '1'){
        if(current_judul != data[i].judul){
          judul.add(data[i].judul);
          id_judul.add(data[i].id_judul);
          current_judul = data[i].judul;
        }
        isi_1.add(data[i].isi);
        id_judul_1.add(data[i].id_judul);
      }
    }
    Column col_isi = Column(
      children: [],
    );
    IntrinsicHeight intrinsicHeight = IntrinsicHeight(
      child: row,
    );
    Stack stack = Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 50),
          child: 
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 245, 191, 1),
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: 
            IntrinsicWidth(
              child: col_isi
            )
          ),
        ),
        IntrinsicWidth(
          child: col,
        )
      ],
    );
    for (var i = 0; i < judul.length; i++) {
      if(i < data.length - 1 && i != 0){
        row.children.add(
          Container(
            width: 5,
            height: double.infinity,
            color: const Color(0xff8F8A6D),
          ),
        );
      }
      row.children.add(
        Container(
          child: 
            Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                judul[i],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'ScheherazadeNew',
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }

    List<List<String>> isi = [[]]; 

    List<IntrinsicHeight> intrinsicHeight_isi = [];
    List<IntrinsicWidth> intrinsicWidth_isi = [];
    List<Row> row_isi = [];

    int total_row_isi = 0;
    int now_row_isi = 0;
    int total_width;

    List<KeteranganBarisModel> _keteranganBarisModel1 = [];

    int current_id_judul = -1;
    bool first = true;
    for (var i = 0; i < isi_1.length; i++) {
      for (var j = 0; j < id_judul.length; j++) {
        if(id_judul_1[i] == id_judul[j]){
          if(first){
            current_id_judul = id_judul[j];
          }
          first = false;
          if(current_id_judul != id_judul[j]){
            now_row_isi = 0;
            current_id_judul = id_judul[j];
          }
          _keteranganBarisModel1.add(
            KeteranganBarisModel(
              id_judul:id_judul[j],
              isi:isi_1[i],
              baris:now_row_isi,
            )
          );
          // print(id_judul[j]!.toString() 
          // + " " + 
          // now_row_isi!.toString());
        }
        if(id_judul_1[i] == id_judul[j]){
          now_row_isi++;
          total_row_isi++;
        }
      }
    }
    for (var j = 0; j < total_row_isi; j++) {
      row_isi.add(Row(children: [],));
      bool show_border = false;
      for (var i = 0; i < id_judul.length; i++) {
        if(i != 0){
          row_isi[j].children.add(
            Container(
              width: 5,
              height: double.infinity,
              color: const Color(0xff8F8A6D),
            ),
          );
        }
        String? text_temp = '';
        for (var k = 0; k < _keteranganBarisModel1.length; k++) {
          if(
              _keteranganBarisModel1[k].id_judul == id_judul[i] &&
              _keteranganBarisModel1[k].baris == (total_row_isi - (j+1))
            ){
            print(_keteranganBarisModel1[k].id_judul.toString() 
            + " " + 
            _keteranganBarisModel1[k].baris.toString());
            text_temp = _keteranganBarisModel1[k].isi;
          }
        }
        if(text_temp != ''){
          show_border = true;
          row_isi[j].children.add(
            Spacer()
          );
          row_isi[j].children.add(
            Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      text_temp!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'ScheherazadeNew',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
          ));
          row_isi[j].children.add(
            Spacer()
          );
        }
      }
      intrinsicHeight_isi.add(
        IntrinsicHeight(
          child: 
          row_isi[j],
        )
      );
      col_isi.children.add(
        Container(
          child : intrinsicHeight_isi[j]
        )
      );
      if(j < (total_row_isi - 1) && show_border){
        col_isi.children.add(
          Container(
            width: double.infinity,
            height: 5,
            color: const Color(0xff8F8A6D),
          ),
        );
      }
    }

    col.children.add(
      Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(61, 12, 1, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child : intrinsicHeight
      )
    );
    

    return Column(
      children: <Widget>[
        stack,
      ],
    );
  }
}
