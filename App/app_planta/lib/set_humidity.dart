import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetHumidity extends StatefulWidget {
  SetHumidity({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SetHumidityState createState() => _SetHumidityState();
}

class _SetHumidityState extends State<SetHumidity> {
  RangeValues _humidity_soil = RangeValues(20, 70);

  @override
    void initState() {
      super.initState();
      _showMyDialog();
    }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: ListTile(
              title: RangeSlider(
                  values: _humidity_soil,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _humidity_soil = values;
                    });
                  }),
              subtitle: Text(
                'Umidade:',
              ),
              leading: Icon(Icons.invert_colors),
              trailing: Text(
                _humidity_soil.start.toString() +
                    "% - " +
                    _humidity_soil.end.toString() +
                    " %",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Esse APP tá muito feio'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Eu sei que está feio, vou arrumar depois'),
                Text('ok ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
