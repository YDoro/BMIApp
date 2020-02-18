import 'package:flutter/cupertino.dart';
import 'package:imc/blocs/imc.bloc.dart';
import 'package:imc/language/pt/ui/pages/home.page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();
  final home = new Home();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(home.title),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: home.height_input_label,
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoTextField(
              placeholder: home.weight_input_label,
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              bloc.result,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoButton.filled(
              child: Text(Home().button_calculate),
              onPressed: () {
                setState(() {
                  bloc.calculate();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
