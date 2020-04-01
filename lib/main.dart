import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> iconList = [];
  QAbank quest = QAbank();

  void reset(){
    setState(() {
      iconList.clear();
      quest.reset();
    });

  }

  void showAlert(){
    Alert(
      context: context,
      type: AlertType.error,
      title: "Finished",
      desc: "You answered all the questions.",
      buttons: [
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            reset();
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

  bool checkEnd(){
    return quest.ifEnd();
  }

  void checkAnswer(bool bInput){

    if(checkEnd() == false) {
      if (bInput == quest.getAnswer()) {
        setState(() {
          iconList.add(
              Icon(
                Icons.check,
                color: Colors.green,
              )
          );
        });
      }
      else {
        setState(() {
          iconList.add(
              Icon(
                Icons.close,
                color: Colors.red,
              )
          );
        });
      }
    }

    if(checkEnd()){
      showAlert();
    }

  }

  String getQuestion(){
    String question = quest.getQuestion();
    return question;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  getQuestion(),
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5.0, 10.0, 5.0),
                child: FlatButton(
                  color: Colors.green,
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(true);
                  },
                ),
              ),
            ),
            Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5.0, 10.0, 5.0),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: iconList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
