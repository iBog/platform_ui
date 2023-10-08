import 'dart:io';

import 'package:example/basic.dart';
import 'package:example/dialog_tabs.dart';
import 'package:example/input.dart';
import 'package:example/more_widgets.dart';
import 'package:fluent_ui/fluent_ui.dart' as FluentUI;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_ui/platform_ui.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  platform = TargetPlatform.macOS;
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 1024), //default window size
      center: true, //auto center window on launch
      titleBarStyle: TitleBarStyle.hidden, //hide system Window Taskbar
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  bool isMaximized = false;

  toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: themeMode,
      androidTheme: ThemeData.light(),
      androidDarkTheme: ThemeData.dark(),
      macosTheme: MacosThemeData.light(),
      macosDarkTheme: MacosThemeData.dark(),
      windowsTheme: FluentUI.FluentThemeData.light(),
      windowsDarkTheme: FluentUI.FluentThemeData.dark(),
      home: const MyHomePage(
        title: 'Platform UI Demo (AppBar)',
      ),
      windowButtonConfig: PlatformWindowButtonConfig(
        onClose: () {
          debugPrint('close');
          windowManager.close();
        },
        onMinimize: () {
          debugPrint('minimize');
          windowManager.minimize();
        },
        onMaximize: () {
          setState(() {
            isMaximized = true;
          });
          debugPrint('maximize');
          windowManager.maximize();
        },
        onRestore: () {
          setState(() {
            isMaximized = false;
          });
          debugPrint('restore');
          windowManager.restore();
        },
        isMaximized: () => isMaximized,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final platforms = List<TargetPlatform>.from(TargetPlatform.values)
      ..remove(TargetPlatform.fuchsia);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(widget.title),
        actions: [
          PlatformIconButton(
            icon: const Icon(
              Icons.notifications_active_rounded,
            ),
            onPressed: () {},
          ),
          PlatformIconButton(
            icon: Icon(
              MyApp.of(context).themeMode == ThemeMode.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: MyApp.of(context).toggleTheme,
          ),
          PlatformPopupMenuButton<TargetPlatform>(
            items: platforms
                .map(
                  (e) => PlatformPopupMenuItem(
                    value: e,
                    child: PlatformText(e.name),
                  ),
                )
                .toList(),
            onCanceled: () {
              debugPrint("Canceled");
            },
            onSelected: (value) {
              MyApp.of(context).setState(() {
                platform = value;
              });
            },
            child: const Icon(Icons.more_vert_rounded),
          ),
          const PlatformWindowButtons(),
        ],
      ),
      body: PlatformSidebar(
        expanded: true,
        header: Center(child: PlatformText.headline("Header")),
        // windowsFooterItems: [
        //   FluentUI.PaneItem(
        //     icon: const Icon(Icons.home),
        //     body: const PlatformText("Footer"),
        //   ),
        // ],
        // footer: PlatformTextButton(
        //   child: const Center(child: PlatformText("Footer")),
        //   onPressed: () {},
        // ),
        body: {
          PlatformSidebarItem(
            title: const Text("Basic Widgets"),
            icon: const Icon(Icons.widgets_rounded),
          ): const Basic(),
          PlatformSidebarItem(
            title: const Text("Form/Input Widgets"),
            icon: const Icon(Icons.file_present_rounded),
          ): const Input(),
          PlatformSidebarItem(
            title: const Text("Dialog and Tabbar"),
            icon: const Icon(Icons.home_rounded),
          ): PlatformTabView(
            body: {
              PlatformTab(
                label: "Widgets",
                icon: const Icon(Icons.collections_bookmark_rounded),
              ): const DialogTabs(),
              PlatformTab(
                label: "More Widgets",
                icon: const Icon(Icons.format_align_justify),
              ): const MoreWidgets(),
            },
          ),
          PlatformSidebarItem(
            title: const Text("Settings"),
            icon: const Icon(Icons.settings_rounded),
          ): const Center(
            child: PlatformText("Settings"),
          ),
          PlatformSidebarItem(
            title: const Text("About"),
            icon: const Icon(Icons.info_rounded),
          ): const Center(
            child: PlatformText("About"),
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
