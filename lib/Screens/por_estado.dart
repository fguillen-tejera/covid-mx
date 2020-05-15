import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid/my_widgts.dart';
import 'package:google_fonts/google_fonts.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: Firestore.instance.collection('states').snapshots(),
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
        final states = [
          'Aguascalientes',
          'Baja California',
          'Baja California Sur',
          'Campeche',
          'Chiapas',
          'Chihuahua',
          'Ciudad de México',
          'Coahuila',
          'Colima',
          'Durango',
          'Estado de México',
          'Guanajuato',
          'Guerrero',
          'Hidalgo',
          'Jalisco',
          'Michoacán',
          'Morelos',
          'Nayarit',
          'Nuevo León',
          'Oaxaca',
          'Puebla',
          'Querétaro',
          'Quintana Roo',
          'San Luis Potosí',
          'Sinaloa',
          'Sonora',
          'Tabasco',
          'Tamaulipas',
          'Tlaxcala',
          'Veracruz',
          'Yucatán',
          'Zacatecas'
        ];
        final rows = <DataRow>[];
        void createRows() {
          for (var i = 0; i <= 31; i++) {
            rows.add(
              DataRow(cells: [
                DataCell(Text(states[i],
                    style: GoogleFonts.fjallaOne(
                        color: Colors.white, fontSize: width / 24))),
                DataCell(Text(snapshot.data.documents[i]['confirmed'],
                    style: GoogleFonts.fjallaOne(
                        color: Colors.white, fontSize: width / 24))),
                DataCell(Text(
                  snapshot.data.documents[i]['dead'],
                  style: GoogleFonts.fjallaOne(
                      color: Colors.white, fontSize: width / 24),
                )),
              ]),
            );
          }
        }

        createRows();
        return SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: width / 15,
                  ),
                  NumAndTextBig(
                    text: 'Por Estado',
                    width: width,
                    color: Color(0xff21e6c1),
                    num: 'Casos',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                        dataRowHeight: width / 6.5,
                        columnSpacing: 5,
                        columns: [
                          DataColumn(
                            label: Text('Estado',
                                style: GoogleFonts.fjallaOne(
                                    color: Color(0xff21e6c1),
                                    fontSize: width / 22)),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text('Casos',
                                style: GoogleFonts.fjallaOne(
                                    color: Color(0xff21e6c1),
                                    fontSize: width / 22)),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text('Muertos',
                                style: GoogleFonts.fjallaOne(
                                    color: Color(0xff21e6c1),
                                    fontSize: width / 22)),
                            numeric: true,
                          ),
                        ],
                        rows: rows,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width / 12,
                  ),
                  NumAndText(
                    num: snapshot.data.documents[32]['cases24'],
                    text: 'Nuevos casos en las últimas 24 hr.',
                    color: Color(0xff21e6c1),
                    width: width,
                  ),
                  SizedBox(height: width / 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
