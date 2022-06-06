import 'package:flutter/material.dart';
import 'package:fund_allocations/UI/allocation_page.dart';
import 'package:fund_allocations/Widgets/custom_container_widget.dart';
import 'package:fund_allocations/Widgets/custom_text_widget.dart';

class CustomTababrSection extends StatelessWidget {
  CustomTababrSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          CustomContainerWidget(
            align: Alignment.topLeft,
            childWidget: const TabBar(
              isScrollable: true,
              indicatorColor: Color(0xff07877B),
              unselectedLabelColor: Colors.grey,
              labelColor: Color(0xff07877B),
              tabs: [
                Tab(text: 'Funds'),
                Tab(text: 'Allocation'),
                Tab(text: 'Pledge')
              ],
            ),
          ),
          CustomContainerWidget(
            color: Colors.white,
            height: 567,
            childWidget: TabBarView(
              children: [
                Icon(Icons.directions_car),
                AllocationPage(),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
