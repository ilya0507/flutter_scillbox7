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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> tabBarNav = [
    {
      'title': Text('Фото'),
      'icon': Icon(Icons.home),
    },
    {
      'title': Text('Chat'),
      'icon': Icon(Icons.chat),
    },
    {
      'title': Text('Profile'),
      'icon': Icon(Icons.adjust),
    }
  ];

  int _currentTabIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  TabController _tabController;

  bool isPaid = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabBarNav.length,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_tabListener);
  }

  _tabListener() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.blueGrey,
              backgroundImage: NetworkImage(
                  'http://cdn.fishki.net/upload/post/2019/07/31/3046765/70a1d09f69d8d25a5a9799eec717508d.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('''
            Имя
            Отчество
            Фамилия'''),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.blueGrey,
              backgroundImage: NetworkImage(
                  'http://cdn.fishki.net/upload/post/2019/07/31/3046765/70a1d09f69d8d25a5a9799eec717508d.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            // DrawerHeader(
            //   child: Text('Чебурашка'),
            // ),
            Column(
              children: <Widget>[
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Images'),
                  leading: Icon(Icons.image),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Выход');
                  },
                  color: Colors.grey[200],
                  child: Text('Выход'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('Регистрация');
                  },
                  color: Colors.grey[200],
                  child: Text('Регистрация'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('05_MaterialCupertino'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.face),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.lightBlue,
            child: Center(
              child: Text(
                isPaid ? 'Фото оплачено' : 'Фото',
                style: optionStyle,
              ),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            child: Center(
              child: Text(
                'Чат',
                style: optionStyle,
              ),
            ),
          ),
          Container(
            color: Colors.lightGreen,
            child: Center(
              child: Text(
                'Профиль',
                style: optionStyle,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(
                () {
              _tabController.index = index;
              _currentTabIndex = index;
            },
          );
        },
        currentIndex: _currentTabIndex,
        items: tabBarNav
            .map(
              (item) => BottomNavigationBarItem(
            icon: item['icon'],
            title: item['title'],
          ),
        )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                ),
                child: Column(children: <Widget>[
                  ListTile(
                    title: Text('Сумма'),
                    leading: Icon(Icons.credit_card),
                    trailing: Text('200 руб.'),
                    onTap: () {},
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        isPaid = true;
                      });
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueGrey[500])),
                    child: Text('Оплатить'),
                  ),
                ]),
              );
            },
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


