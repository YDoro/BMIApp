import 'dart:io' show Platform;
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:imc/language/pt/blocs/imc.bloc.dart' as pt;
import 'package:imc/language/en/blocs/imc.bloc.dart' as en;

class ImcBloc {
  var currentLang;

  var heightCtrl = new MaskedTextController(mask: '000');
  var weightCtrl = new MaskedTextController(mask: '000');
  static Map imcbloc = Platform.localeName == 'pt_BR' ? pt.imcbloc : en.imcbloc;
  var result = imcbloc['initialResult'];
  calculate() {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      result = "${imcbloc['firstResult']} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 18.6 && imc < 24.9) {
      result = "${imcbloc['secondResult']} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 24.9 && imc < 29.9) {
      result = "${imcbloc['thirdResult']} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 29.9 && imc < 34.9) {
      result = "${imcbloc['fourthResult']} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 34.9 && imc <= 39.9) {
      result = "${imcbloc['fifthResult']} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 40) {
      result = "${imcbloc['sixthResult']} ${imc.toStringAsPrecision(2)}";
    }
  }
}
