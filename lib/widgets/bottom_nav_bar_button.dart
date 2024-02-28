import 'package:flutter/material.dart';

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton({
    super.key,
    required this.activeStatus,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap
  });

  final bool activeStatus;
  final String icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            onTap();
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(icon, color: color)
                ),
                const SizedBox(
                  height: 5
                ),
                activeStatus ? SizedBox(
                  height: 5,
                  width: 5,
                  child: Image.asset('assets/images/icons/ic_dot.png', color: color)
                ) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
