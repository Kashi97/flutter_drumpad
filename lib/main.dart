import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drumpad',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Drumpad'),
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

  static AudioCache player1 = new AudioCache();
  static AudioCache player2 = new AudioCache();
  static AudioCache player3 = new AudioCache();
  static AudioCache player4 = new AudioCache();
  static AudioCache player5 = new AudioCache();
  static AudioCache player6 = new AudioCache();
  static AudioCache player7 = new AudioCache();
  static AudioCache player8 = new AudioCache();
  static AudioCache player9 = new AudioCache();


  static List<String> pack1 = ['_ Kick1.mp3', "_ Hat1.mp3", "_ Snare1.mp3", "_ lead11.mp3", "_ lead12.mp3", "_ lead13.mp3", "_ chord11.mp3", "_ chord12.mp3", "_ chord13.mp3"];
  static List<String> pack2 = ['_ Kick2.mp3', "_ Hat2.mp3", "_ Snare2.mp3", "_ lead21.mp3", "_ lead22.mp3", "_ lead23.mp3", "_ chord21.mp3", "_ chord22.mp3", "_ chord23.mp3"];

  List<String> packInUse = pack1;

  void setPack(int nr){
    if (nr == 1){
      packInUse = pack1;
    }
    if (nr == 2){
      packInUse = pack2;
    }
  }

  GestureDetector help(String text, int packNr){
    return new GestureDetector(
      onTap: () {
        setPack(packNr);
        _showDialog("Drumkit has been changed", "Drumkit has been changed to drumkit " + packNr.toString());
      },
      child: new Card(child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text(text),
          )
        ],
      ),),
    );
  }

  void _settings() {

    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Choose drumkit:'),
            ),
            body: new ListView(children: [help("Drumkit 1", 1), help("Drumkit 2", 2)]),
          );
        },
      ),
    );

  }

  void _showDialog(String title, String textBody) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(textBody),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    var phoneHeight = queryData.size.height;
    var phoneWidth = queryData.size.width;

    double verticalPad = phoneHeight/100;
    double boxSize = phoneWidth/3;

    var topHeight = phoneHeight/10;

    String text;
    if (packInUse == null){
      text = "Please select drumpack ->";
    }

    if (packInUse == pack1){
      text = "Drumkit 1";
    }

    if (packInUse == pack2){
      text = "Drumkit 2";
    }


    return Scaffold(
        appBar: new AppBar(
            title: new Text(text),
            actions: <Widget>[
              new IconButton(icon: const Icon(Icons.settings), onPressed: _settings),
            ]
        ),
        body: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/bag.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: topHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player7.play(packInUse[6]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/padButton.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player8.play(packInUse[7]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/padButton.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player9.play(packInUse[8]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/padButton.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                  ],
                ),

                SizedBox(height: verticalPad),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player4.play(packInUse[3]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/drum2Button.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player5.play(packInUse[4]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/drum2Button.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player6.play(packInUse[5]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/drum2Button.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                  ],
                ),

                SizedBox(height: verticalPad),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player1.play(packInUse[0]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/drumButton.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player2.play(packInUse[1]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/drumButton.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTapDown: (tapDownDetails) {player3.play(packInUse[2]);},
                        child: Container(
                          height: boxSize,
                          width: boxSize,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/drumButton.png"),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }
}
