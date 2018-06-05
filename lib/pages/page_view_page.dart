import 'package:flutter/material.dart';
import 'package:layout_demo_flutter/layout_type.dart';
import 'package:layout_demo_flutter/pages/main_app_bar.dart';

class PageViewPage extends StatelessWidget implements HasLayoutGroup {
  PageViewPage({Key key, this.layoutGroup, this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  final PageController pageController = new PageController();
  int pageIndex = 0;
  int userScrollPageIndex = 0;

  Widget _buildPage({int index, Color color}) {
    return Container(
      color: color,
      child: Center(
        child: Text('$index', style: TextStyle(fontSize: 132.0, color: Colors.white)),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: pageController,
      children: [
        _buildPage(index: 1, color: Colors.green),
        _buildPage(index: 2, color: Colors.blue),
        _buildPage(index: 3, color: Colors.indigo),
        _buildPage(index: 4, color: Colors.red),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.pageView,
        onLayoutToggle: onLayoutToggle,
      ),
      body: _buildPageView(),
    );
  }
}