part of '../main.dart';

extension _HomeScreenExtension on _MainScreenState {
  Widget homeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('مرحباً 👋', 'Welcome 👋'),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tr(
                    'رحلتك بأمان تبدأ من هنا',
                    'Your safety journey starts here',
                  ),
                  style: TextStyle(
                    color: mutedColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Safety Status Card
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isMonitoring
                    ? [
                        const Color(0xFF087F5B),
                        const Color(0xFF16A36A),
                      ]
                    : widget.isDark
                        ? [
                            const Color(0xFF26364A),
                            const Color(0xFF1D2939),
                          ]
                        : [
                            Colors.white,
                            const Color(0xFFF0F5F3),
                          ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isMonitoring
                    ? Colors.greenAccent.withValues(alpha: 0.3)
                    : Colors.white.withValues(alpha: 0.06),
              ),
              boxShadow: [
                BoxShadow(
                  color: (isMonitoring ? _MainScreenState.green : Colors.black)
                      .withValues(alpha: 0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.shield_rounded,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        tr('حالة الأمان', 'Safety Status'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (isMonitoring)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.17),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              tr('مباشر', 'LIVE'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 25),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    isMonitoring
                        ? tr('المراقبة نشطة', 'Monitoring Active')
                        : tr('المراقبة متوقفة', 'Monitoring Stopped'),
                    key: ValueKey(isMonitoring),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  isMonitoring
                      ? tr(
                          'النظام يتابع حالة رحلتك حالياً',
                          'Your trip is currently being monitored',
                        )
                      : tr(
                          'ابدأ المراقبة لمتابعة حالة رحلتك',
                          'Start monitoring to track your trip',
                        ),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: toggleMonitoring,
                    icon: Icon(
                      isMonitoring
                          ? Icons.stop_rounded
                          : Icons.play_arrow_rounded,
                    ),
                    label: Text(
                      isMonitoring
                          ? tr('إيقاف المراقبة', 'Stop Monitoring')
                          : tr('بدء المراقبة', 'Start Monitoring'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: isMonitoring
                          ? const Color(0xFF087F5B)
                          : const Color(0xFF101827),
                      elevation: 0,
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

          // Trip Information
          Text(
            tr('معلومات الرحلة', 'Trip Information'),
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
                  Icons.speed_rounded,
                  tr('السرعة', 'Speed'),
                  '0 km/h',
                  _MainScreenState.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: infoCard(
                  Icons.location_on_rounded,
                  'GPS',
                  tr('غير متصل', 'Not Connected'),
                  _MainScreenState.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Quick Actions
          Text(
            tr('اختصارات سريعة', 'Quick Actions'),
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
                child: quickButton(
                  Icons.monitor_heart_outlined,
                  tr('المراقبة', 'Monitoring'),
                  () => changeTab(1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: quickButton(
                  Icons.history_rounded,
                  tr('السجل', 'History'),
                  () => changeTab(2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
