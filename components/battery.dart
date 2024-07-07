import 'dart:async';
import 'package:calculator/components/batterystatus.dart';
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';


class BatteryLevel extends StatefulWidget {
  const BatteryLevel({super.key});

  @override
  _BatteryLevelState createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  BatteryState _batteryState = BatteryState.full;

  late Timer _timer;
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _listenBatteryLevel();
    _listenBatteryState();
  }

  void _listenBatteryState() {
    _subscription = _battery.onBatteryStateChanged.listen(
      (batteryState) => setState(() => _batteryState = batteryState),
    );
  }

  void _listenBatteryLevel() {
    _updateBatteryLevel();

    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) async => _updateBatteryLevel(),
    );
  }

  Future<void> _updateBatteryLevel() async {
    final batteryLevel = await _battery.batteryLevel;
    setState(() => _batteryLevel = batteryLevel);
  }

  @override
  void dispose() {
    _timer.cancel();
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: CustomBatteryStatus(
            batteryState: _batteryState,
            batteryLevel: _batteryLevel,
            onClose: () {
              // Handle close action here if needed
            },
          ),
        ),
      );
}
