import 'package:flutter/material.dart';

class SelectedPhotoIndicator extends StatelessWidget {
  final int photoCount;
  final int visiblePhotoIndex;
  SelectedPhotoIndicator({this.photoCount, this.visiblePhotoIndex});

  Widget _buildInactiveIndicator() {
    return new Expanded(
      child: new Padding(
        padding: const EdgeInsets.only(
          left: 2.0,
          right: 2.0,
        ),
        child: new Container(
          height: 3.0,
          decoration: new BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: new BorderRadius.circular(2.5),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];

    for (int i = 0; i < photoCount; ++i) {
      indicators.add(_buildInactiveIndicator());
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Row(
          children: _buildIndicators(),
        ));
  }
}
