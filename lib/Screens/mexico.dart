import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid/my_widgts.dart';

class Mexico extends StatefulWidget {
  @override
  _MexicoState createState() => _MexicoState();
}

class _MexicoState extends State<Mexico> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: Firestore.instance.collection('mexico').snapshots(),
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
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff21e6c1)),
                ),
              ],
            ),
          );

        return SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Text(
                  'México',
                  style: GoogleFonts.fjallaOne(
                      color: Color(0xff21e6c1), fontSize: width / 6),
                ),
                NumAndText(
                  width: width,
                  num: snapshot.data.documents[0]['confirmed'],
                  text: 'Confirmados',
                  color: Colors.white,
                ),
                NumAndText(
                  width: width,
                  num: snapshot.data.documents[0]['dead'],
                  text: 'Muertos',
                  color: Color(0xfffc5185),
                ),
                NumAndText(
                  width: width,
                  num: snapshot.data.documents[0]['recovered'],
                  text: 'Recuperados',
                  color: Color(0xff21e6c1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumAndTextSmall(
                      width: width,
                      num: snapshot.data.documents[0]['deathrate'],
                      text: 'Tasa de mortalidad',
                    ),
                    NumAndTextSmall(
                      width: width,
                      num: snapshot.data.documents[0]['recoveryrate'],
                      text: 'Tasa de recuperación',
                    ),
                  ],
                ),
                SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
