import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
    @required this.data,this.delete,this.view,this.update,
  }) : super(key: key);

  final  data;
  final Function update;
  final Function delete;
  final Function view;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Column(
        children: <Widget>[
          Text(
            data.title,
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
                onPressed: view,
                label: Text(
                  'View Note',
                  style: TextStyle(color: Colors.red)
                ),
                icon: Icon(Icons.remove_red_eye),
              ),
              FlatButton.icon(
                onPressed: update,
                label: Text(
                  'Edit Note',
                  style: TextStyle(color: Colors.red)
                ),
                icon: Icon(Icons.edit),
              ),
              FlatButton.icon(
                onPressed: delete,
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
