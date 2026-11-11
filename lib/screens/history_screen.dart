part of '../main.dart';

extension HistoryScreenExtension on _MainScreenState {
Widget historyScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageTitle(
            tr('Ø³Ø¬Ù„ Ø§Ù„Ø±Ø­Ù„Ø§Øª', 'Trip History'),
            tr(
              'Ø¹Ø±Ø¶ Ø§Ù„Ø±Ø­Ù„Ø§Øª ÙˆØ§Ù„Ø­ÙˆØ§Ø¯Ø« Ø§Ù„Ø³Ø§Ø¨Ù‚Ø©',
              'View previous trips and accidents',
            ),
          ),
          const SizedBox(height: 25),
          infoCard(
            Icons.directions_car,
            tr('Ø¢Ø®Ø± Ø±Ø­Ù„Ø©', 'Last Trip'),
            tr('Ù„Ø§ ØªÙˆØ¬Ø¯ Ø±Ø­Ù„Ø§Øª Ù…Ø³Ø¬Ù„Ø©', 'No trips recorded'),
            _MainScreenState.green,
          ),
          const SizedBox(height: 15),
          infoCard(
            Icons.warning_amber,
            tr('Ø§Ù„Ø­ÙˆØ§Ø¯Ø«', 'Accidents'),
            tr('Ù„Ø§ ØªÙˆØ¬Ø¯ Ø­ÙˆØ§Ø¯Ø« Ù…Ø³Ø¬Ù„Ø©', 'No accidents recorded'),
            _MainScreenState.orange,
          ),
          const SizedBox(height: 15),
          infoCard(
            Icons.calendar_today,
            tr('ØªØ§Ø±ÙŠØ® Ø¢Ø®Ø± Ø±Ø­Ù„Ø©', 'Last Trip Date'),
            '--/--/----',
            _MainScreenState.green,
          ),
        ],
      ),
    );
  }

}

