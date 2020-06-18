import 'package:HOD_app/Invoice.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/scheduler.dart';
import 'package:HOD_app/homepage.dart';
class CustomDrawer extends StatefulWidget {
  Function callback;

  CustomDrawer(this.callback);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with TickerProviderStateMixin {
  List<String> _list = [ "Menu","Invoice","Notifcation","Settings"];
  var a;
  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  int checkIndex = 0;

  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  Offset animationOffset = Offset(0, 0);
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    checkIndex = 0;
    super.initState();

    SchedulerBinding.instance.endOfFrame.then((value) {
      calcuteCheckOffset();
      addAnimation();
    });
  }

  

  void calcuteCheckOffset() {
    lastCheckOffset = checkedPositionOffset;
    RenderBox renderBox = _keys[checkIndex].currentContext.findRenderObject();
    Offset widgetOffset = renderBox.localToGlobal(Offset(0, 0));
    Size widgetSise = renderBox.size;
    checkedPositionOffset = Offset(widgetOffset.dx + widgetSise.width,
        widgetOffset.dy + widgetSise.height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xff1B3F8B),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                ),
            ),
            child: Column(
              children: _buildList(),
            ),
          ),
          Positioned(
            top: animationOffset.dy,
            left: animationOffset.dx,
            child: CustomPaint(
              painter: CheckPointPainter(Offset(10, -50)),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _widget_list = [];

  
    for (int i = 0; i < _list.length; i++) {
      _widget_list.add(Expanded(
        child: GestureDetector(
            onTap: () {
              indexChecked(i);
            },
            child: VerticalText(
                _list[i],
                _keys[i],
                checkIndex == i &&
                    (_animationController != null &&
                        _animationController.isCompleted))),
      ));
    }
    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
        bottom: 50,
      ),
      child: Icon(
        Icons.fastfood,
        color: Colors.white,
        size: 30,
      ),
    ));
    return _widget_list;
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;
    
    setState(() {
      checkIndex = i;
      calcuteCheckOffset();
      addAnimation();
      this.widget.callback(i);
    });
  }

  void addAnimation() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(() {
            setState(() {
              animationOffset =
                  Offset(checkedPositionOffset.dx, _animation.value);
            });
          });

    _animation = Tween(begin: lastCheckOffset.dy, end: checkedPositionOffset.dy)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack));
    _animationController.forward();
  }
}

class CheckPointPainter extends CustomPainter {
  double pointRadius = 5;
  double radius = 30;

  Offset offset;

  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi;

    paint.color = Color(0xff1B3F8B);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(offset.dx, offset.dy), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint);

    paint.color = Color(0xffffffff);
    canvas.drawCircle(
        Offset(offset.dx - pointRadius / 2, offset.dy - pointRadius / 2),
        pointRadius,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class VerticalText extends StatelessWidget {
  final String name;
  final bool checked;
  final GlobalKey globalKey;

  VerticalText(this.name, this.globalKey, this.checked);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: 3,
      child: Text(
        name,
        style: TextStyle(
          color:Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}