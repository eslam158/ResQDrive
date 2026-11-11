part of '../main.dart';

extension MonitoringScreenExtension on _MainScreenState {
Widget monitoringScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageTitle(
            tr('Ù…Ø±Ø§Ù‚Ø¨Ø© Ø§Ù„Ù‚ÙŠØ§Ø¯Ø©', 'Driving Monitoring'),
            tr(
              'Ù…ØªØ§Ø¨Ø¹Ø© Ø­Ø§Ù„Ø© Ø§Ù„Ù†Ø¸Ø§Ù… Ø£Ø«Ù†Ø§Ø¡ Ø§Ù„Ù‚ÙŠØ§Ø¯Ø©',
              'Monitor system status while driving',
            ),
          ),
          const SizedBox(height: 22),
          statusCard(
            tr('Ø­Ø§Ù„Ø© Ø§Ù„Ù…Ø±Ø§Ù‚Ø¨Ø©', 'Monitoring Status'),
            isMonitoring
                ? tr('Ù†Ø´Ø·Ø©', 'Active')
                : tr('Ù…ØªÙˆÙ‚ÙØ©', 'Stopped'),
            isMonitoring ? _MainScreenState.green : mutedColor,
            Icons.monitor_heart,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: infoCard(
                  Icons.vibration,
                  'Accelerometer',
                  'Demo',
                  _MainScreenState.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: infoCard(
                  Icons.screen_rotation,
                  'Gyroscope',
                  'Demo',
                  _MainScreenState.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          infoCard(
            Icons.location_on_outlined,
            'GPS',
            tr('Ø¨ÙŠØ§Ù†Ø§Øª ØªØ¬Ø±ÙŠØ¨ÙŠØ©', 'Demo Data'),
            _MainScreenState.green,
          ),
          const SizedBox(height: 15),
          infoCard(
            Icons.speed,
            tr('Ø§Ù„Ø³Ø±Ø¹Ø© Ø§Ù„Ø­Ø§Ù„ÙŠØ©', 'Current Speed'),
            '0 km/h',
            _MainScreenState.green,
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: startAccidentAlert,
              icon: const Icon(Icons.warning_amber_rounded),
              label: Text(
                tr('ØªØ¬Ø±Ø¨Ø© ØªÙ†Ø¨ÙŠÙ‡ Ø§Ù„Ø­Ø§Ø¯Ø«', 'Test Accident Alert'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _MainScreenState.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              tr(
                'Ø²Ø± ØªØ¬Ø±ÙŠØ¨ÙŠ Ù„Ø§Ø®ØªØ¨Ø§Ø± Ø´Ø§Ø´Ø© Ø§Ù„ØªÙ†Ø¨ÙŠÙ‡',
                'Demo button to test the alert screen',
              ),
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

}

