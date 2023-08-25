import 'package:cotizacion/theme/theme.dart';
import 'package:flutter/material.dart';

import '../models/producto.dart';

class InputSelectProduct extends StatelessWidget {
  final String titulo;

  List<Producto> productosLista = [
    Producto("LECHE", 5000,
        "https://th.bing.com/th/id/R.a23a4ac8c76241a806d0bdd9341ab328?rik=t3g6dYMME5fVSw&pid=ImgRaw&r=0"),
    Producto("AGUA", 3000,
        "https://th.bing.com/th/id/R.63c4ce942e24ac41a82ad6f3c75c7d35?rik=fMNU2P%2ftpNufJw&pid=ImgRaw&r=0")
  ];

  TextEditingController precioUnitario = TextEditingController();

  InputSelectProduct({Key? key, required this.titulo}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.selectPading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: AppTheme.textStyle),
          DropdownButton<Producto>(
            isExpanded: true,
            value: null, // Valor inicialmente no seleccionado
            hint: const Text("Seleccione una opción"), // Agregamos un hint
            items: productosLista.map((producto) {
              return DropdownMenuItem<Producto>(
                value: producto,
                child: Text("${producto.nombreProducto} VALOR: ${producto.precioUnitario}"),
              );
            }).toList(),
            onChanged: (producto) {
              precioUnitario.text = producto!.precioUnitario.toString();
            
              print("Valor: ${precioUnitario.text} ");
            },
          ),
        ],
      ),
    );
  }
}
