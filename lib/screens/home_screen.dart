part of '../main.dart';

extension HomeScreenExtension on _MainScreenState {
Widget homeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('Ù…Ø±Ø­Ø¨Ù‹Ø§ ðŸ‘‹', 'Welcome ðŸ‘‹'),
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tr(
              'Ø±Ø­Ù„ØªÙƒ Ø¨Ø£Ù…Ø§Ù† ØªØ¨Ø¯Ø£ Ù…Ù† Ù‡Ù†Ø§',
              'Your safety journey starts here',
            ),
            style: TextStyle(color: mutedColor, fontSize: 15),
          ),
          const SizedBox(height: 25),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.shield, color: _MainScreenState.green, size: 27),
                    const SizedBox(width: 10),
                    Text(
                      tr('Ø­Ø§Ù„Ø© Ø§Ù„Ø£Ù…Ø§Ù†', 'Safety Status'),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  isMonitoring
                      ? tr('Ø§Ù„Ù…Ø±Ø§Ù‚Ø¨Ø© Ù†Ø´Ø·Ø©', 'Monitoring Active')
                      : tr('Ø§Ù„Ù…Ø±Ø§Ù‚Ø¨Ø© Ù…ØªÙˆÙ‚ÙØ©', 'Monitoring Stopped'),
                  style: TextStyle(
                    color: isMonitoring ? _MainScreenState.green : mutedColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tr(
                    'Ù†Ø¸Ø§Ù…Ùƒ Ø¬Ø§Ù‡Ø² Ù„Ù…ØªØ§Ø¨Ø¹Ø© Ø±Ø­Ù„ØªÙƒ',
                    'Your system is ready to monitor your trip',
                  ),
                  style: TextStyle(color: mutedColor),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isMonitoring = !isMonitoring;
                      });
                    },
                    icon: Icon(
                      isMonitoring ? Icons.stop : Icons.play_arrow,
                    ),
                    label: Text(
                      isMonitoring
                          ? tr('Ø¥ÙŠÙ‚Ø§Ù Ø§Ù„Ù…Ø±Ø§Ù‚Ø¨Ø©', 'Stop Monitoring')
                          : tr('Ø¨Ø¯Ø¡ Ø§Ù„Ù…Ø±Ø§Ù‚Ø¨Ø©', 'Start Monitoring'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _MainScreenState.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: infoCard(
                  Icons.speed,
                  tr('Ø§Ù„Ø³Ø±Ø¹Ø©', 'Speed'),
                  '0 km/h',
                  _MainScreenState.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: infoCard(
                  Icons.location_on_outlined,
                  'GPS',
                  tr('ØºÙŠØ± Ù…ØªØµÙ„', 'Not Connected'),
                  _MainScreenState.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            tr('Ø§Ø®ØªØµØ§Ø±Ø§Øª Ø³Ø±ÙŠØ¹Ø©', 'Quick Actions'),
            style: TextStyle(
              color: textColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: quickButton(
                  Icons.monitor_heart_outlined,
                  tr('Ø§Ù„Ù…Ø±Ø§Ù‚Ø¨Ø©', 'Monitoring'),
                      () => changeTab(1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: quickButton(
                  Icons.history,
                  tr('Ø§Ù„Ø³Ø¬Ù„', 'History'),
                      () => changeTab(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

