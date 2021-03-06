import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  double _height = 400;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
//      if(_counter>0)
//        _counter -= 10;
      if(_height > 0)
        _height -= _height*0.25;

    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(_height == 400)
      _height = size.width * 0.8;

    print(size.height);
   // _height = size.width*0.8;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children:[
          Container(child: SizedBox(height: 20,),),
          Stack(fit: StackFit.loose,
          children: <Widget>[
            Center(child: Image.asset('asset/sample.png',width:size.width*0.8 ,),),
            Center(child: Container(height: _height,
              child: ClipRect(  // <-- clips to the 200x200 [Container] below
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: (0.1 * _counter),
                    sigmaY: (0.1 * _counter),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
            )),
        Center(child : Visibility(visible: _counter==0,child: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              "??????",
              style: TextStyle(
                fontSize: 48,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.black,
              ),
            ),
            // Solid text as fill.
            Text(
              "??????",
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),)),

          ],),
          SizedBox(height: 20,),
          Center(child:Container(child:  GridButton(
          borderColor: Colors.black,
          hideSurroundingBorder: true,borderWidth: 0,

          onPressed: (v){
            print(v);
          },
          items: [
            [
              GridButtonItem(title: "??????",textStyle: TextStyle(color: Colors.black)),
              GridButtonItem(title:"?????????",child: Text("?????????")),

            ],
            [

              GridButtonItem(title: "?????????", ),
              GridButtonItem(title: "?????????", ),
            ],

          ],
        ),height: 200,width: size.width-10,),)]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
