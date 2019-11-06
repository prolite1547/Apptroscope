import "package:flutter/material.dart";
import "../../styles.dart";

import '../widgets/tab_pages/tab1.dart' as tab1;
// import '../widgets/tab_pages/tab2.dart' as tab2;
// import '../widgets/tab_pages/tab3.dart' as tab3;

class SectionTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SectionTabState();
  }
}

class _SectionTabState extends State<SectionTab> with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 1,vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenSizeHeight - 300.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: DetailsBackColor
          ),
          padding: const EdgeInsets.symmetric( vertical: 10.0),
          child: TabBar(
            labelColor: LabelColor,
            // isScrollable: true,
            indicatorWeight: 2.0,
            indicatorColor: Colors.blueGrey,
            labelStyle: TabTextStyle,
            controller: controller,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.calendar_today), child: Text("YESTERDAY"),),
              Tab(icon: Icon(Icons.calendar_view_day), child: Text("TODAY"),),
              Tab(icon: Icon(Icons.date_range) , child: Text("TOMORROW"),)
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(height: containerHeight - 20),
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: TabBarView(
              controller:  controller,
              children: <Widget>[
                SingleChildScrollView(child:tab1.Tab1("yesterday"),),
                SingleChildScrollView(child: tab1.Tab1("today"),),
                SingleChildScrollView(child: tab1.Tab1("tomorrow"),),
              ],
          ),
        )
      ],
    );
  }
}
