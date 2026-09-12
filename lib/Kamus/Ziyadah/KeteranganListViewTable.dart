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

class KeteranganListViewTable extends StatelessWidget {
  late BuildContext context1;
  String id_keterangan;
  String urutan;

  KeteranganListViewTable({required this.id_keterangan, required this.urutan});

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
    keteranganListAPIUrl = Uri.parse(api.getBASEURLKeteranganDetailUrutan(
      this.id_keterangan,
      this.urutan
    ));
    final response = await http.get(keteranganListAPIUrl);
    // print(keteranganListAPIUrl);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((keterangan) => KeteranganDetailModel.fromJson(keterangan)).toList();
    } else {
      throw Exception('Failed to load keterangan from API');
    }
  }

  Table _keteranganListView(data) {
    String current_judul = '';
    List<String> judul = [];
    List<int> id_judul = [];
    List<String> isi_1 = [];
    List<int> id_judul_1 = [];
    for (var i = (data.length - 1); i >= 0; i--) {
      if(current_judul != data[i].judul){
        judul.add(data[i].judul);
        id_judul.add(data[i].id_judul);
        current_judul = data[i].judul;
      }
      isi_1.add(data[i].isi);
      id_judul_1.add(data[i].id_judul);
    }

    List<List<String>> isi = [[]]; 

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
          // + " - " + 
          // now_row_isi!.toString());
        }
        if(id_judul_1[i] == id_judul[j]){
          now_row_isi++;
          total_row_isi++;
        }
      }
    }
    
    Table table = Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border : TableBorder(
        verticalInside: BorderSide(
          width: 5, color: const Color(0xff8F8A6D), style: BorderStyle.solid
        )
      ),
      children: []
    );
    TableRow tableRow = TableRow(
      children: []
    );
    table.children.add(tableRow);

    for (var i = 0; i < judul.length; i++) {
      BorderRadius borderRadius = BorderRadius.all(Radius.circular(10));
      if(judul.length == 1){
        borderRadius = BorderRadius.all(Radius.circular(10));
      }else{
        if(i == 0){
          borderRadius = BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          );
        }else if(i == (judul.length - 1)){
          borderRadius = BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          );
        }
      }
      tableRow.children?.add(
        
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 245, 191, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child : Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child : Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(61, 12, 1, 1),
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  spreadRadius: 5,
                  blurRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  judul[i],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'ScheherazadeNew',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  ),
                ),
              ),
            )
          )
        )
      );
    }
    for (var j = 0; j < total_row_isi; j++) {
      
      TableRow tableRow_isi = TableRow(children: []);
      table.children.add(tableRow_isi);
      
      for (var i = 0; i < id_judul.length; i++) {
        String? text_temp = '';
        bool show_border = false;
        for (var k = 0; k < _keteranganBarisModel1.length; k++) {
          if(
              _keteranganBarisModel1[k].id_judul == id_judul[i] &&
              _keteranganBarisModel1[k].baris == (total_row_isi - (j+1))
            ){
            // print(_keteranganBarisModel1[k].id_judul.toString() 
            // + " - " + 
            // _keteranganBarisModel1[k].baris.toString());
            text_temp = _keteranganBarisModel1[k].isi;
          }
        }
        if(text_temp != ''){
          show_border = true;
          BorderRadius borderRadius_isi = BorderRadius.zero;
          BoxShadow boxShadow = BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 5),
          );
          if(judul.length == 1){
            if((_keteranganBarisModel1.length/judul.length) == 1){
            }else{
            }
          }else{
            if(i == 0){
            }else if(i == (judul.length - 1)){
            }
          }
          tableRow_isi.children?.add(
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 245, 191, 1),
                borderRadius: borderRadius_isi,
                boxShadow: [boxShadow],
              ),
              child : Padding(
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
            ))
          );
        }
        if(j < (total_row_isi - 1) && show_border){
          table.children?.add(
            TableRow(
              children: [
              Container(
                width: double.infinity,
                height: 5,
                color: const Color(0xff8F8A6D),
              )]
            ),
          );
        }
      }
    }

    return table;
  }
}
