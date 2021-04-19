import 'package:bluestack_task/theme/theme-one.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends Container {
  RoundedContainer({
    Key key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.inverted = false,
  }) : constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints;

  final Widget child;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Decoration decoration;
  final Decoration foregroundDecoration;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final Matrix4 transform;
  final AlignmentGeometry transformAlignment;
  final Clip clipBehavior;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: this.alignment,
      padding: this.padding,
      color: this.color,
      foregroundDecoration: this.foregroundDecoration,
      constraints: this.constraints,
      margin: this.margin,
      transform: this.transform,
      clipBehavior: this.clipBehavior,
      decoration: BoxDecoration(
//        border:  Border.all(color: Colors.orange),
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: inverted
              ? BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100))
              : BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100)),

          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ]),
      child: this.child,
    );
  }
}
