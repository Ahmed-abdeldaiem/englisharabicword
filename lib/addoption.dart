import 'package:flutter/material.dart';

//import 'mainscreen.dart';

class AddOption extends StatefulWidget {
  final Function(String engword, String arabword) addWord;
  const AddOption(this.addWord, {Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AddOption> {
  var _engcontroler = TextEditingController();
  var _arabcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _engcontroler,
                decoration: InputDecoration(labelText: 'English Word'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _arabcontroler,
                decoration: InputDecoration(labelText: 'Arabic Word'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.addWord(_engcontroler.text, _arabcontroler.text);
                },
                child: Text('Add English and its Arabic Word'),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
