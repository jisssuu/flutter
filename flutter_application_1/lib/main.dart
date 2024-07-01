import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index));
    }

  @override
  void dispose() {
    _tabController.dispose();
    super.initState();
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
     body: _selectedIndex == 0 
     ? TabContainer(context, Colors.indigo, "Friends Tab")
     : _selectedIndex == 1 
          ? TabContainer(context, Colors.amber[600] as Color, "Chats Tab")
          : TabContainer(context, Colors.blueGrey, "Settings Tab"),
     bottomNavigationBar: TabBar(
      labelColor: Colors.blue,
      controller: _tabController,
      tabs: [
        Tab(
          icon: Icon(
            _selectedIndex == 0 ? Icons.person : Icons.person_2_outlined
          ),
          text: "Friends",
          
        ),
        Tab(
          icon: Icon(
            _selectedIndex == 1 ? Icons.chat : Icons.chat_outlined
          ),
          text: "Chats",
        ),
        Tab(
          icon: Icon(
            _selectedIndex == 2 ? Icons.settings : Icons.settings_outlined
          ),
          text: "Settings",
        )
      ],
     ),
    );
  }

  Widget TabContainer(BuildContext con, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(con).size.width,
      height: MediaQuery.of(con).size.height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    ); 
  }
}
