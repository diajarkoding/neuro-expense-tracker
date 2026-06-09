import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'app/app.dart';
import 'core/constants/hive_box_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<Map>(HiveBoxNames.expenses);

  runApp(const NeuroExpenseApp());
}
