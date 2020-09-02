import 'package:air_quality_app/resources/gradients_rsc.dart';
import 'package:air_quality_app/resources/icons_rsc.dart';
import 'package:air_quality_app/ui/decorations.dart';
import 'package:flutter/material.dart';
import 'package:air_quality_app/resources/strings_rsc.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, @required this.appTitle}) : super(key: key);
  final String appTitle;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gradient currentAppGradient;
  @override
  void initState() {
    super.initState();
    currentAppGradient = WeatherGradients.defaultGradient;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAppBackground(),
          _buildInfoScene(widget.appTitle),
        ],
      ),
    );
  }

  Widget _buildInfoScene(String cityName) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            _buildTopBar(),
            _buildShortWeatherDetailWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () => _showAddressDialog(),
                child: Text(
                  Strings.defaultCity,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert_sharp,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      decoration: BoxDecoration(),
    );
  }

  Widget _buildShortWeatherDetailWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTempWidget(),
          _buildWeatherStatusWidget(),
        ],
      ),
      decoration: AppDecorations.blurRoundBox(),
    );
  }

  Widget _buildTempWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              Strings.defaultTemp,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "°" + Strings.defaultTempScale,
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWeatherStatusWidget() {
    return Container(
      child: Text(
        Strings.defaultWeatherStatus,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget _buildAiqWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: AppDecorations.blurRoundBox(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AppIcons.aqiLeaf),
          Text(
            "AIQ " + Strings.defaultAqi,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBackground() {
    return Container(
      decoration:
          AppDecorations.gradientBox(gradientTOFill: currentAppGradient),
    );
  }

  Future<void> _showAddressDialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              "Current Location",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            children: [
              Text(
                "${Strings.defaultPlaceName}, ${Strings.defaultCity}, ${Strings.defaultState}\nPIN: ${Strings.defaultCountryCode} ${Strings.defaultPostalCode}",
                maxLines: 5,
              ),
            ],
            contentPadding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            titlePadding: EdgeInsets.all(12),
          );
        });
  }
}
