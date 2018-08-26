// by: Simon_Lightfoot

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() =>
	runApp(
		MaterialApp(
			home: Material(
				child: SaturationExample(title: "Saturation Fade"),
			),
		),
	);

class TestItem extends StatefulWidget {
	@override
	TestItemState createState() => TestItemState();
}

class TestItemState extends State<TestItem> with SingleTickerProviderStateMixin {
	
	AnimationController _controller;
	Animation<double> _fade;
	Animation<double> _saturation;
	
	@override
	void initState() {
		super.initState();
		_controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
		_fade = Tween<double>(begin: 0.0, end: 1.0)
			.animate(new CurvedAnimation(parent: _controller,
			curve: Interval(0.0, 0.7, curve: Curves.linear)));
		_saturation = Tween<double>(begin: 0.0, end: 1.0)
			.animate(new CurvedAnimation(parent: _controller,
			curve: Interval(0.3, 1.0, curve: Curves.linear)));
		_controller.forward();
	}
	
	@override
	void dispose() {
		_controller.dispose();
		super.dispose();
	}
	
	@override
	Widget build(BuildContext context) {
		return FadeTransition(
			opacity: _fade,
			child: SaturationTransition(
				saturation: _saturation,
				child: Image.asset("assets/avengers.jpg", fit: BoxFit.cover),
			),
		);
	}
}

class SaturationTransition extends AnimatedWidget {
	
	const SaturationTransition({
		Key key,
		@required Animation<double> saturation,
		this.child,
	}) : super(key: key, listenable: saturation);
	
	Animation<double> get saturation => listenable;
	
	final Widget child;
	
	@override
	Widget build(BuildContext context) {
		return SaturationWidget(
			saturation: saturation.value,
			child: child,
		);
	}
}

class SaturationWidget extends SingleChildRenderObjectWidget {
	const SaturationWidget({
		Key key,
		this.saturation,
		Widget child,
	}) : super(key: key, child: child);
	
	final double saturation;
	
	@override
	RenderObject createRenderObject(BuildContext context) {
		return SaturationRender(
			saturation: saturation,
		);
	}
	
	@override
	void updateRenderObject(BuildContext context, SaturationRender renderObject) {
		renderObject
			..saturation = saturation;
	}
}

class SaturationRender extends RenderProxyBox {
	
	SaturationRender({
		RenderBox child,
		double saturation
	})
		: assert(saturation != null),
			_saturation = saturation,
			super(child);
	
	double _saturation;
	
	set saturation(double value) {
		if (_saturation == value) {
			return;
		}
		_saturation = value;
		markNeedsPaint();
	}
	
	@override
	void paint(PaintingContext context, Offset offset) {
		if (child != null) {
			context.canvas.saveLayer(offset & size, Paint());
			context.paintChild(child, offset);
			context.canvas.drawColor(
				Colors.black.withOpacity((1.0 - _saturation).clamp(0.0, 1.0)),
				BlendMode.saturation,
			);
			context.canvas.restore();
		}
	}
	
	@override
	bool get alwaysNeedsCompositing => child != null;
}

class SaturationExample extends StatelessWidget {
  SaturationExample({
    Key key,
    this.title = "",
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          crossAxisCount: 1,
          childAspectRatio: 0.7,
        ),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        itemBuilder: (BuildContext context, int index) {
          return KeepAlive(
            keepAlive: true,
            child: RepaintBoundary.wrap(
              TestItem(),
              index,
            ),
          );
        },
      ),
    );
  }
}