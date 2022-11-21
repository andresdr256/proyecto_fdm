import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelappui/theme.dart';
import 'package:travelappui/views/HomePage/state/homepageStateProvider.dart';

class TopFeaturedList extends StatefulWidget {
  @override
  _TopFeaturedListState createState() => _TopFeaturedListState();
}

class _TopFeaturedListState extends State<TopFeaturedList> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;   
    
    return Container(
              margin: EdgeInsets.only(bottom: 4),
              padding: EdgeInsets.only(left: 12, right: 12, top: 12),
              height: 40,
              width: size.width,
              child: Center(
                child: Text(
                "Popular",
                style: TextStyle(fontSize: 25),
                ),
              ),
    );
  }
}