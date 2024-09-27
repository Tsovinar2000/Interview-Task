import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth/sign_up.dart';
import 'button.dart'; // For localization

void showLeavePageDialog(BuildContext context, bool donor) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.leave_page_warning,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Divider(),
            const SizedBox(height: 16.0),
            ButtonWidget(
              text: AppLocalizations.of(context)!.continue_registration,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12.0),
            ButtonWidget(
              text: AppLocalizations.of(context)!.leave_anyway,
              whiteStyle: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(
                      donor: donor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
