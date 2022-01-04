import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_game_library/classes/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController1;
  int _selectedIndex = 0;
  int _selectedIndexBar = 0;
  bool loading = true;
  var sidebar;
  @override
  void initState() {
    _tabController1 = TabController(length: 5, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndexBar = _tabController1.index;
          asingJson();
        });
      });
    asingJson();
    super.initState();
  }

  void asingJson() async {
    Future<String> response =
        rootBundle.loadString('statics/sidebar_$_selectedIndexBar.json');
    var data = json.decode(await response);
    sidebar = Sidebar.fromJson(data);
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        minimum: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.add_alert,
                      color: Colors.white,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 17,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/dev.png',
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: const [
                  Text('LIBRARY',
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                  Spacer(),
                  Text('FAVORITES',
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                ],
              ),
            ),
            TabBar(
              controller: _tabController1,
              isScrollable: true,
              unselectedLabelColor: Colors.grey[500],
              labelStyle: const TextStyle(fontSize: 18),
              indicatorWeight: 0.1,
              tabs: const [
                Text('ALL'),
                Text('PC'),
                Text('CONSOLES'),
                Text('OS X'),
                Text('PLAYSTATION'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.01),
              height: 90,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(15))),
                      child: TextField(
                        cursorColor: Colors.grey.shade800,
                        style: const TextStyle(decoration: TextDecoration.none),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search..',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    const Icon(
                      Icons.view_quilt_rounded,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.apps,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: 60,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: loading == true
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: sidebar == null
                                    ? 0
                                    : sidebar.entitys.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              sidebar.entitys[index].color)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Image.asset(
                                                sidebar.entitys[index].image))),
                                  );
                                }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: IconButton(
                              alignment: Alignment.center,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.replay_outlined,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(controller: _tabController1, children: [
                    ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Image.network(
                                      'https://images.igdb.com/igdb/image/upload/t_thumb/co2adl.jpg'),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Image.network(
                                      'https://images.igdb.com/igdb/image/upload/t_thumb/co2adl.jpg'),
                                ),
                              ],
                            ),
                          );
                        }),
                    Center(
                      child: Text(
                        'pc',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Center(
                      child: Text(
                        'os x',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Center(
                      child: Text(
                        'playstation',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Center(
                      child: Text(
                        'consoles',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ]),
                )
              ],
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.table_chart,
                color: Colors.white,
              ),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.apps, color: Colors.white),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.local_offer, color: Colors.white),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.people, color: Colors.white),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.settings, color: Colors.white),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
