part of '../main.dart';

extension SettingsScreenExtension on _MainScreenState {
Widget settingsScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageTitle(
            tr('Ø§Ù„Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª', 'Settings'),
            tr('ØªØ®ØµÙŠØµ Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª Ø§Ù„ØªØ·Ø¨ÙŠÙ‚', 'Customize app settings'),
          ),
          const SizedBox(height: 25),
          settingsSectionTitle(tr('Ø§Ù„Ù…Ø¸Ù‡Ø±', 'Appearance')),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.palette_outlined, color: _MainScreenState.green),
                    const SizedBox(width: 10),
                    Text(
                      tr('ÙˆØ¶Ø¹ Ø§Ù„Ø´Ø§Ø´Ø©', 'Display Mode'),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                RadioListTile<bool>(
                  value: true,
                  groupValue: widget.isDark,
                  activeColor: _MainScreenState.green,
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      Icon(Icons.dark_mode, color: mutedColor),
                      const SizedBox(width: 10),
                      Text(
                        tr('Ø§Ù„ÙˆØ¶Ø¹ Ø§Ù„Ø¯Ø§ÙƒÙ†', 'Dark Mode'),
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      widget.onThemeChanged(value);
                    }
                  },
                ),
                RadioListTile<bool>(
                  value: false,
                  groupValue: widget.isDark,
                  activeColor: _MainScreenState.green,
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      const Icon(Icons.light_mode, color: _MainScreenState.orange),
                      const SizedBox(width: 10),
                      Text(
                        tr('Ø§Ù„ÙˆØ¶Ø¹ Ø§Ù„ÙØ§ØªØ­', 'Light Mode'),
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      widget.onThemeChanged(value);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          settingsSectionTitle(tr('Ø§Ù„Ù„ØºØ©', 'Language')),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.language, color: _MainScreenState.green),
                    const SizedBox(width: 10),
                    Text(
                      tr('Ù„ØºØ© Ø§Ù„ØªØ·Ø¨ÙŠÙ‚', 'App Language'),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                RadioListTile<bool>(
                  value: true,
                  groupValue: widget.isArabic,
                  activeColor: _MainScreenState.green,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©',
                    style: TextStyle(color: textColor),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      widget.onLanguageChanged(value);
                    }
                  },
                ),
                RadioListTile<bool>(
                  value: false,
                  groupValue: widget.isArabic,
                  activeColor: _MainScreenState.green,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'English',
                    style: TextStyle(color: textColor),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      widget.onLanguageChanged(value);
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.directions_car,
                  color: _MainScreenState.green,
                  size: 35,
                ),
                const SizedBox(height: 8),
                Text(
                  'Risk Drive',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  tr('Ø§Ù„Ø¥ØµØ¯Ø§Ø± 1.0.0', 'Version 1.0.0'),
                  style: TextStyle(color: mutedColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

