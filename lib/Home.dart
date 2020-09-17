import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textAlcool = new TextEditingController();
  TextEditingController _textGasolina = new TextEditingController();
  String _resultado = '';

  void _calcular() {
    double alcool = double.tryParse(_textAlcool.text.replaceAll(',', '.'));
    double gasolina = double.tryParse(_textGasolina.text.replaceAll(',', '.'));
    _resultado = 'Melhor abastecer com ';
    if ((alcool / gasolina) > 0.7) {
      setState(() {
        _resultado += ' gasolina';
      });
    } else {
      setState(() {
        _resultado += ' alcool';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Álcool ou Gasolina'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                Text(
                  'Saiba qual a melhor opção para abastaecimendo do seu carro',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                TextField(
                  decoration:
                      InputDecoration(labelText: 'Preço Alcool, ex: 1.59'),
                  controller: _textAlcool,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration:
                      InputDecoration(labelText: 'Preço Gasolina, ex: 3.15'),
                  controller: _textGasolina,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FlatButton(
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.lightBlue,
                    onPressed: () => _calcular(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    _resultado,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
