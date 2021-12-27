import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController1;
  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController1 = TabController(length: 5, vsync: this);
    super.initState();
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
                  Text('OS X'),
                  Text('PLAYSTATION'),
                  Text('CONSOLES'),
                ]),
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
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: IconButton(
                                      onPressed: () {},
                                      iconSize: 30,
                                      icon: const Icon(
                                          Icons.access_time_filled_rounded)),
                                ),
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
                  )),
                ),
                Expanded(
                  child:
                      TabBarView(controller: _tabController1, children: const [
                    Center(
                      child: Text(
                        'all',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
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
