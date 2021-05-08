import 'package:flutter/material.dart';
import './Genetic.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      GeneticPage(),
    ];
    return IndexedStack(
      index: page,
      children: pages,
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Container(
        child: Row(
          children: <Widget>[
            Text(
              "Лабораторна робота 3.3",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}

class GeneticPage extends StatefulWidget {
  GeneticPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return __GeneticPageState();
  }
}

class __GeneticPageState extends State<GeneticPage> {
  double x1;
  double x2;
  double x3;
  double x4;
  int time;

  final aController = TextEditingController();
  final bController = TextEditingController();
  final cController = TextEditingController();
  final dController = TextEditingController();
  final yController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Center(
      child: ListView
        (children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
        Text('ax1 + bx2 + cx3 + dx4 = y',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Roboto',
          color: Colors.black,
        ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: 300,
          child: TextField(
            controller: aController,
            decoration: InputDecoration(
              hintText: 'Введіть значення a',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: 300,
          child: TextField(
            controller: bController,
            decoration: InputDecoration(
              hintText: 'Введіть значення b',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: 300,
          child: TextField(
            controller: cController,
            decoration: InputDecoration(
              hintText: 'Введіть значення c',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: 300,
          child: TextField(
            controller: dController,
            decoration: InputDecoration(
              hintText: 'Введіть значення d',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: 300,
          child: TextField(
            controller: yController,
            decoration: InputDecoration(
              hintText: 'Введіть значення y',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton.icon(
            label: Text('Порахувати',
            style: new TextStyle(
              fontSize: 20.0,
            ),
            ),
            icon: Icon(Icons.calculate),
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              shadowColor: Colors.black26,
              elevation: 5,
            ),
            onPressed: () {
              var a = int.parse(aController.text);
              var b = int.parse(bController.text);
              var c = int.parse(cController.text);
              var d = int.parse(dController.text);
              var y = int.parse(yController.text);

              var startDate = DateTime
                  .now()
                  .microsecondsSinceEpoch;
              var gen = new Genetics();
              var result = gen.equation(
                  equation: [a, b, c, d, y], populationSize: 10);
              print(result.length);
              if (result.length == 4) {
                setState(() {
                  x1 = result[0].toDouble();
                  x2 = result[1].toDouble();
                  x3 = result[2].toDouble();
                  x4 = result[3].toDouble();
                  time = DateTime
                      .now()
                      .microsecondsSinceEpoch - startDate;
                });
              }
            }
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child:
              Text('X1: ${this.x1 ?? ' '}', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child:
              Text('X2: ${this.x2 ?? ' '}', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child:
              Text('X3: ${this.x3 ?? ' '}', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child:
              Text('X4: ${this.x4 ?? ' '}', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Час: ${this.time ?? ' '}',
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ]),
    );
  }
}

