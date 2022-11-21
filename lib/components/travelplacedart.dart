import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travelappui/models/placesModel.dart';
import 'package:travelappui/theme.dart';

Widget TravelCard(PlaceModel placeModel) => Container(
      
      child: Stack(
        children: [
          Container(
            height: double.maxFinite,
            child: ClipRRect(          
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage(placeModel.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 4),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.black.withAlpha(90)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeModel.placeTitle,
                    style: kAppTheme.textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
