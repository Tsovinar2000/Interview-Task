import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../view_model/localization_provider.dart'; // Import for localization

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localizationProvideer =
        Provider.of<LocalizationProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              color: Colors.green,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ),
          _item(AppLocalizations.of(context)!.home_page, theme),
          _item(AppLocalizations.of(context)!.teachers, theme),
          _item(AppLocalizations.of(context)!.donors, theme),
          _item(AppLocalizations.of(context)!.about_us, theme),
          _item(AppLocalizations.of(context)!.contact_us, theme),
          _item(AppLocalizations.of(context)!.blog, theme),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              localizationProvideer.changeLocale(Locale('en'));
            },
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Eng',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: HexColor('#3A3A3A').withOpacity(
                    localizationProvideer.locale == Locale('en') ? 1 : .5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              localizationProvideer.changeLocale(Locale('hy'));
            },
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Հայ',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: HexColor('#3A3A3A').withOpacity(
                    localizationProvideer.locale == Locale('hy') ? 1 : .5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              localizationProvideer.changeLocale(Locale('ru'));
            },
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              'Рус',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: HexColor('#3A3A3A').withOpacity(
                    localizationProvideer.locale == Locale('ru') ? 1 : .5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.login),
            title: Text(AppLocalizations.of(context)!.sign_in_menu),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _item(String text, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: HexColor('#3A3A3A'),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        Divider(
          color: theme.primaryColor,
        )
      ],
    );
  }
}
