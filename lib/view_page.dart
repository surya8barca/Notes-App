import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(MaterialApp(
  home: ViewPage()
)
);

class ViewPage extends StatefulWidget {
final Data note;
ViewPage({this.note});


  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://5.imimg.com/data5/PX/IX/MY-38990110/post-it-sticky-notes-500x500.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Note',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
        body: Container(
          width: 360,
          height: 560,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                          'Title: ${this.widget.note.title}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                  ),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                          'Note: ${this.widget.note.note}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}