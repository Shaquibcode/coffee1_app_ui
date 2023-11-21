import 'package:coffee_app_ui/color.dart';
import 'package:coffee_app_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';

import '../widgets/homebar.dart';
import '../widgets/items_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(7),
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xff1F242C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Iconify(
                        HeroiconsSolid.view_grid,
                        size: 12,
                        color: Color(0xff404F52),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xff1F242C),
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/model.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, left: 15),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
              child: const Text(
                "Find The Best Coffee For you",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const MySearchBar(),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              labelColor: const Color(0xffE57734),
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              controller: _tabController,
              isScrollable: true,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3,
                  color: Color(0xffE57734),
                ),
                insets: EdgeInsets.symmetric(horizontal: 16),
              ),
              labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              tabs: const [
                Tab(
                  text: "Cappuccino",
                ),
                Tab(
                  text: "Espresso",
                ),
                Tab(
                  text: "Latte",
                ),
                Tab(
                  text: "Flat White",
                ),
              ],
            ),
            Center(
              child: [
                ItemsWidget(),
                ItemsWidget(),
                ItemsWidget(),
                ItemsWidget(),
              ][_tabController.index],
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBar(),
    );
  }
}
