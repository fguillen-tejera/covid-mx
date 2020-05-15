import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(),
            Center(
                child: Text(
              'Covid-19',
              style: GoogleFonts.fjallaOne(
                  color: Color(0xff21e6c1), fontSize: width / 8),
            )),
            Text(
              'Prevención',
              style: GoogleFonts.fjallaOne(
                  color: Color(0xff21e6c1), fontSize: width / 13),
            ),
            Bullet(
              width: width,
              text: 'Quédese en casa',
            ),
            Bullet(
              width: width,
              text: 'Lave sus manos',
            ),
            Bullet(
              width: width,
              text: 'Cúbrase al toser',
            ),
            Text(
              'Síntomas',
              style: GoogleFonts.fjallaOne(
                  color: Color(0xff21e6c1), fontSize: width / 13),
            ),
            Bullet(
              width: width,
              text: 'Fiebre',
            ),
            Bullet(
              width: width,
              text: 'Dolor de garganta y tos',
            ),
            Bullet(
              width: width,
              text: 'Dificultad para respirar',
            ),
            SizedBox(),
            Center(
              child: Text(
                'Para más información visite www.coronavirus.gob.mx',
                textAlign: TextAlign.center,
                style: GoogleFonts.fjallaOne(
                    color: Colors.white, fontSize: width / 24),
              ),
            ),
            SizedBox(
              height: width / 18,
            ),
          ],
        ),
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  Bullet({this.text, this.width});
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        MaterialIcons.keyboard_arrow_right,
        size: width / 10,
        color: Color(0xff21e6c1),
      ),
      title: Text(
        text,
        style: GoogleFonts.fjallaOne(color: Colors.white, fontSize: width / 18),
      ),
    );
  }
}
