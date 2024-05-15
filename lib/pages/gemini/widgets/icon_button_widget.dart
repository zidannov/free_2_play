import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final BuildContext context;
  final VoidCallback onPressed;
  final IconData icon;
  final bool isGlow;

  const IconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.isGlow,
    required this.context,
  });

  @override
  Widget build(context) {
    return SizedBox(
      width: 48,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFF2C3036),
            border: Border(
              top: BorderSide(
                color: Color(0xFF111114),
                width: 1.5,
              ),
              right: BorderSide(
                color: Color(0xFF111114),
                width: 1.5,
              ),
              bottom: BorderSide(
                color: Color(0xFF111114),
                width: 1.5,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(
                  icon,
                  color: const Color(0xFF898989),
                ),
                onPressed: onPressed,
              ),
              isGlow
                  ? Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.yellow.withOpacity(0.5), // Warna glow
                              spreadRadius: 2,
                              blurRadius: 10, // Radius glow
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
