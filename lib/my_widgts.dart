import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumAndText extends StatelessWidget {
  NumAndText({this.width, this.num, this.text, this.color});

  final double width;
  final String num;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          num,
          textAlign: TextAlign.center,
          style: GoogleFonts.fjallaOne(color: color, fontSize: width / 9),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style:
              GoogleFonts.fjallaOne(color: Colors.white, fontSize: width / 18),
        ),
      ],
    );
  }
}

class NumAndTextBig extends StatelessWidget {
  NumAndTextBig({this.width, this.num, this.text, this.color});

  final double width;
  final String num;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          num,
          textAlign: TextAlign.center,
          style: GoogleFonts.fjallaOne(color: color, fontSize: width / 8),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style:
              GoogleFonts.fjallaOne(color: Colors.white, fontSize: width / 13),
        ),
      ],
    );
  }
}

class NumAndTextSmall extends StatelessWidget {
  NumAndTextSmall({this.width, this.num, this.text});
  final double width;
  final String num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          num,
          textAlign: TextAlign.center,
          style:
              GoogleFonts.fjallaOne(color: Colors.white, fontSize: width / 15),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style:
              GoogleFonts.fjallaOne(color: Colors.white, fontSize: width / 25),
        ),
      ],
    );
  }
}

Future<bool> showAlert(context, width) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: width * 1.8,
            width: width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xff071e3d),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: width / 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Color(0xff21e6c1)),
                        ),
                        Center(
                          child: Icon(
                            Icons.error,
                            color: Color(0xff071e3d),
                            size: width / 5,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Aviso',
                        style: GoogleFonts.fjallaOne(
                          fontSize: width / 10,
                          color: Color(0xff21e6c1),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: Text(
                    'Los datos proporcionados provienen del Gobierno de México. El objetivo de la app es informar de forma ágil e inmediata a los mexicanos sobre la situación del Coronavirus en el país. Los datos se actualizan diariamente por la noche.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fjallaOne(
                      fontSize: width / 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(),
                FlatButton(
                    child: Center(
                      child: Text(
                        'Continuar',
                        style: GoogleFonts.fjallaOne(
                            fontSize: width / 12, color: Color(0xff21e6c1)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.transparent),
                SizedBox(),
              ],
            ),
          ),
        );
      });
}
