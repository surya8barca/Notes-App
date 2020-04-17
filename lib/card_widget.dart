import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    Key key,
    @required this.delete,this.view,this.update,
  }) : super(key: key);
  
  
  
  final Function update;
  final Function delete;
  final Function view;

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final notebox=Hive.box('notes');
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Column(
        children: <Widget>[
          Text(
            notebox.getAt(0),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton.icon(
                onPressed: widget.view,
                label: Text(
                  'View Note',
                  style: TextStyle(color: Colors.red)
                ),
                icon: Icon(Icons.remove_red_eye),
              ),
              FlatButton.icon(
                onPressed: widget.update,
                label: Text(
                  'Edit Note',
                  style: TextStyle(color: Colors.red)
                ),
                icon: Icon(Icons.edit),
              ),
              FlatButton.icon(
                onPressed: widget.delete,
                label: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red)
                ),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
