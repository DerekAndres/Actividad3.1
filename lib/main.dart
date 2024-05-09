import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Clone',
      theme: ThemeData(
        primaryColor: Color(0xFF075E54), 
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF25D366), 
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF075E54), 
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('WhatsApp'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'CHATS'),
            Tab(text: 'ESTADOS'),
            Tab(text: 'LLAMADAS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatScreen(), 
          StatusScreen(), 
          Container(), 
        ],
      ),
    );
  }
}


class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {'name': 'Arya Stark', 'message': 'I wish GoT had better ...', 'time': 'Yesterday'},
    {'name': 'Robb Stark', 'message': 'Did you check Maisie\'s...', 'time': 'Yesterday'},
    {'name': 'Jaquen H\'ghar', 'message': 'Valar Morghulis', 'time': 'Yesterday'},
    {'name': 'Sansa Stark', 'message': 'The North Remembers', 'time': 'Yesterday'},
    {'name': 'Jon Snow', 'message': 'Stick em\' with the point...', 'time': 'Yesterday'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          title: Text(chats[index]['name']),
          subtitle: Text(chats[index]['message']),
          trailing: Text(chats[index]['time']),
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('My Status'),
          subtitle: const Text('Tap to add status update'),
        ),
        const Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          title: const Text('Arya Stark'),
          subtitle: const Text('7 minutes ago'),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.keyboard_arrow_down),
          title: const Text('Muted updates'),
        ),
      ],
    );
  }
}
