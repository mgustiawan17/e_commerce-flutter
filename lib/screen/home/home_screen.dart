import 'package:e_commerce/screen/home/home_subscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomeSubScreen(),
            Center(
              child: Text("Feed"),
            ),
            Center(
              child: Text("Help"),
            ),
            Center(
              child: Text("About"),
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.feed_outlined),
                text: "Feed",
              ),
              Tab(
                icon: Icon(Icons.info_outline),
                text: "Help",
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined),
                text: "About",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
