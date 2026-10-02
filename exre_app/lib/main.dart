import 'package:flutter/material.dart';
import 'data/resources_repository.dart';
import 'screens/main_shell.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ExreApp());
}

class ExreApp extends StatefulWidget {
  const ExreApp({super.key});

  @override
  State<ExreApp> createState() => _ExreAppState();
}

class _ExreAppState extends State<ExreApp> with WidgetsBindingObserver {
  late final AppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = AppState(kStudyResources);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState.recordLifecycle(state);
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      state: _appState,
      child: MaterialApp(
        title: 'ExRE',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const MainShell(),
      ),
    );
  }
}
