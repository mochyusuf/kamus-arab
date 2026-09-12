import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kamus_arab/Kamus/Ziyadah/ziyadah_1_s.dart';
import 'package:kamus_arab/Kamus/Ziyadah/ziyadah_2_s.dart';
import 'package:kamus_arab/Kamus/Ziyadah/ziyadah_3_s.dart';
import 'package:kamus_arab/Kamus/Ziyadah/ziyadah_4_s.dart';
import 'package:kamus_arab/Model/KeteranganModel.dart';
import 'package:kamus_arab/home.dart';
import 'API.dart';
import 'Kamus/Ziyadah/ziyadah_1.dart';
import 'Kamus/Ziyadah/ziyadah_2.dart';
import 'Kamus/Ziyadah/ziyadah_3.dart';
import 'Kamus/Ziyadah/ziyadah_4.dart';
import 'Kamus/Pencarian/pencarian.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

import 'Singleton.dart';
import 'package:http/http.dart' as http;

class Kamus extends StatelessWidget {
  const Kamus({super.key});

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
  String text = '';

  bool shiftEnabled = false;

  bool isNumericMode = false;
  bool visible_keyboard = false;

  TextEditingController _controllerText = TextEditingController();

  bool visible = true;
  bool error = false, dataloaded = false;
  var data;
  List<KeteranganModel>? _dataKeterangan;
  @override
  void initState() {
    // _customLayoutKeys = CustomLayoutKeys();
    _controllerText = TextEditingController();
    super.initState();
    BackButtonInterceptor.add(myInterceptor1);
    _dataKeterangan?.add(KeteranganModel(id:1,keterangan:''));
    _dataKeterangan?.add(KeteranganModel(id:2,keterangan:''));
    _dataKeterangan?.add(KeteranganModel(id:3,keterangan:''));
    _dataKeterangan?.add(KeteranganModel(id:4,keterangan:''));
    loaddata();
  }
  
