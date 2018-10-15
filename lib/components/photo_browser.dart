import 'package:flutter/material.dart';
import './photo_indicator.dart';

class PhotoBrowser extends StatefulWidget {
  final List<String> photoAssetPaths;
  final int visiblePhotoIndex;

  PhotoBrowser({this.photoAssetPaths, this.visiblePhotoIndex});

  @override
  _PhotoBrowserState createState() => new _PhotoBrowserState();
}

class _PhotoBrowserState extends State<PhotoBrowser> {
  int visiblePhotoIndex;

  @override
  void initState() {
    super.initState();
    visiblePhotoIndex = widget.visiblePhotoIndex;
  }

  @override
  void didUpdateWidget(PhotoBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visiblePhotoIndex != oldWidget.visiblePhotoIndex) {
      setState(() {
        visiblePhotoIndex = widget.visiblePhotoIndex;
      });
    }
  }

  void _prevImage() {
    setState(() {
      visiblePhotoIndex = visiblePhotoIndex > 0 ? visiblePhotoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      visiblePhotoIndex = visiblePhotoIndex < widget.photoAssetPaths.length - 1
          ? visiblePhotoIndex + 1
          : visiblePhotoIndex;
    });
  }

  Widget _buildPhotoControls() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new GestureDetector(
          onTap: _prevImage,
          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: new Container(
              color: Colors.transparent,
            ),
          ),
        ),
        new GestureDetector(
          onTap: _nextImage,
          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: new Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //Photo
        new Image.asset(
          widget.photoAssetPaths[visiblePhotoIndex],
          fit: BoxFit.cover,
        ),
        //Photo Indicator
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: new SelectedPhotoIndicator(
            photoCount: widget.photoAssetPaths.length,
            visiblePhotoIndex: visiblePhotoIndex,
          ),
        ),
        //Photo Controls
        _buildPhotoControls(),
      ],
    );
  }
}
