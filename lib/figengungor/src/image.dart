import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pilot/utils/mockups.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MaterialApp(home: ImageExample()));

class ImageExample extends StatelessWidget {
  ImageExample({
    Key key,
    this.title = "Image Playground"
  }): super(key: key);
  final String title;

  final List<Example> _exampleList = [
    Example(
      title: "Asset Background",
      child: ImageAssetBackground(),
    ),
    Example(
      title: "Asset Background 2",
      child: ImageAssetBackground2(),
    ),
    Example(
      title: "Network",
      child: ImageNetwork(),
    ),
    Example(
      title: "Box Fit",
      child: ImageBoxFit(),
    ),
    Example(
      title: "Aspect Ratio",
      child: ImageAspectRatio(),
    ),
    Example(
      title: "Fade In",
      child: FadeInImagePlaceholder(),
    ),
    Example(
      title: "Cached Network Image",
      child: CachedNetworkImagePlaceholder(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Examples(list: _exampleList),
      )
    );
  }
}

class CachedNetworkImagePlaceholder extends StatelessWidget {
  final _imageUrl = 'https://images.unsplash.com/photo-1473172707857-'
      'f9e276582ab6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9'
      '&s=8e3859b288bd5a263d942340a1774647&auto=format'
      '&fit=crop&w=1050&q=80';

  final _imageHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CachedNetworkImage example'),
        backgroundColor: Colors.green,
      ),
      body: Column(children: [
        CachedNetworkImage(
          placeholder: Container(
              color: Colors.grey,
              height: _imageHeight,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator())),
          imageUrl: _imageUrl,
          height: _imageHeight,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}

class FadeInImagePlaceholder extends StatelessWidget {
  final _imageUrl = 'https://images.unsplash.com/photo-1473172707857-'
      'f9e276582ab6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9'
      '&s=8e3859b288bd5a263d942340a1774647&auto=format'
      '&fit=crop&w=1050&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FadeInImage example'),
      ),
      body: Container(
        color: Colors.green,
        child: ListView(
          children: [
            Image.network(
              _imageUrl,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _imageUrl,
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png',
              image: _imageUrl,
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ImageAspectRatio extends StatelessWidget {
  static const double _aspectRatio = 1.5;

  @override
  Widget build(BuildContext context) {
    final _imageHeight = MediaQuery.of(context).size.width / _aspectRatio;
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio example'),
      ),
      body: Container(
        color: Colors.green,
        child: Stack(children: [
          AspectRatio(
            child: Image.asset(
              'assets/backdrop.jpg',
              fit: BoxFit.cover,
            ),
            aspectRatio: _aspectRatio,
          ),
          _getListView(_imageHeight)
        ]),
      ),
    );
  }

  _getListView(double imageHeight) {
    List<Widget> list = List();
    list.addAll(List.generate(
      50,
      (int index) => Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ingredients $index',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.pink,
          ),
    ));
    list.insert(0, Padding(padding: EdgeInsets.only(top: imageHeight)));

    return ListView(
      children: list,
    );
  }
}

class ImageAssetBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      //to use image as background image
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background.jpg'),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Text(
            'DecoratedBox'
                '\nfit:BoxFit.cover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageAssetBackground2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //not to include statusBar
      child: DecoratedBox(
        //to use image as background image
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'), 
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Text(
              'SafeArea'
                  '\nDecoratedBox'
                  '\nfit:BoxFit.cover',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageBoxFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxFit examples'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.green,
        child: ListView(
          children: <Widget>[
            _getCredits(),
            _getContain(context),
            _getCover(context),
            _getFill(context),
            _getFitWidth(context),
            _getFitWidth2(context),
            _getFitHeight(context),
            _getFitHeight2(context),
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _getContain(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/dog.jpg',
          fit: BoxFit.contain,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.contain',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getCover(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/dog.jpg',
          fit: BoxFit.cover,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.cover',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFill(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/dog.jpg',
          fit: BoxFit.fill,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.fill',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitWidth(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/dog.jpg',
          fit: BoxFit.fitWidth,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.fitWidth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitWidth2(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/dog.jpg',
            fit: BoxFit.fitWidth,
            height: 200.0,
            width: 100.0,
          ),
        ),
        Center(
          child: Text(
            'BoxFit.fitWidth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitHeight(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/dog.jpg',
          fit: BoxFit.fitHeight,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.fitHeight',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitHeight2(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/dog.jpg',
            fit: BoxFit.fitHeight,
            height: 900.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Center(
          child: Text(
            'BoxFit.fitHeight',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getCredits() {
    return Center(
      child: Text('Photo by freddie marriage on Unsplash',
          style: TextStyle(
            color: Colors.white,
          )),
    );
  }
}

class ImageNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          color: Colors.green,
          child: Center(
            child: Stack(
              children: [
                Image.network('https://images.unsplash.com/photo-1477936432016-'
                    '8172ed08637e?ixlib=rb-0.3.5&s=b8d21a7fc0c49635b7641343e7ce3ba3'
                    '&auto=format&fit=crop&w=334&q=80'),
                Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  child: Text(
                    'Photo by freddie marriage on Unsplash',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}