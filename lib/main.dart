import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:notes/add_note.dart';
import 'package:notes/update.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'data.dart';
import 'view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DataAdapter());
  await Hive.openBox('notes');
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final notesbox = Hive.box('notes');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://images.hdqwalls.com/wallpapers/feather-pen.jpg'),
        fit: BoxFit.cover,
      )),
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
        body: Container(
          child: WatchBoxBuilder(
            box: Hive.box('notes'),
            builder: (context, notesbox) {
              if ((notesbox.length == 0)) {
                return Container(
                    height: 560,
                    padding: EdgeInsets.all(15),
                    child: Text(
                        'Empty Database\nPlease Add Some Notes!!\n\n\n\n\n\n\n\nClick on this Button to add new \nNotes -->',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )));
              } else {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: notesbox.length,
                      itemBuilder: (context, index) {
                        final note = notesbox.getAt(index)
                            as Data; //returns the data as our class instance

                        return Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Title: ${note.title}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        )),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        FlatButton.icon(
                                          onPressed: () {
                                            Route route = MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewPage(index: index));
                                            Navigator.push(context, route);
                                          },
                                          label: Text('View',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white,
                                          ),
                                        ),
                                        FlatButton.icon(
                                          onPressed: () {
                                            Route route = MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateNote(index: index));
                                            Navigator.push(context, route);
                                          },
                                          label: Text('Edit ',
                                              style: TextStyle(
                                                  color: Colors.green)),
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                          ),
                                        ),
                                        FlatButton.icon(
                                          onPressed: () {
                                            Alert(
                                              context: context,
                                              style: AlertStyle(
                                                backgroundColor:
                                                    Colors.transparent,
                                                titleStyle: TextStyle(
                                                    color: Colors.white),
                                                descStyle: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              title: "Delete",
                                              desc:
                                                  "Are you sure you want to delete this note?",
                                              buttons: [],
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    ButtonTheme(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      buttonColor: Colors.white,
                                                      child: RaisedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'No',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    ButtonTheme(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      buttonColor: Colors.white,
                                                      child: RaisedButton(
                                                        onPressed: () {
                                                          notesbox
                                                              .deleteAt(index);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ).show();
                                          },
                                          label: Text('Delete',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(height: 5),
                          ],
                        );
                      }),
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => AddNote());
            Navigator.push(context, route);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('notes').compact();
    Hive.close();
    super.dispose();
  }
}
