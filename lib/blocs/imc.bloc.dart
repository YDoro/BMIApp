import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:imc/language/pt/blocs/imc.bloc.dart';

class ImcBloc {
  var currentLang;
  ImcBloc(String lang) {
    switch (lang) {
      case "pt":
        currentLang = new ImcBlocPt();
        break;
    }
  }
  var heightCtrl = new MaskedTextController(mask: '000');
  var weightCtrl = new MaskedTextController(mask: '000');
  //TODO -  a interface for each file that contains texts like language/interfaces/blocs/imc.bloc.dart
  var result = ImcBlocPt().initialResult;
  calculate() {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      result = "${ImcBlocPt().firstResult} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 18.6 && imc < 24.9) {
      result = "${ImcBlocPt().secondResult} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 24.9 && imc < 29.9) {
      result = "${ImcBlocPt().thirdResult} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 29.9 && imc < 34.9) {
      result = "${ImcBlocPt().fourthResult} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 34.9 && imc <= 39.9) {
      result = "${ImcBlocPt().fifthResult} ${imc.toStringAsPrecision(2)}";
    } else if (imc >= 40) {
      result = "${ImcBlocPt().sixthResult} ${imc.toStringAsPrecision(2)}";
    }
  }
}
