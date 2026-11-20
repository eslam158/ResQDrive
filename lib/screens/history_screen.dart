part of '../main.dart';

extension _HistoryScreenExtension on _MainScreenState {
  Widget historyScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageTitle(
            tr('سجل الرحلات', 'Trip History'),
            tr(
              'عرض الرحلات والحوادث السابقة',
              'View previous trips and accidents',
            ),
          ),

          const SizedBox(height: 25),

          // Summary cards
          Row(
            children: [
              Expanded(
                child: _historySummaryCard(
                  icon: Icons.directions_car_rounded,
                  title: tr('الرحلات', 'Trips'),
                  value: '0',
                  color: _MainScreenState.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _historySummaryCard(
                  icon: Icons.warning_amber_rounded,
                  title: tr('الحوادث', 'Accidents'),
                  value: '0',
                  color: _MainScreenState.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Text(
            tr('ملخص النشاط', 'Activity Summary'),
            style: TextStyle(
              color: textColor,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.directions_car_rounded,
            tr('آخر رحلة', 'Last Trip'),
            tr('لا توجد رحلات مسجلة', 'No trips recorded'),
            _MainScreenState.green,
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.warning_amber_rounded,
            tr('الحوادث المسجلة', 'Recorded Accidents'),
            tr('لا توجد حوادث مسجلة', 'No accidents recorded'),
            _MainScreenState.orange,
          ),

          const SizedBox(height: 14),

          infoCard(
            Icons.calendar_today_rounded,
            tr('تاريخ آخر رحلة', 'Last Trip Date'),
            '--/--/----',
            _MainScreenState.green,
          ),

          const SizedBox(height: 28),

          Text(
            tr('الرحلات السابقة', 'Previous Trips'),
            style: TextStyle(
              color: textColor,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 14),

          // Empty state
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
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
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: mutedColor.withValues(alpha: 0.15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mutedColor.withValues(alpha: 0.10),
                    ),
                    child: Icon(
                      Icons.history_rounded,
                      size: 38,
                      color: mutedColor,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    tr('لا توجد رحلات حتى الآن', 'No Trips Yet'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr(
                      'ستظهر تفاصيل رحلاتك هنا بعد تسجيلها في التطبيق.',
                      'Your trip details will appear here once they are recorded.',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 12,
                      height: 1.6,
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

  Widget _historySummaryCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
              size: 23,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: mutedColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
