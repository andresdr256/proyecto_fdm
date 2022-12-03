import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelappui/constants/constants.dart';
import 'package:travelappui/components/featuredcard.dart';
import 'package:travelappui/components/travelplacedart.dart';
import 'package:travelappui/views/HomePage/state/homepageScrollListner.dart';
import 'package:travelappui/views/HomePage/state/homepageStateProvider.dart';

import '../../routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _mainScrollController = ScrollController();

  final double _bottomBarHeight = 90;
  HomepageSrollListner _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = HomepageSrollListner.initialise(_mainScrollController);
  }

  @override
  Widget build(BuildContext context) {
    HomePageStateProvider homepagestate =
        Provider.of<HomePageStateProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Proyecto Fundamentos Desarrollo Móvil",
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
        )),
        leading: PopupMenuButton(
          offset: Offset.fromDirection(2, 58),
          onSelected: (value) {},
          icon: Icon(Icons.menu),
          itemBuilder: (context) {
            return kAppBarMenuOptions
                .map(
                  (option) => PopupMenuItem(
                    value: option,
                    child: Container(
                      width: 120,
                      child: Text(
                        option,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
                .toList();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 36,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.ROUTE_Login);
              })
        ],
      ),
      body: Container(
        color: Colors.black87,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _mainScrollController,
              child: Column(
                children: [
                  // Lista Horizontal
                  Container(
                    padding: EdgeInsets.only(top: 17),
                    width: size.width,
                    height: size.height * 0.33,
                    child: StreamBuilder(
                        stream: homepagestate.getFeaturedPlaces().asStream(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator());
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator());

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/view");
                                    },
                                    child: FeaturedCard(
                                      placeModel: snapshot.data[index],
                                    ));
                              });
                        }),
                  ),
                  // Texto "Más recientes"
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Más recientes",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  // Lista Vertical
                  Container(
                    margin: EdgeInsets.all(16),
                    child: StreamBuilder(
                        stream: homepagestate.getAllPlaces().asStream(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator());
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator());

                          return GridView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              primary: false,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/view");
                                    },
                                    child: TravelCard(snapshot.data[index]));
                              });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
