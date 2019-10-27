import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Editor(
            label: 'Número da conta',
            hint: '0000',
            controlador: _controllerCampoNumeroConta,
          ),
          Editor(
            label: 'Valor',
            hint: '0.00',
            icone: Icons.monetization_on,
            controlador: _controllerCampoValor,
          ),
          RaisedButton(
            onPressed: () {
              final int numeroConta =
                  int.tryParse(_controllerCampoNumeroConta.text);
              final double valor = double.tryParse(_controllerCampoValor.text);

              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);

                debugPrint('$transferenciaCriada');
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  String label;
  String hint;
  IconData icone;
  TextEditingController controlador;

  Editor({this.label, this.hint, this.icone, this.controlador});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: this.controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: this.label,
          hintText: this.hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(new Transferencia(100, 1000)),
          ItemTransferencia(new Transferencia(200, 1000)),
          ItemTransferencia(new Transferencia(300, 2000)),
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
