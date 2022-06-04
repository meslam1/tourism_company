import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  var _pageIndex = 0;

  List<String> listImgs = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png'];

  final pageController  = PageController();

  String searchValue = '';
  final List<String> _suggestions = [];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // test
    return Scaffold(
      appBar: EasySearchBar(
          title: const Text('Home'),
          onSearch: (value) => setState(() => searchValue = value),
          // actions: [
          //   IconButton(
          //       icon: const Icon(
          //           Icons.person
          //       ),
          //       onPressed: () {}
          //   )
          // ],
          asyncSuggestions: (value) async => await _fetchSuggestions(value)),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
          ),
          child: Text('My Profile'),
        ),
        ListTile(title: const Text('Item 1'), onTap: () => Navigator.pop(context)),
        ListTile(title: const Text('Item 2'), onTap: () => Navigator.pop(context))
      ])),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.lightBlue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: _currentIndex == 0
          ? SizedBox(
            width: double.infinity,
            height: 200,
            child: PageView(
              controller: pageController,
              children: [
                Container(
                  color: Colors.red,
                  child:  Image.asset(listImgs[0], fit: BoxFit.fill),
                ),
                Container(
                  color: Colors.green,
                  child:  Image.asset(listImgs[1], fit: BoxFit.fill),
                ),
                Container(
                  color: Colors.blue,
                  child:  Image.asset(listImgs[2], fit: BoxFit.fill),
                ),

              ],
            ),
          )
          : _currentIndex == 1
              ? const Center(
                  child: Text('Likes'),
                )
              : _currentIndex == 2
                  ? const Center(
                      child: Text('Search'),
                    )
                  : const Center(
                      child: Text('Profile'),
                    ),
    );
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

}
