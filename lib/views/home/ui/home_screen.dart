import 'dart:async';

import 'package:configuration/utility/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video_calls/style/style.dart';
import 'package:flutter_video_calls/views/common/avatar/avatar_circle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mColorBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: mSpacing,
                  vertical: 8.h,
                ),
                child: AvatarCircle(
                  size: mAvatar,
                  url:
                      "https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-1-480x600.jpg",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: mSpacing,
                right: 76.w,
                top: 8.h,
              ),
              child: Text(
                TimeOfDay.now().greetingByTimeWithUsername("bui hai nam"),
                style: mTitleStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: mSizeH4,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: mSpacing,
                right: 76.w,
                top: 8.h,
              ),
              child: Text(
                'You just can\'t beat the person who won\'t give up.',
                style: mHintStyle.copyWith(
                  fontSize: mSizeH5,
                ),
              ),
            ),
            SizedBox(
              height: mSpacing,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: mSpacing,
                    right: mSpacing,
                    top: 8.h,
                  ),
                  child: CardWidget(),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: mSpacing,
                    right: mSpacing,
                    top: 8.h,
                  ),
                  child: CardWidget(),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: mSpacing),
                child: GoogleMap(
                  mapType: MapType.terrain,
                  initialCameraPosition: _kGooglePlex,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          height: 200.h,
          width: 140.w,
          padding: EdgeInsets.all(mSpacing),
          child: Text('A card that can be tapped')),
      color: Colors.white,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
    );
  }
}
