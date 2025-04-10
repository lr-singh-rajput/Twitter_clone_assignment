import 'package:flutter/material.dart';
import 'package:assessment_twitter/pages/widgets/message_widget.dart';
import 'package:assessment_twitter/pages/widgets/notification_widget.dart';
import 'package:assessment_twitter/pages/widgets/post_widget.dart';
import 'package:assessment_twitter/pages/widgets/search_widget.dart';
import 'package:assessment_twitter/pages/searchdata/search_data.dart';

import 'Model/PostModel.dart';
import 'Model/message_model.dart';
import 'Model/notification_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // 🔍 Search field controller and filtered result list
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    // 🟢 Initially show all search items
    _filteredResults = searchResults;
  }

  // 🔄 Filters search results based on user input
  void _filterSearchResults(String query) {
    setState(() {
      _filteredResults = searchResults
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // 🧠 Dynamic AppBar title based on tab
  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Notifications';
      case 3:
        return 'Messages';
      default:
        return '';
    }
  }

  // 🔘 Update selected index on tab tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 📄 Pages list moved inside build method to access instance variables
    final List<Widget> pages = [
      // 🏠 Home - User Posts
      ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: userPosts.length,
        itemBuilder: (context, index) {
          return PostWidget(post: userPosts[index]);
        },
      ),

      // 🔍 Search Tab
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Twitter',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: _filterSearchResults,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredResults.length,
              itemBuilder: (context, index) {
                return SearchItemWidget(result: _filteredResults[index]);
              },
            ),
          ),
        ],
      ),

      // 🔔 Notifications Tab
      ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationWidget(notification: notifications[index]);
        },
      ),

      // 💬 Messages Tab
      ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageWidget(message: messages[index]);
        },
      ),
    ];

    return Scaffold(
      // ☰ Drawer (left menu)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, size: 40),
                  SizedBox(height: 10),
                  Text('UserName', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            ListTile(leading: Icon(Icons.person), title: Text('Profile'), onTap: () => Navigator.pop(context)),
            ListTile(leading: Icon(Icons.list), title: Text('Lists')),
            ListTile(leading: Icon(Icons.bookmark), title: Text('Bookmarks')),
            ListTile(leading: Icon(Icons.addchart), title: Text('Twitter Ads')),
            ListTile(title: Text('Settings and Privacy')),
            ListTile(title: Text('Help Center')),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      // 🔷 AppBar with Drawer icon and dynamic title
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.account_circle, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          _getAppBarTitle(),
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      // 🧱 Page content based on selected index
      body: pages[_selectedIndex],

      // 🔻 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF1DA1F2),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Messages'),
        ],
      ),
    );
  }
}
