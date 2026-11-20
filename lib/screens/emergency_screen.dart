part of '../main.dart';

extension _EmergencyScreenExtension on _MainScreenState {
  Widget emergencyScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Emergency header
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 650),
            curve: Curves.easeOutBack,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _MainScreenState.red.withValues(alpha: 0.10),
                border: Border.all(
                  color: _MainScreenState.red.withValues(alpha: 0.25),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.emergency_rounded,
                color: _MainScreenState.red,
                size: 65,
              ),
            ),
          ),

          const SizedBox(height: 22),

          Text(
            tr('حالة الطوارئ', 'Emergency'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            tr(
              'معلومات الحادث وحالة الموقع',
              'Accident information and location status',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mutedColor,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          // Emergency status
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: _MainScreenState.red.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _MainScreenState.red.withValues(alpha: 0.22),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: _MainScreenState.red,
                  size: 30,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr('تنبيه طوارئ', 'Emergency Alert'),
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        tr(
                          'يرجى مراجعة بيانات الحادث',
                          'Please review the accident details',
                        ),
                        style: TextStyle(
                          color: mutedColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              tr('معلومات الحادث', 'Incident Information'),
              style: TextStyle(
                color: textColor,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.location_on_rounded,
            tr('الموقع الحالي', 'Current Location'),
            tr(
              'غير متاح - بيانات تجريبية',
              'Unavailable - Demo Data',
            ),
            _MainScreenState.orange,
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.access_time_rounded,
            tr('وقت الحادث', 'Accident Time'),
            '--:--',
            _MainScreenState.green,
          ),

          const SizedBox(height: 25),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              tr('إجراءات الطوارئ', 'Emergency Actions'),
              style: TextStyle(
                color: textColor,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 58,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone_rounded, size: 22),
              label: Text(
                tr('اتصال بالطوارئ', 'Call Emergency'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _MainScreenState.red,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: mutedColor.withValues(alpha: 0.15),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: mutedColor,
                  size: 21,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tr(
                      'هذه الشاشة تجريبية. الموقع والوقت غير متصلين بمصادر بيانات حقيقية، وزر الاتصال لا ينفذ اتصالًا فعليًا.',
                      'This screen is for demonstration only. Location and time are not connected to live data, and the call button does not place a real call.',
                    ),
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 12,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
