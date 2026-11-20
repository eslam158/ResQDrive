part of '../main.dart';

extension _AccidentAlertScreenExtension on _MainScreenState {
  Widget accidentAlertScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - 40,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.85, end: 1.0),
                    duration: const Duration(milliseconds: 700),
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
                        Icons.warning_amber_rounded,
                        color: _MainScreenState.red,
                        size: 65,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    tr(
                      'تم اكتشاف حادث محتمل!',
                      'Possible Accident Detected!',
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _MainScreenState.red,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tr('هل أنت بخير؟', 'Are you OK?'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tr(
                      'يرجى تأكيد حالتك قبل انتهاء الوقت',
                      'Please confirm your safety before time runs out',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: _MainScreenState.red.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          tr('الوقت المتبقي', 'TIME REMAINING'),
                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 18),
                        TweenAnimationBuilder<double>(
                          key: ValueKey(alertSeconds),
                          tween: Tween(begin: 0.85, end: 1.0),
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          builder: (context, scale, child) {
                            return Transform.scale(
                              scale: scale,
                              child: child,
                            );
                          },
                          child: Container(
                            width: 145,
                            height: 145,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _MainScreenState.red.withValues(
                                alpha: 0.08,
                              ),
                              border: Border.all(
                                color: _MainScreenState.red,
                                width: 5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _MainScreenState.red.withValues(
                                    alpha: 0.12,
                                  ),
                                  blurRadius: 20,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '$alertSeconds',
                                style: const TextStyle(
                                  color: _MainScreenState.red,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          tr('ثانية', 'SECONDS'),
                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _MainScreenState.orange.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _MainScreenState.orange.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: _MainScreenState.orange,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            tr(
                              'عند انتهاء العد التنازلي، سيتم الانتقال إلى شاشة الطوارئ.',
                              'When the countdown ends, the emergency screen will open.',
                            ),
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton.icon(
                      onPressed: cancelAlert,
                      icon: const Icon(
                        Icons.check_circle_outline_rounded,
                        size: 23,
                      ),
                      label: Text(
                        tr('أنا بخير', 'I am OK'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _MainScreenState.green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: () => changeTab(4),
                      icon: const Icon(Icons.emergency_rounded),
                      label: Text(
                        tr(
                          'فتح شاشة الطوارئ',
                          'Open Emergency Screen',
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _MainScreenState.red,
                        side: BorderSide(
                          color: _MainScreenState.red.withValues(alpha: 0.5),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
