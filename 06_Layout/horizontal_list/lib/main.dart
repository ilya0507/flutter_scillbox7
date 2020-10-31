import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listData = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list '),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double _width = constraints.constrainWidth();
            return _width > 500
                ? ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          color: Colors.green[listData[index] * 100],
                        ),
                      );
                    },
                  )
                : Container(
                    constraints: BoxConstraints(
                      maxHeight: 116.0,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 100.0,
                              maxWidth: 100.0,
                            ),
                            color: Colors.green[listData[index] * 100],
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
