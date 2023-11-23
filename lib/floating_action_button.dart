import 'package:animated_floating_button_pro/floating_button_props.dart';
import 'package:flutter/material.dart';

class AnimatedFloatingButton extends StatelessWidget {
  const AnimatedFloatingButton({
    super.key,
    required this.childrenProps,
    this.mainButtonColor,
    this.isDismissible = false,
    this.shadowColor,
    this.direction = TextDirection.rtl,
    this.labelStyle,
    this.shadowCurve = Curves.linear,
    this.buttonsCurve = Curves.linear,
    this.duration = const Duration(milliseconds: 250),
    this.openIcon = const Icon(Icons.add, color: Colors.white),
    this.closeIcon = const Icon(Icons.close, color: Colors.white),
  });

  final List<FloatingButtonProps> childrenProps;
  final Color? mainButtonColor;
  final bool isDismissible;
  final Color? shadowColor;
  final TextDirection direction;
  final TextStyle? labelStyle;
  final Curve shadowCurve;
  final Curve buttonsCurve;
  final Duration duration;
  final Widget? openIcon;
  final Widget? closeIcon;

  @override
  Widget build(BuildContext context) => FloatingActionButtonScreen(
        childrenProps: childrenProps,
        mainButtonColor: mainButtonColor,
        isDismissible: isDismissible,
        shadowColor: shadowColor,
        direction: direction,
        labelStyle: labelStyle,
        shadowCurve: shadowCurve,
        buttonsCurve: buttonsCurve,
        duration: duration,
        openIcon: openIcon,
      );
}

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({
    super.key,
    required this.childrenProps,
    this.mainButtonColor,
    this.isDismissible = false,
    this.shadowColor,
    this.direction = TextDirection.rtl,
    this.labelStyle,
    this.shadowCurve = Curves.linear,
    this.buttonsCurve = Curves.linear,
    this.duration = const Duration(milliseconds: 250),
    this.openIcon = const Icon(Icons.add, color: Colors.white),
    this.closeIcon = const Icon(Icons.close, color: Colors.white),
  });

  final List<FloatingButtonProps> childrenProps;
  final Color? mainButtonColor;
  final bool isDismissible;
  final Color? shadowColor;
  final TextDirection direction;
  final TextStyle? labelStyle;
  final Curve shadowCurve;
  final Curve buttonsCurve;
  final Duration duration;
  final Widget? openIcon;
  final Widget? closeIcon;

  @override
  State<FloatingActionButtonScreen> createState() =>
      _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState extends State<FloatingActionButtonScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    _controller = AnimationController(
      value: _open ? 0.0 : 0.0,
      duration: widget.duration,
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.direction,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          InkWell(
            onTap: () {
              if (widget.isDismissible && _open) {
                _toggle();
              }
            },
            child: SizeTransition(
              sizeFactor: _expandAnimation,
              child: Container(
                color: widget.shadowColor ?? Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kToolbarHeight + kFloatingActionButtonMargin,
                horizontal: kFloatingActionButtonMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: double.infinity),
                SizeTransition(
                  sizeFactor: _expandAnimation,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: widget.childrenProps
                          .map(
                            (child) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: InkWell(
                                onTap: child.action,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  textDirection:
                                      widget.direction == TextDirection.rtl
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  children: [
                                    FloatingActionButton(
                                      onPressed: child.action ?? () {},
                                      child: child.customIcon ??
                                          (child.icon != null
                                              ? Icon(child.icon)
                                              : null),
                                    ),
                                    if (child.label != null)
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        padding: const EdgeInsets.all(4),
                                        decoration: child.labelDecoration ??
                                            BoxDecoration(
                                              // color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                        child: Text(child.label!,
                                            style: widget.labelStyle),
                                      ),
                                    // const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: widget.mainButtonColor,
                  onPressed: () => _toggle(),
                  child: _open ? widget.closeIcon : widget.openIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
