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
          // Web view (larger screens)
          return const WebHeader();
        } else {
          // Mobile view (smaller screens)
          return const MobileHeader();
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
            children: [
              Spacer(),
              Center(
                child: Image.asset('assets/logo.png', height: 65),
              ),
              Spacer(),
              Row(children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Eng',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Հայ',
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    localizationProvideer.changeLocale(Locale('ru'));
                  },
                  child: Text(
                    'Рус',
                    style: theme.textTheme.headlineSmall,
                  ),
                )
              ]),
            ],
          ),
          Row(
            children: [
              Spacer(),
              _navItem('TEACHERS', theme),
              const SizedBox(width: 20),
              _navItem('DONORS', theme),
              const SizedBox(width: 20),
              _navItem('ABOUT US', theme),
              const SizedBox(width: 20),
              _navItem('CONTACT US', theme),
              const SizedBox(width: 20),
              _navItem('BLOG', theme),
              const SizedBox(width: 20),
              Spacer(),
              const Icon(Icons.login, color: Colors.white), // Sign in icon
              Text('Sign In', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String text, ThemeData theme) {
    return Text(
      text,
      style: theme.textTheme.headlineMedium,
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
        Spacer(
          flex: 3,
        ),
        Center(
          child: Image.asset(
            'assets/logo_mobile.png',
            height: 48,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        GestureDetector(
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
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
