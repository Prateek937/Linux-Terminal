import 'package:flutter/material.dart';
import 'package:dockerapp/terminal.dart';
import 'package:dockerapp/gui.dart';
import 'vars.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
      initialRoute: 'home',
      routes: {
        "home": (context) => MyHome(),
        "terminal": (context) => Terminal(),
        "gui": (context) => DockerGUI(),
      },
    ),
  );
}

class MyHome extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var deviceheight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: navTop,
        body: Center(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20, bottom: 40)),
            Container(
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://finderding.com/wp-content/uploads/2017/09/penguin-8639_1280.png'),
                    fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: devicewidth * 0.7,
                height: deviceheight * 0.4,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              //  decoration:
              //    BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                  child: Text("TERMINAL"),
                  style: btn,
                  onPressed: () {
                    Navigator.pushNamed(context, "terminal");
                  },
                ),
              ),
            ),

            /*
            Container(
                margin: EdgeInsets.all(10),
                child: (SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                    child: Text("DOCKER GUI"),
                    style: btn,
                    onPressed: () {
                      Navigator.pushNamed(context, "terminal");
                    },
                  ),
                ),),),*/
          ],
        )));
  }
}
