import 'package:flutter/material.dart';
import 'package:jokes_app/common/resource/colors.dart';

class CircleIcon extends StatefulWidget {
  final IconData icon;
  final double? width;
  final double? height;
  final bool? animate;
  final Color? iconColor;
  final Color? borderColor;

  @override
  State<CircleIcon> createState() => _CircleIconState();

  const CircleIcon({
    super.key,
    required this.icon,
    this.width,
    this.borderColor,
    this.iconColor,
    this.animate = false,
    this.height,
  });
}

class _CircleIconState extends State<CircleIcon>
    with TickerProviderStateMixin {
  late AnimationController _resizableController;

  @override
  void initState() {
    _resizableController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _resizableController.dispose();
    super.dispose();
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      height: widget.height ?? 52,
      width: widget.width ?? 52,
      decoration: BoxDecoration(
        color: AppColors.whiteAlpha52,
        border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: _resizableController.value * 5),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        widget.icon,
        color: widget.iconColor ?? AppColors.darkSpringGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate == true
        ? AnimatedBuilder(
            animation: _resizableController,
            builder: (context, child) {
              return _buildContainer(context);
            },
          )
        : _buildContainer(context);
  }
}
