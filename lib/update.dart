import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/data.dart';

void main() => runApp(MaterialApp(
      home: UpdateNote(),
    ));

class UpdateNote extends StatefulWidget {
  final int index;
  UpdateNote({this.index});

  get notesbox => null;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<UpdateNote> {
  final notesbox = Hive.box('notes');
  String newnote;
  TextEditingController txt = new TextEditingController();

  getclass(title, note) {
    Data update = new Data(title, note);
    return update;
  }

  @override
  Widget build(BuildContext context) {
    final note = notesbox.getAt(widget.index) as Data;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/form.jpg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            'Edit: ${note.title}',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          color: Colors.transparent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: txt,
                    decoration: InputDecoration(
                      hintText: note.note,
                      icon: Icon(Icons.add_comment),
                    ),
                    onSubmitted: (String value) {
                      if (value != note.note) {
                        setState(() {
                          newnote = value;
                        });
                      }
                      FocusScope.of(context).nextFocus();
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
                          if (newnote == null) newnote = note.note;
                          Data update = getclass(note.title, newnote);
                          setState(() {
                            notesbox.putAt(widget.index, update);
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Update',
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
    );
  }
}
