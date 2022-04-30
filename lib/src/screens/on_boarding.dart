import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_ui_kit/config/app_config.dart' as config;
import 'package:ecommerce_app_ui_kit/src/models/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  int _current = 0;
  OnBoardingList _onBoardingList;
  @override
  void initState() {
    _onBoardingList = new OnBoardingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.96),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 50),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.button,
                ),
                color: Theme.of(context).accentColor,
                shape: StadiumBorder(),
              ),
            ),
            CarouselSlider(
              height: 500.0,
              viewportFraction: 1.0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: _onBoardingList.list.map((OnBoarding boarding) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            boarding.image,
                            width: 500,
                          ),
                        ),
                        Container(
                          width: config.App(context).appWidth(75),
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            boarding.description,
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              width: config.App(context).appWidth(75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _onBoardingList.list.map((OnBoarding boarding) {
                  return Container(
                    width: 25.0,
                    height: 3.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: _current == _onBoardingList.list.indexOf(boarding)
                            ? Theme.of(context).hintColor.withOpacity(0.8)
                            : Theme.of(context).hintColor.withOpacity(0.2)),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: config.App(context).appWidth(75),
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                onPressed: () {
                  Navigator.of(context).pushNamed('/SignUp');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.display1.merge(
                            TextStyle(color: Theme.of(context).primaryColor),
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
