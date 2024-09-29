import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../view_model/localization_provider.dart';
import 'bottom_menu.dart';

class ResponsiveHeader extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return const WebHeader();
        } else {
          return SizedBox(height: 60, child: const MobileHeader());
        }
      },
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kIsWeb ? 120 : kToolbarHeight);
}

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var localizationProvideer =
        Provider.of<LocalizationProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: theme.primaryColor, // Match the color from your image
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 100,
              ),
              const Spacer(),
              Image.asset('assets/logo.png', height: 65),
              const Spacer(),
              SizedBox(
                width: 100,
                child: Row(children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Eng',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Հայ',
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      localizationProvideer.changeLocale(const Locale('ru'));
                    },
                    child: Text(
                      'Рус',
                      style: theme.textTheme.headlineSmall,
                    ),
                  )
                ]),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 115,
              ),
              const Spacer(),
              _navItem(AppLocalizations.of(context)!.teachers, theme),
              _navItem(AppLocalizations.of(context)!.donors, theme),
              _navItem(AppLocalizations.of(context)!.about_us, theme),
              _navItem(AppLocalizations.of(context)!.contact_us, theme),
              _navItem(AppLocalizations.of(context)!.blog, theme),
              const Spacer(),
              const Icon(Icons.login, color: Colors.white), // Sign in icon
              Container(
                width: 115,
                child: Text(AppLocalizations.of(context)!.sign_in,
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Text(
        text,
        style: theme.textTheme.headlineMedium,
      ),
    );
  }
}

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.primaryColor,
      automaticallyImplyLeading: false,
      actions: [
        SizedBox(
          width: 100,
        ),
        Spacer(),
        Center(
          child: Image.asset(
            'assets/logo_mobile.png',
            height: 48,
          ),
        ),
        Spacer(),
        SizedBox(
          width: 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Allows custom height
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height *
                            0.6, // 50% of screen height
                        child: BottomMenu(),
                      );
                    },
                  );
                },
                child: Image.asset(
                  'assets/drawer_icon.png',
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
