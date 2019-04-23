import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  Animation childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    //animationControllerCircle =
    //  AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    //animation = Tween(begin: -0.0, end: 0.0).animate(
    //   CurvedAnimation(parent: animationController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    childAnimation = Tween(begin: 1.0, end: .7).animate(CurvedAnimation(
        reverseCurve: Curves.easeInBack,
        parent: animationController,
        curve: Curves.elasticIn));

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    Future.delayed(Duration(seconds: 3), () {
      animationController.forward();
    });

    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Stack(
        alignment: Alignment.center,
        children: [
          _buildCirculeProgress(width, 3),
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return new Container(
                  child: Center(
                    child: Transform.scale(
                      scale: childAnimation.value,
                      child: Container(
                        width: width / 3,
                        height: width / 3,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png"))),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  _buildCirculeProgress(double width, int count) {
    List<Widget> widget = [];
    for (int i = 0; i < count; i++) {
      widget.add(CircleAnimationWidget(Size(width, width), i));
    }
    return Stack(
      children: widget,
    );
  }
}

class CircleAnimationWidget extends StatefulWidget {
  Size containerSize;
  int delayAnimation;

  CircleAnimationWidget(this.containerSize, this.delayAnimation);

  @override
  State<StatefulWidget> createState() => _CirculeAnimationWidgetState();
}

class _CirculeAnimationWidgetState extends State<CircleAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animationTranslation, animationOpacity;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    animationTranslation = Tween(begin: .0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animationOpacity = Tween(begin: 1.0, end: .0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInCirc));
  }

  Future _startPaperAnimation() async {
    try {
      await animationController
          .repeat() // start paper animation over
          .orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: widget.delayAnimation), () => _startPaperAnimation());
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return buildChildren(widget.containerSize.width);
        });
  }

  buildChildren(width) {
    return Container(
      child: Center(
        child: Opacity(
          opacity: (0.3 * animationOpacity.value),
          child: Container(
            //scale: childAnimation.value,
            child: Container(
              width: width / 3 + (width * 2 / 3) * animationTranslation.value,
              height: width / 3 + (width * 2 / 3) * animationTranslation.value,
              decoration:
                  new BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
