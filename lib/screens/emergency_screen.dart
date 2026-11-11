part of '../main.dart';

extension EmergencyScreenExtension on _MainScreenState {
Widget emergencyScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.emergency, color: _MainScreenState.red, size: 75),
          const SizedBox(height: 15),
          Text(
            tr('Ø­Ø§Ù„Ø© Ø§Ù„Ø·ÙˆØ§Ø±Ø¦', 'Emergency'),
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            tr(
              'Ù‡Ø°Ù‡ Ø´Ø§Ø´Ø© Ø§Ù„Ø·ÙˆØ§Ø±Ø¦ Ø§Ù„Ø®Ø§ØµØ© Ø¨Ø§Ù„ØªØ·Ø¨ÙŠÙ‚',
              'This is the emergency screen',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: mutedColor),
          ),
          const SizedBox(height: 30),
          infoCard(
            Icons.location_on,
            tr('Ø§Ù„Ù…ÙˆÙ‚Ø¹ Ø§Ù„Ø­Ø§Ù„ÙŠ', 'Current Location'),
            tr(
              'ØºÙŠØ± Ù…ØªØ§Ø­ - Ø¨ÙŠØ§Ù†Ø§Øª ØªØ¬Ø±ÙŠØ¨ÙŠØ©',
              'Unavailable - Demo Data',
            ),
            _MainScreenState.orange,
          ),
          const SizedBox(height: 15),
          infoCard(
            Icons.access_time,
            tr('ÙˆÙ‚Øª Ø§Ù„Ø­Ø§Ø¯Ø«', 'Accident Time'),
            '--:--',
            _MainScreenState.green,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: Text(tr('Ø§ØªØµØ§Ù„ Ø¨Ø§Ù„Ø·ÙˆØ§Ø±Ø¦', 'Call Emergency')),
              style: ElevatedButton.styleFrom(
                backgroundColor: _MainScreenState.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            tr(
              'Ø§Ù„Ø£Ø²Ø±Ø§Ø± Ù‡Ù†Ø§ Ù„Ù„Ø¹Ø±Ø¶ Ø§Ù„ØªØ¬Ø±ÙŠØ¨ÙŠ ÙÙ‚Ø· ÙˆÙ„Ø§ ØªÙ†ÙØ° Ø§ØªØµØ§Ù„Ù‹Ø§ Ø­Ù‚ÙŠÙ‚ÙŠÙ‹Ø§',
              'Buttons are for UI demonstration only',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: mutedColor, fontSize: 12),
          ),
        ],
      ),
    );
  }

}

