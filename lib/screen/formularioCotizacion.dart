import 'package:flutter/material.dart';

import '../models/producto.dart';
import '../theme/theme.dart';
import '../widgets/input.dart';
import '../widgets/inputSelect.dart';

void main() => runApp(FormCotizacion());

double total = 0;
double calculatedTotal = 0;

Producto? selectProducto;
List<Producto> productosLista = [
  Producto("LECHE", 5000,
      "https://th.bing.com/th/id/R.a23a4ac8c76241a806d0bdd9341ab328?rik=t3g6dYMME5fVSw&pid=ImgRaw&r=0"),
  Producto("AGUA", 3000,
      "https://th.bing.com/th/id/R.63c4ce942e24ac41a82ad6f3c75c7d35?rik=fMNU2P%2ftpNufJw&pid=ImgRaw&r=0")
];

TextEditingController nombreProducto = TextEditingController();
TextEditingController precioUnitario = TextEditingController();
TextEditingController cantidad = TextEditingController();
TextEditingController linkImagen = TextEditingController();

class FormCotizacion extends StatefulWidget {
  FormCotizacion({super.key});

  @override
  State<FormCotizacion> createState() => _FormCotizacionState();
}

class _FormCotizacionState extends State<FormCotizacion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotizacion',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(248, 249, 250, 1),
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          title: const Text(
            "Cotizacion",
            style: TextStyle(
              color: Color.fromRGBO(0, 26, 78, 1),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: AppTheme.selectPading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Productos", style: AppTheme.textStyle),
                    DropdownButton<Producto>(
                      isExpanded: true,
                      value: null, // Valor inicialmente no seleccionado
                      hint: const Text(
                          "Seleccione una opción"), // Agregamos un hint
                      items: productosLista.map((producto) {
                        return DropdownMenuItem<Producto>(
                          value: producto,
                          child: Text(
                              "${producto.nombreProducto} VALOR: ${producto.precioUnitario}"),
                        );
                      }).toList(),
                      onChanged: (producto) {
                        precioUnitario.text =
                            producto!.precioUnitario.toString();
                        linkImagen.text = producto.imagen.toString();
                        selectProducto = producto;
                        print("Valor: ${precioUnitario.text} ");
                        print("Valor: ${linkImagen.text} ");
                      },
                    ),
                  ],
                ),
              ),

              Input(
                hintText: "Valor unitario",
                labelText: "Valor unitario",
                helperText: "Ingresa solo numeros",
                controlador: precioUnitario,
                initialValue:
                    selectProducto != null && precioUnitario.text.isNotEmpty
                        ? selectProducto!.precioUnitario.toString()
                        : null,
              ),
              Input(
                hintText: "Ingrese la cantidad",
                labelText: "Cantidad",
                helperText: "Ingresa solo numeros",
                controlador: cantidad,
              ),
              Padding(
                padding: AppTheme.selectPading,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(0, 26, 78, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      elevation: 4.0, // Ajusta el valor según tu preferencia
                      minimumSize: const Size(double.infinity,
                          50), // Ancho y alto mínimos del botón
                    ),
                    child: const Text("Calcular valor toal"),
                    onPressed: () {
                      setState(() {
                        double valorUnitario =
                            double.parse(precioUnitario.text);
                        double cantidadProductos = double.parse(cantidad.text);
                        calculatedTotal = valorUnitario * cantidadProductos;
                        total = calculatedTotal;
                      });
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListTile(
                  title: const Text("Total"),
                  titleTextStyle: AppTheme.textStyle,
                  subtitle: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("$total"),
                  ),
                ),
              )
              // Image.network("${selectProducto!.imagen}")
            ],
          ),
        ),
      ),
    );
  }
}
