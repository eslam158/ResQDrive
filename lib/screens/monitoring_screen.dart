part of '../main.dart';

extension _MonitoringScreenExtension on _MainScreenState {
  Widget monitoringScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageTitle(
            tr('مراقبة القيادة', 'Driving Monitoring'),
            tr(
              'متابعة حالة النظام أثناء القيادة',
              'Monitor system status while driving',
            ),
          ),
          const SizedBox(height: 25),

          // Monitoring status
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            padding: const EdgeInsets.all(22),
            width: double.infinity,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isMonitoring
                    ? _MainScreenState.green.withValues(alpha: 0.35)
                    : Colors.white.withValues(alpha: 0.05),
              ),
            ),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (isMonitoring ? _MainScreenState.green : mutedColor)
                        .withValues(alpha: 0.12),
                  ),
                  child: Icon(
                    isMonitoring ? Icons.shield_rounded : Icons.shield_outlined,
                    color: isMonitoring ? _MainScreenState.green : mutedColor,
                    size: 45,
                  ),
                ),
                const SizedBox(height: 18),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    isMonitoring
                        ? tr('المراقبة نشطة', 'Monitoring Active')
                        : tr('المراقبة متوقفة', 'Monitoring Stopped'),
                    key: ValueKey(isMonitoring),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isMonitoring ? _MainScreenState.green : textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isMonitoring
                      ? tr(
                          'النظام يعمل على متابعة مؤشرات القيادة',
                          'System is tracking driving indicators',
                        )
                      : tr(
                          'قم بتشغيل المراقبة لبدء متابعة الرحلة',
                          'Enable monitoring to start tracking your trip',
                        ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mutedColor,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: toggleMonitoring,
                    icon: Icon(
                      isMonitoring
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                    label: Text(
                      isMonitoring
                          ? tr('إيقاف المراقبة', 'Stop Monitoring')
                          : tr('بدء المراقبة', 'Start Monitoring'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _MainScreenState.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Sensor section
          Text(
            tr('حالة المستشعرات', 'Sensor Status'),
            style: TextStyle(
              color: textColor,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: infoCard(
                  Icons.vibration_rounded,
                  'Accelerometer',
                  tr('بيانات تجريبية', 'Demo Data'),
                  _MainScreenState.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: infoCard(
                  Icons.rotate_90_degrees_ccw_rounded,
                  'Gyroscope',
                  tr('بيانات تجريبية', 'Demo Data'),
                  _MainScreenState.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.location_on_rounded,
            'GPS',
            tr('بيانات تجريبية', 'Demo Data'),
            _MainScreenState.green,
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.speed_rounded,
            tr('السرعة الحالية', 'Current Speed'),
            '0 km/h',
            _MainScreenState.green,
          ),

          const SizedBox(height: 28),

          // Accident test
          Text(
            tr('اختبار النظام', 'System Test'),
            style: TextStyle(
              color: textColor,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),

          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: startAccidentAlert,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: _MainScreenState.red.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _MainScreenState.red.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _MainScreenState.red.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: _MainScreenState.red,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr(
                              'اختبار تنبيه الحادث',
                              'Test Accident Alert',
                            ),
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tr(
                              'اختبار شاشة التنبيه',
                              'Test the accident alert screen',
                            ),
                            style: TextStyle(
                              color: mutedColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: _MainScreenState.red,
                      size: 17,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Text(
              tr(
                'زر تجريبي لاختبار شاشة التنبيه',
                'Demo button for testing the alert screen',
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mutedColor,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
