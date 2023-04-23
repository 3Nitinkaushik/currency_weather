import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:show_weather_currency/screen/Currencyscreen.dart';
import 'package:show_weather_currency/screen/settings.dart';
import 'package:show_weather_currency/screen/weather.dart';


void main() {
  runApp(MaterialApp(
          initialRoute: home.id,
          routes: {
home.id:(context)=>home(),
            Settings.id:(context)=>Settings(),
          },
          debugShowCheckedModeBanner: false,
      )
      );
}

class home extends StatefulWidget {
  static String id="home";
  const home({super.key});

  @override
  State<home> createState() => _State();
}

class _State extends State<home> with SingleTickerProviderStateMixin {
  static List<Tab> tabs = <Tab>[
    Tab(
      text: "Weather",
      icon: Icon(Icons.cloud),
    ),
    Tab(
      text: "Currency",
      icon: Icon(FontAwesomeIcons.dollarSign),
    ),
  ];
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(

          appBar: AppBar(
            backgroundColor:  Colors.green.shade300,
            bottom: TabBar(
              controller: _tabController,
              tabs: tabs,
            ),
            title: Center(
                child: const Text(
              'Weather & Curency',
              style: TextStyle(fontWeight: FontWeight.w900),
            )),
          ),
          body: TabBarView(
            controller: _tabController,
            children:  [
              Weatherscreen(),
              Currencyscreen(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home,size: 35,),
                // IconButton(onPressed: (){setState(() {
                //
                // });}, icon: Icon(Icons.refresh_outlined,size: 40,),),
                IconButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, Settings.id,(Route<dynamic> route) => false);
                },icon: Icon(Icons.settings,size: 35,)),

              ],
            ),
          ),
      ),
    );
  }
}
