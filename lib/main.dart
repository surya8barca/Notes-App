import 'package:flutter/material.dart';
import 'package:notes/add_note.dart';
import 'package:notes/update.dart';
import 'data.dart';
import 'card_widget.dart';
import 'view_page.dart';

void main() => runApp(MaterialApp(
  home: Home(),
)
);

  class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Data> datas =[];
    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.hdqwalls.com/wallpapers/feather-pen.jpg'),
          fit: BoxFit.cover,
        )
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            centerTitle: true,
            title: Center(
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
    body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: datas.map((data) => CardWidget(
                data: data,
                delete: (){
                  setState(() {
                    datas.remove(data);
                  }
                  );
                },
                view: (){
                  Route route = MaterialPageRoute(builder: (context) => ViewPage(note: data.note));
                    Navigator.push(context, route);
              },
              update:(){
                Route route = MaterialPageRoute(builder: (context) => UpdateNote(data : data));
                    Navigator.push(context, route);
              }
              )).toList(),
            ),
    ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => AddNote(data: datas));
                  Navigator.push(context, route);
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.blueGrey,
          ),
        ),
      );
  }
}
