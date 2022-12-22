import 'package:flutter/material.dart';
import 'package:today_manna_flutter/screens/checklist_page.dart';
import 'package:today_manna_flutter/screens/home_page.dart';

class MannaNavigation extends StatefulWidget {
  const MannaNavigation({super.key});

  @override
  State<MannaNavigation> createState() => _MannaNavigationState();
}

class _MannaNavigationState extends State<MannaNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          HomePage(),
          Center(child: Text("맥체인 페이지")),
          //Center(child: Text("맥체인 페이지")),
          ChecklistPage(),
          Center(child: Text("메모 페이지")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: Colors.white.withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_stories,
              size: 32,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_box,
              size: 32,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outline,
              size: 32,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
