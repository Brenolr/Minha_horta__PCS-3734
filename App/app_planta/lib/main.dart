import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Minha Horta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _valorAtual = 20;
  RangeValues _temperaturas = RangeValues(15, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: ListTile(
                title: CupertinoSlider(
                    value: _valorAtual,
                    min: 0,
                    max: 100,
                    divisions: 1000,
                    onChanged: (double value) {
                      setState(() {
                        _valorAtual = value;
                      });
                    }),
                subtitle: Text(
                  'Umidade:',
                ),
                leading: Icon(Icons.invert_colors),
                trailing: Text(
                  _valorAtual.toStringAsPrecision(3) + " %",
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: RangeSlider(
                  min: 0,
                  max: 50,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _temperaturas = values;
                    });
                  },
                  values: _temperaturas,
                ),
                subtitle: Text(
                  'Temperatura:',
                ),
                leading: Icon(Icons.wb_sunny),
                trailing: Text(
                  _temperaturas.start.toStringAsPrecision(3) +
                      "ºC - ºC" +
                      _temperaturas.end.toStringAsPrecision(3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
