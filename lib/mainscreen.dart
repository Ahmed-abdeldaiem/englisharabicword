import 'package:englishwordtask/Words.dart';
import 'package:flutter/material.dart';

import 'Words.dart';

import 'addoption.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Words> wordlist = [
    Words('Car', 'ٍسيارة'),
    Words('ship', 'سفينة'),
    Words('word', 'كلمة')
  ];

  void removeWord(String engword) =>
      wordlist.removeWhere((element) => element.engword == engword);

  void addWord(String engword, String arabword) {
    setState(() {
      wordlist.add(Words(engword, arabword));
    });
  }

  void addoption() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddOption(addWord);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English and Arabic Words'),
        backgroundColor: Colors.red,
      ),
      body: wordlist.length == 0
          ? Center(child: Image.asset('asset/empty.jpg'))
          : ListView.builder(
              itemCount: wordlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${wordlist[index].engword}'),
                  subtitle: Text('${wordlist[index].arabword}'),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        removeWord(wordlist[index].engword);
                      });
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.indigo,
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: addoption,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
