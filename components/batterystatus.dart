import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class CustomBatteryStatus extends StatelessWidget {
  final BatteryState batteryState;
  final int batteryLevel;
  final VoidCallback onClose;

  const CustomBatteryStatus({
    Key? key,
    required this.batteryState,
    required this.batteryLevel,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double size = 200;
    TextStyle style = TextStyle(fontSize: 32, color: Colors.white);

    Color iconColor;
    IconData iconData;

    switch (batteryState) {
      case BatteryState.full:
        iconData = Icons.battery_full;
        iconColor = Colors.green;
        break;
      case BatteryState.charging:
        iconData = Icons.battery_charging_full;
        iconColor = Colors.green;
        break;
      case BatteryState.discharging:
      default:
        iconData = Icons.battery_alert;
        iconColor = Colors.red;
        break;
    }

    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: iconColor.withAlpha(200),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(iconData, size: size, color: iconColor),
            const SizedBox(height: 10),
            Text(
              '${batteryLevel.toString()}%',
              style: style.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              _getBatteryStatusText(),
              style: style,
            ),
            const SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: onClose,
            ),
          ],
        ),
      ),
    );
  }

  String _getBatteryStatusText() {
    switch (batteryState) {
      case BatteryState.full:
        return 'Full!';
      case BatteryState.charging:
        return 'Charging...';
      case BatteryState.discharging:
      default:
        return 'Discharging...';
    }
  }
}
