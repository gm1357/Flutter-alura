import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _title = 'Criando Transferência';
const _labelConta = 'Número da conta';
const _labelValor = 'Valor';
const _hintConta = '0000';
const _hintValor = '0.00';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              label: _labelConta,
              hint: _hintConta,
              controlador: _controllerCampoNumeroConta,
            ),
            Editor(
              label: _labelValor,
              hint: _hintValor,
              icone: Icons.monetization_on,
              controlador: _controllerCampoValor,
            ),
            RaisedButton(
              onPressed: () => adicionaTranferencia(context),
              child: Text(_botaoConfirmar),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_title),
      ),
    );
  }

  void adicionaTranferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
