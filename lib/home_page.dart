import 'package:flutter/material.dart';
import 'package:ostad_task/page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ostad'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                _tabController.animateTo(0);
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.blueAccent),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                _tabController.animateTo(1);
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.blueAccent),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                _tabController.animateTo(2);
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.blueAccent),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyPage(color: Colors.blue, number: 1),
          MyPage(color: Colors.green, number: 2),
          MyPage(color: Colors.orange, number: 3),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home_filled),text: 'Page 1'),
            Tab(icon: Icon(Icons.settings), text: 'Page 2',),
            Tab(icon: Icon(Icons.person), text: 'Page 3',),
          ],
        ),
      ),
    );
  }
}
