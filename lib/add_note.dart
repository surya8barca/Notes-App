import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MaterialApp(
      home: AddNote(),
    ));

class AddNote extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AddNote> {
  final notesbox = Hive.box('notes');
  String note;
  String title;
  TextEditingController txt = new TextEditingController();
  TextEditingController txt2 = new TextEditingController();

  isempty() {
    if ((title == null) || (note == null) || (title == "") || (note == ""))
      return true;
    else
      return false;
  }

  getnote() {
    return Data(title, note);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://i.pinimg.com/originals/e7/45/ec/e745ecf11e7b422f308bf3a73915fbe7.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'New Note',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    TextField(
                      controller: txt2,
                      decoration: InputDecoration(
                        hintText: 'Enter title:',
                        icon: Icon(Icons.add_comment),
                      ),
                      onSubmitted: (String value) {
                        setState(() {
                          title = value;
                        });
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      controller: txt,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Enter note:',
                        icon: Icon(Icons.add_comment),
                      ),
                      onSubmitted: (String value) {
                        setState(() {
                          note = value;
                        });
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: ButtonTheme(
                        minWidth: 100,
                        height: 50,
                        buttonColor: Colors.blue,
                        child: RaisedButton(
                          onPressed: () {
                            if (isempty()) {
                              Alert(
                                  context: context,
                                  title: 'Empty Field',
                                  desc: "Fields can't be Empty",
                                  buttons: []).show();
                            } else {
                              Data newnote = getnote();
                              notesbox.add(newnote);
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
