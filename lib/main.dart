import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCounter(),
    );
  }
}

class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  Timer? _timer;
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter App',),centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              const SizedBox(height: 10.0),
              Text("$counter",style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
              ),),
              const SizedBox(height: 30.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          width: 20,
                          height: 5.0,
                        ),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        if(counter > 0 ) counter--;
                      });
                    },
                    onTapDown: (TapDownDetails details) {
                      _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                        setState(() {
                          if(counter > 0 )
                            counter--;
                        });

                      });
                    },
                    onTapUp: (TapUpDetails details) {

                      _timer!.cancel();
                    },
                    onTapCancel: () {

                      _timer!.cancel();
                    },
                  ),
                  const SizedBox(width: 30.0),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Icon(Icons.add,size: 40.0, color: Colors.white,),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        counter++;
                      });
                    },
                    onTapDown: (TapDownDetails details) {

                      _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                        setState(() {
                          counter++;
                        });
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      print('up');
                      _timer!.cancel();
                    },
                    onTapCancel: () {

                      _timer!.cancel();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
