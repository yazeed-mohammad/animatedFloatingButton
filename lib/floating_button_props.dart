import 'package:flutter/material.dart';

///floatingActionButton properties
class FloatingButtonProps {
  ///icon: button icon
  final IconData? icon;

  ///customIcon: if you need to set custom widget as icon
  final Widget? customIcon;

  ///label: shown text beside action button
  ///if label is null, label widget will be hidden
  final String? label;

  ///action: this function called when user click on floatingActionButton
  final Function()? action;

  ///labelDecoration: if you need to add custom decoration for label
  final BoxDecoration? labelDecoration;

  ///backgroundColor: floatingActionButton background color
  final Color? backgroundColor;

  ///labelStyle: specific floatingActionButton label textStyle [TextStyle]
  final TextStyle? labelStyle;

  const FloatingButtonProps({
    this.label,
    this.icon,
    this.customIcon,
    this.action,
    this.labelDecoration,
    this.backgroundColor,
    this.labelStyle,
  });
}
