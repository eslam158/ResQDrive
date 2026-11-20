part of '../main.dart';

extension _SettingsScreenExtension on _MainScreenState {
  Widget settingsScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageTitle(
            tr('الإعدادات', 'Settings'),
            tr('تخصيص إعدادات التطبيق', 'Customize app settings'),
          ),

          const SizedBox(height: 28),

          // Appearance section
          settingsSectionTitle(
            tr('المظهر', 'Appearance'),
          ),

          _settingsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _settingsHeader(
                  Icons.palette_outlined,
                  tr('وضع الشاشة', 'Display Mode'),
                ),
                const SizedBox(height: 14),
                _settingsOption(
                  icon: Icons.dark_mode_rounded,
                  title: tr('الوضع الداكن', 'Dark Mode'),
                  selected: widget.isDark,
                  color: _MainScreenState.green,
                  onTap: () {
                    if (!widget.isDark) {
                      widget.onThemeChanged(true);
                    }
                  },
                ),
                const SizedBox(height: 8),
                _settingsOption(
                  icon: Icons.light_mode_rounded,
                  title: tr('الوضع الفاتح', 'Light Mode'),
                  selected: !widget.isDark,
                  color: _MainScreenState.orange,
                  onTap: () {
                    if (widget.isDark) {
                      widget.onThemeChanged(false);
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Language section
          settingsSectionTitle(
            tr('اللغة', 'Language'),
          ),

          _settingsCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _settingsHeader(
                  Icons.language_rounded,
                  tr('لغة التطبيق', 'App Language'),
                ),
                const SizedBox(height: 14),
                _settingsOption(
                  icon: Icons.translate_rounded,
                  title: 'العربية',
                  selected: widget.isArabic,
                  color: _MainScreenState.green,
                  onTap: () {
                    if (!widget.isArabic) {
                      widget.onLanguageChanged(true);
                    }
                  },
                ),
                const SizedBox(height: 8),
                _settingsOption(
                  icon: Icons.translate_rounded,
                  title: 'English',
                  selected: !widget.isArabic,
                  color: _MainScreenState.green,
                  onTap: () {
                    if (widget.isArabic) {
                      widget.onLanguageChanged(false);
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // App information
          settingsSectionTitle(
            tr('حول التطبيق', 'About App'),
          ),

          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 550),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 15 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: mutedColor.withValues(alpha: 0.12),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: _MainScreenState.green.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.directions_car_rounded,
                      color: _MainScreenState.green,
                      size: 38,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Risk Drive',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    tr(
                      'نظام ذكي لمراقبة القيادة واكتشاف الحوادث',
                      'Smart Driving Monitoring and Accident Detection',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _MainScreenState.green.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tr('الإصدار 1.0.0', 'Version 1.0.0'),
                      style: const TextStyle(
                        color: _MainScreenState.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _settingsCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: mutedColor.withValues(alpha: 0.12),
        ),
      ),
      child: child,
    );
  }

  Widget _settingsHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: _MainScreenState.green,
          size: 23,
        ),
        const SizedBox(width: 11),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _settingsOption({
    required IconData icon,
    required String title,
    required bool selected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: selected
                ? color.withValues(alpha: 0.10)
                : mutedColor.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color:
                  selected ? color.withValues(alpha: 0.35) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected ? color : mutedColor,
                size: 21,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  selected
                      ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_off_rounded,
                  key: ValueKey(selected),
                  color: selected ? color : mutedColor,
                  size: 21,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
