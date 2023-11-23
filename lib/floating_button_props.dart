import 'package:flutter/material.dart';

class FloatingButtonProps {
  final IconData? icon;
  final Widget? customIcon;
  final String? label;
  final Function()? action;
  final BoxDecoration? labelDecoration;

  const FloatingButtonProps({
    this.label,
    this.icon,
    this.customIcon,
    this.action,
    this.labelDecoration,
  });
}
