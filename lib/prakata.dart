import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'API.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:simple_html_css/simple_html_css.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PrakataPage extends StatefulWidget {
  const PrakataPage({Key? key}) : super(key: key);
  @override
  State<PrakataPage> createState() => Prakata();
}

class Prakata extends State<PrakataPage> {
  var prakata;
  bool error = false, dataloaded = false;
  var data;
  List _dataPrakata = [];
  var text_prakata = "";
  bool visible = true;
  
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() {
    API api = API();
    late final Uri url;
    url = Uri.parse(api.getBASEURLPrakata());
    Future.delayed(Duration.zero, () async {
      var res = await http.get(url);
      setState(() {
        visible = false;
        print(res.body);
        data = json.decode(res.body);
        _dataPrakata = data;
        dataloaded = true;
        text_prakata = _dataPrakata[0]['prakata'];
        print(text_prakata);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Builder(
          builder: (context) {
            return Container(
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
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 245, 191, 1),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
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
                                              10, 30, 10, 10),
                                          child: 
                                          Stack(children: [
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
                                              Text(
                                                text_prakata,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(61, 12, 1, 1)
                                                    ),
                                              ),
                                          ],)
                                              // Html(
                                              //   data: text_prakata,
                                              // ),
                                              // RichText(
                                              //   text: HTML.toTextSpan(context, text_prakata),
                                              // ),
                                              // HtmlWidget(
                                              //   text_prakata,
                                              // )

                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30)
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
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 25),
                                      child: Text(
                                        'PRAKATA',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                      ])));
        },
      ),
    );
  }
}
