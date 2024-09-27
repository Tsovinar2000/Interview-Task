import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? whiteStyle;
  const ButtonWidget(
      {super.key, required this.text, required this.onTap, this.whiteStyle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
              color: whiteStyle == true ? HexColor('#194866') : Colors.white,
              fontWeight: FontWeight.w600),
        ),
        style: theme.elevatedButtonTheme.style!.copyWith(
          backgroundColor: WidgetStateProperty.all(
            whiteStyle == true ? Colors.white : HexColor('#34C88A'),
          ),
        ),
      ),
    );
  }
}
