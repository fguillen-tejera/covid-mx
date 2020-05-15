import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:covid/my_widgts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: Firestore.instance.collection('clock').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Column(
                children: <Widget>[
                  NumAndText(
                    text: 'Cargando Datos...',
                    color: Colors.white,
                    num: '',
                    width: width,
                  ),
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xff21e6c1)),
                  ),
                ],
              ),
            );

          var estimateTs = DateTime.utc(
            2020,
            snapshot.data.documents[0]['month'] ?? 10,
            snapshot.data.documents[0]['day'] ?? 10,
            snapshot.data.documents[0]['hour'] ?? 10,
          ).millisecondsSinceEpoch;

          final date = snapshot.data.documents[0]['date'] ?? '30 de abril';
          return StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1), (i) => i),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                DateFormat format1 = DateFormat("HH");
                DateFormat format2 = DateFormat("mm");

                int now = DateTime.now().millisecondsSinceEpoch;
                Duration remaining = Duration(milliseconds: estimateTs - now);
                var dateString1 = '${remaining.inDays}';
                var dateString2 =
                    '${format1.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                var dateString3 =
                    '${format2.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';

                return SafeArea(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(),
                          NumAndTextBig(
                            num: 'Cuenta',
                            text: 'Regresiva',
                            width: width,
                            color: Color(0xff21e6c1),
                          ),
                          SizedBox(
                            height: width / 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              NumAndText(
                                num: dateString1,
                                text: 'Días',
                                color: Color(0xff21e6c1),
                                width: width,
                              ),
                              NumAndText(
                                num: dateString2,
                                text: 'Horas',
                                color: Color(0xff21e6c1),
                                width: width,
                              ),
                              NumAndText(
                                num: dateString3,
                                text: 'Minutos',
                                color: Color(0xff21e6c1),
                                width: width,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: width / 8,
                          ),
                          Text(
                            'Para terminar la cuarentena el $date*',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.fjallaOne(
                                color: Colors.white, fontSize: width / 15),
                          ),
                          SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: Text(
                              '*Fecha sujeta a cambios',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.fjallaOne(
                                  color: Colors.blueGrey, fontSize: width / 20),
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
