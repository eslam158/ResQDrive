part of '../main.dart';

extension AccidentAlertScreenExtension on _MainScreenState {
Widget accidentAlertScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 32),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: _MainScreenState.red,
                    size: 75,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tr(
                      'ØªÙ… Ø§ÙƒØªØ´Ø§Ù Ø­Ø§Ø¯Ø« Ù…Ø­ØªÙ…Ù„!',
                      'Possible Accident Detected!',
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _MainScreenState.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tr('Ù‡Ù„ Ø£Ù†Øª Ø¨Ø®ÙŠØ±ØŸ', 'Are you OK?'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: _MainScreenState.red, width: 5),
                      color: cardColor,
                    ),
                    child: Center(
                      child: Text(
                        '$alertSeconds',
                        style: const TextStyle(
                          color: _MainScreenState.red,
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tr(
                      'Ø³ÙŠØªÙ… Ø§Ù„Ø§Ù†ØªÙ‚Ø§Ù„ Ø¥Ù„Ù‰ Ø´Ø§Ø´Ø© Ø§Ù„Ø·ÙˆØ§Ø±Ø¦ Ø¹Ù†Ø¯ Ø§Ù†ØªÙ‡Ø§Ø¡ Ø§Ù„Ø¹Ø¯ Ø§Ù„ØªÙ†Ø§Ø²Ù„ÙŠ',
                      'Emergency screen will appear when countdown ends',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: mutedColor),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: cancelAlert,
                      icon: const Icon(Icons.check_circle_outline),
                      label: Text(tr('Ø£Ù†Ø§ Ø¨Ø®ÙŠØ±', 'I am OK')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _MainScreenState.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      alertTimer?.cancel();
                      setState(() {
                        showAlert = false;
                        selectedIndex = 4;
                      });
                    },
                    child: Text(
                      tr('Ø¹Ø±Ø¶ Ø´Ø§Ø´Ø© Ø§Ù„Ø·ÙˆØ§Ø±Ø¦', 'Open Emergency Screen'),
                      style: const TextStyle(color: _MainScreenState.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

