import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    Center(
        child: Pages(
      text: "Page 1",
    )),
    Center(
        child: Pages(
      text: "Page 2",
    )),
    Center(
        child: Pages(
      text: "Page 3",
    )),
     Center(
        child:  Pages(
      text: "Page 4",
    ))
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("GeeksforGeeks"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "Page: " +
                    (_curr + 1).toString() +
                    "/" +
                    _list.length.toString(),
                textScaleFactor: 2,
              ),
            )
          ],
        ),
        body: PageView(
          children: _list,
          scrollDirection: Axis.horizontal,

          // reverse: true,
          // physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              _curr = num;
            });
          },
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _list.add(
                        const Center(
                            child:  Text("New page",
                                style: TextStyle(fontSize: 35.0))),
                      );
                    });
                    if (_curr != _list.length - 1)
                      controller.jumpToPage(_curr + 1);
                    else
                      controller.jumpToPage(0);
                  },
                  child: const Icon(Icons.add)),
              FloatingActionButton(
                  onPressed: () {
                    _list.removeAt(_curr);
                    setState(() {
                      controller.jumpToPage(_curr - 1);
                    });
                  },
                  child: const Icon(Icons.delete)),
            ]));
  }
}

class Pages extends StatelessWidget {
  final text;

  Pages({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}
