import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String? description;
  final bool? showCancelIcon;
  const AuthTitle(
      {super.key, required this.title, this.description, this.showCancelIcon});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                title,
                style: theme.textTheme.headlineLarge,
              ),
              Spacer(),
              showCancelIcon == true
                  ? InkWell(
                      child: Icon(Icons.clear),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  : SizedBox()
            ],
          ),
        ),
        Text(
          description ?? '',
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Divider(),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