  void loaddata() {
    API api = API();
    late final Uri url;
    url = Uri.parse(api.getBASEURLKeterangan());
    Future.delayed(Duration.zero, () async {
      var res = await http.get(url);
      setState(() {
        visible = false;
        print(res.body);
        dataloaded = true;
        List jsonResponse = json.decode(res.body);
        _dataKeterangan = jsonResponse
            .map((keterangan) => KeteranganModel.fromJson(keterangan))
            .toList();
        print(_dataKeterangan?[1]);
      });
    });
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor1);
    super.dispose();
  }

  bool myInterceptor1(bool stopDefaultButtonEvent, RouteInfo info) {
    if (visible_keyboard) {
      _changed(false, "keyboard");
    } else {
      Navigator.of(context, rootNavigator: true).pop(context);
    }
    print("back kamus");
    return true;
  }

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "keyboard") {
        visible_keyboard = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Stack(children: [
          Container(
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Stack(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 350,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage('assets/image/23.png'),
                                      fit: BoxFit.fill,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 10, 20),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/image/21.png'),
                                                  fit: BoxFit.fitHeight,
                                                ))),
                                            onTap: () {
                                              Singleton singleton = Singleton();
                                              singleton.setCari(
                                                  _controllerText.text);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Pencarian()),
                                              );
                                            },
                                          ),
                                          GestureDetector(
                                            child: SizedBox(
                                              width: 260,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 5),
                                                child: TextField(
                                                  decoration:
                                                      const InputDecoration
                                                              .collapsed(
                                                          hintText:
                                                              'اكتب كلمة للبحث'),
                                                  enabled: true,
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                          fontFamily: 'ScheherazadeNew',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24,
                                                      color: Color(0xff8F8A6D)),
                                                  controller: _controllerText,
                                                  onChanged: (text_) {
                                                    setState(() {
                                                      text = text_;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              // visible_keyboard
                                              //     ? null
                                              //     : _changed(true, "keyboard");
                                              // visible_keyboard = true;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            height: 85,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  'KAMUS ARAB INDONESIA AL-’AFAF',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff3D0C01)),
                                ),
                              ),
                            ),
                          ),
                        ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Stack(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(255, 245, 191, 1),
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
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 30, 10, 20),
                                        child: 
                                          Stack(
                                            children: [
                                              Visibility(
                                                visible: visible,
                                                child: 
                                                SizedBox(
                                                  height: 50.0,
                                                  width: 300.0,
                                                  child: 
                                                    CircularProgressIndicator(color: Colors.blue,)
                                                ,),
                                              ),
                                              Visibility(
                                                visible: !visible,
                                                child: 
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
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
                                                            SizedBox(
                                                              width: 215,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                        0, 10, 10, 0),
                                                                child: Text(
                                                                  "${_dataKeterangan?[0].keterangan} ",
                                                                  textAlign:
                                                                      TextAlign.end,
                                                                  style: TextStyle(
                          fontFamily: 'ScheherazadeNew',
                                                                      fontSize: 32,
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                      color:
                                                                          Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(10, 20, 0, 0),
                                                              child: Container(
                                                                width: 15,
                                                                height: 15,
                                                                color: const Color(
                                                                    0xff3D0C01),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: () {
                                                          Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const Ziyadah_1_S()),
                                                          );
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
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
                                                            SizedBox(
                                                              width: 215,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                        0, 10, 10, 0),
                                                                child: Text(
                                                                  "${_dataKeterangan?[1].keterangan} ",
                                                                  textAlign:
                                                                      TextAlign.end,
                                                                  style: TextStyle(
                          fontFamily: 'ScheherazadeNew',
                                                                      fontSize: 32,
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                      color:
                                                                          Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(10, 20, 0, 0),
                                                              child: Container(
                                                                width: 15,
                                                                height: 15,
                                                                color: const Color(
                                                                    0xff3D0C01),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: () {
                                                          Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const Ziyadah_2_S()),
                                                          );
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
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
                                                            SizedBox(
                                                              width: 215,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                        0, 10, 10, 0),
                                                                child: Text(
                                                                  "${_dataKeterangan?[2].keterangan} ",
                                                                  textAlign:
                                                                      TextAlign.end,
                                                                  style: TextStyle(
                          fontFamily: 'ScheherazadeNew',
                                                                      fontSize: 32,
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                      color:
                                                                          Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(10, 20, 0, 0),
                                                              child: Container(
                                                                width: 15,
                                                                height: 15,
                                                                color: const Color(
                                                                    0xff3D0C01),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: () {
                                                          Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const Ziyadah_3_S()),
                                                          );
                                                        },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
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
                                                            SizedBox(
                                                              width: 215,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets.fromLTRB(
                                                                        0, 10, 10, 0),
                                                                child: Text(
                                                                  "${_dataKeterangan?[3].keterangan} ",
                                                                  textAlign:
                                                                      TextAlign.end,
                                                                  style: TextStyle(
                          fontFamily: 'ScheherazadeNew',
                                                                      fontSize: 32,
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                      color:
                                                                          Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(10, 20, 0, 0),
                                                              child: Container(
                                                                width: 15,
                                                                height: 15,
                                                                color: const Color(
                                                                    0xff3D0C01),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        onTap: () {
                                                          Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const Ziyadah_4_S()),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          Center(
                            child: Container(
                              height: 100,
                              width: 300,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/image/25.png'),
                                fit: BoxFit.fill,
                              )),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 25),
                                  child: Text(
                                    'قَائِمَةُ اْلأَوْزَانِ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                          fontFamily: 'ScheherazadeNew',
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          height: 20 / 1.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/image/140.png'),
                            fit: BoxFit.fitHeight,
                          )),
                        ))
                  ]))),
          Visibility(
            visible: visible_keyboard,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                // this will be you container
                Container(
                  color: const Color.fromARGB(255, 251, 246, 222),
                  child: VirtualKeyboard(
                      height: 300,
                      textColor: const Color(0xff8F8A6D),
                      textController: _controllerText,
                      //customLayoutKeys: _customLayoutKeys,
                      defaultLayouts: const [
                        VirtualKeyboardDefaultLayouts.Arabic,
                      ],
                      //reverseLayout :true,
                      type: isNumericMode
                          ? VirtualKeyboardType.Numeric
                          : VirtualKeyboardType.Alphanumeric,
                      onKeyPress: _onKeyPress),
                )
              ],
            ),
            // Keyboard is transparent
          ),
        ]));
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (_controllerText.text.isEmpty) return;
          _controllerText.text = _controllerText.text
              .substring(0, _controllerText.text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          _changed(false, "keyboard");
          _controllerText.text = _controllerText.text
              .substring(0, _controllerText.text.length - 1);
          break;
        default:
      }
      // Update the screen
      setState(() {});
    }
  }
}
