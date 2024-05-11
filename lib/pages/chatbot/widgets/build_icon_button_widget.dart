import 'package:flutter/material.dart';

Widget buildIconButton(
  BuildContext context,
  VoidCallback onPressed,
  IconData icon,
  bool isGlow,
) {
  return SizedBox(
    width: 48,
    child: AspectRatio(
      aspectRatio: 1 / 1,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xFF2C3036),
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
            bottom: BorderSide(
              color: Colors.black,
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
                    top: 5, // Atur posisi vertikal
                    right: 5, // Atur posisi horizontal
                    child: Container(
                      width: 7, // Diameter titik kuning
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Warna titik
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.5), // Warna glow
                            spreadRadius: 2,
                            blurRadius: 10, // Radius glow
                            offset: const Offset(0, 0), // Posisi glow
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
