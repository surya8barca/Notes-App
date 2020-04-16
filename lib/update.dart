import 'package:flutter/material.dart';
import 'package:notes/data.dart';

void main() => runApp(MaterialApp(
  home: UpdateNote(),
)
);

class UpdateNote extends StatefulWidget {

  final Data data;
    UpdateNote({this.data});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<UpdateNote> {

  TextEditingController txt = new TextEditingController();
  String updatednote;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://i.pinimg.com/originals/e7/45/ec/e745ecf11e7b422f308bf3a73915fbe7.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            'Edit Note',
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
                      hintText: 'Press Enter after completing:',                  
                      icon: Icon(Icons.add_comment),
                    ),
                    onSubmitted: (String value) {
                      setState(() {
                        updatednote=value;
                        setState(() {
                        widget.data.note=updatednote;
                      });
                      });
                    },
                  ),
                  SizedBox(height: 25.0,),
              Center(
                  child: ButtonTheme(
                  minWidth: 100,
                  height: 50,
                  buttonColor: Colors.blue,
                  child: RaisedButton(
                  onPressed: (){
                    //addnote();
                    Navigator.pop(context);
                  }, 
                  child: Text(
                    'Done',
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
