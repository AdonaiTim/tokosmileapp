import 'package:flutter/material.dart';
import 'package:tokosmile/config/constants.dart';
class CustomBtn extends StatelessWidget {
  final bool isBusy;
  final String title;
  final Color color;
  const CustomBtn({
    Key? key,
    this.isBusy= false,
    this.title="Label",
    this.color = blackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: /*isBusy ? const LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: [Colors.white],
                      strokeWidth: 2,
                      pathBackgroundColor: Colors
                          .black) :*/
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        fontSize: medium),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  }
}