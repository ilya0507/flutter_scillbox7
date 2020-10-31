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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: SliverAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            //backgroundColor: Colors.transparent,//Прозрачный AppBar
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Река Фонтанка'),
              background: Image.network(
                'https://fb.ru/misc/i/gallery/31247/1256363.jpg',
                fit: BoxFit.cover,
                color: Colors.amber[100],
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            leading: Icon(Icons.menu),
            expandedHeight: 300.0,
            //floating: true,
          ),
          SliverToBoxAdapter(
            child: Text(
                '''Название связано с устройством фонтанов Летнего сада, через Фонтанку были переброшены трубы из бассейна Лиговского канала.

До 1712—1714 годов называлась Ериком или Безымянным Ериком и представляла собой болотную речку, образующую в своём течении острова и заводи. В переписной книге Водской пятины 1500 года фигурирует выразительный топоним река Голодуша. Затем именовалось Фонтанной рекой (речкой), с 1737 года получила современное название. На момент строительства первого моста через Безымянный Ерик ширина водной преграды составляла около 200 метров, но по мере освоения мелководий для строительства её ширина существенно уменьшилась[4]. В 1743—1752 годах она была расчищена и укреплена деревянной набережной. Современные очертания зеркало Фонтанки приобрело с тех пор, как в 1780—1789 годах её вторично расчистили и углубили, а берега одели в гранит[5].

У истока Безымяного Ерика стояли деревни Враловщина и Кандуя, на месте Александринского театра — деревня Усадица[3]. В низовье реки была небольшая ижорская деревня, известная с XVII века. На одних старинных картах написано Кальюла, на других — Каллина. В первые годы строительства Петербурга название деревни было переделано на русский лад и её стали именовать Калинкиной. Это название запечатлено во многих топонимах, в том числе в названии Старо-Калинкиного моста.

В XVII веке проток был мелководным, болотистым, местами значительно шире современной Фонтанки.

В 1780—1789 по проекту А. В. Квасова под руководством Ф. В. Бауэра началось сооружение гранитных набережных, спусков и подъездов к реке. Более 4000 людей в 1787 году были заняты в работе по проекту. Возможно, это первая стачка — 400 «челобитчиков» отправились к Зимнему дворцу просить защиты от «произвола подрядчиков». Делегаты оказались под стражей.[3] Строительство завершают И. Борисов и К. Модерах[3]. К концу XVIII века русло реки было спрямлено. '''),
          ),
        ],
      ),
    );
  }
}
