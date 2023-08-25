import 'package:flutter/material.dart';

class AppTheme{

  static const inputPading = EdgeInsets.fromLTRB(20, 30, 20, 0);
  static const selectPading = EdgeInsets.fromLTRB(35, 30, 35, 0);

  static const textStyle = TextStyle(
                color: Color.fromRGBO(0, 26, 78, 1),
                fontWeight: FontWeight.bold);


  static const bordeInicial = BorderSide(color: Color.fromRGBO(248, 249, 250, 1));
  static const bordeSelecionado = BorderSide(color: Color.fromRGBO(0, 26, 78, 1));
  static const bordeError = BorderSide(color: Colors.red);
  


}

//   static const Color primary = Color.fromARGB(255, 16, 0, 85);
//   static const Color secundary = Color.fromARGB(255, 0, 12, 66);
//   static final ThemeData darkTheme = ThemeData.light().copyWith(
//     primaryColor: Colors.greenAccent,
//     appBarTheme: const AppBarTheme(
//       color: primary,
//       elevation: 10,
//     ),
//   textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  
//   inputDecorationTheme: const InputDecorationTheme(
//     labelStyle: TextStyle(color: Color.fromARGB(255, 62, 47, 145)),
//     floatingLabelStyle: TextStyle(
//       color: primary),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: primary),
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
//         topRight: Radius.circular(200))
        
//       )
//     )
//   );
// }