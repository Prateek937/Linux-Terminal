import 'package:dockerapp/vars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Terminal extends StatefulWidget {
  Terminal({Key? key}) : super(key: key);

  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  var cmdoutput = " ";

  web() async {
    var r = Uri.http("13.233.102.206", "/cgi-bin/terminal.py", {"x": cmd});

    var r1 = await http.get(r);
    setState(() {
      cmdoutput = r1.body;
    });
    print(r1.statusCode);

    print(r1.body);
    //print(r1.headers);
    //print(r1.contentLength);
  }

  late String cmd;

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var deviceheight = MediaQuery.of(context).size.height;

    // late String cmd;
    //var txt;

    return Scaffold(
      appBar: navTop,
      body: Column(children: [
        //Enter command and send button
        Container(
          height: deviceheight * 0.2,
          width: devicewidth,
          color: Colors.blue.shade600,
          child: Column(
            children: [
              //command input
              Container(
                  //      height: deviceheight * 0.1,
                  //      width: devicewidth * 0.2,
                  //decoration: BoxDecoration(),
                  height: deviceheight * 0.06,
                  width: devicewidth * 0.8,
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  child: TextField(
                    onChanged: (value) {
                      cmd = value;
                      //  print(cmd);
                    },
                    textInputAction: TextInputAction.send,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //prefixIcon: Icon(Icons.send),
                        prefixIcon: Icon(
                          Icons.send,
                          color: Colors.black,
                          size: 20,
                        ),
                        hintText: "Enter Command"),
                  )),
              //Send button
              Container(
                height: deviceheight * 0.07,
                width: devicewidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: web,
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        //Output Container
        Expanded(
            child: Container(
          height: deviceheight * 0.677,
          width: devicewidth,
          color: Colors.blue.shade600,

          //Expanded(
          child: Container(
            //width: 40,
            padding: EdgeInsets.only(top: 20, right: 90, left: 20),
            margin: EdgeInsets.all(25),
            //color: Colors.black,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: <Widget>[
                Text(
                  "[root@Terminal]#",
                  textAlign: TextAlign.left,
                  //textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.limeAccent,
                    fontSize: 15,
                  ),
                ),
                Expanded(
                  child: Text(
                    "$cmdoutput",
                    style: TextStyle(
                      color: Colors.blue.shade100,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }
}
