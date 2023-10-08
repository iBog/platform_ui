// ignore_for_file: library_prefixes

import 'package:adwaita/adwaita.dart';
import 'package:fluent_ui/fluent_ui.dart' as FluentUI;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_ui/platform_ui.dart';
import 'package:platform_ui/src/platform_app_router.dart';

// TODO: Implement [PlatformTheme]

class PlatformApp extends StatelessWidget with PlatformMixin<Widget> {
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? androidTheme;
  final ThemeData? androidDarkTheme;
  final ThemeData? linuxTheme;
  final ThemeData? linuxDarkTheme;
  final ThemeData? androidHighContrastTheme;
  final ThemeData? androidHighContrastDarkTheme;
  final CupertinoThemeData? iosTheme;
  final MacosThemeData? macosTheme;
  final MacosThemeData? macosDarkTheme;
  final FluentUI.FluentThemeData? windowsTheme;
  final FluentUI.FluentThemeData? windowsDarkTheme;
  final ThemeMode? themeMode;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool debugShowMaterialGrid;
  final PlatformWindowButtonConfig? windowButtonConfig;

  const PlatformApp({
    Key? key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.androidTheme,
    this.androidDarkTheme,
    this.linuxTheme,
    this.linuxDarkTheme,
    this.androidHighContrastTheme,
    this.androidHighContrastDarkTheme,
    this.iosTheme,
    this.macosTheme,
    this.macosDarkTheme,
    this.windowsTheme,
    this.windowsDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.windowButtonConfig,
  }) : super(key: key);

  static PlatformAppRouter router({
    GlobalKey<ScaffoldMessengerState>? androidScaffoldMessengerKey,
    RouteInformationProvider? routeInformationProvider,
    required RouteInformationParser<Object> routeInformationParser,
    required RouterDelegate<Object> routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    TransitionBuilder? builder,
    required String title,
    GenerateAppTitle? onGenerateTitle,
    ThemeData? androidTheme,
    ThemeData? androidDarkTheme,
    ThemeData? linuxTheme,
    ThemeData? linuxDarkTheme,
    CupertinoThemeData? iosTheme,
    MacosThemeData? macosTheme,
    MacosThemeData? macosDarkTheme,
    FluentUI.FluentThemeData? windowsTheme,
    FluentUI.FluentThemeData? windowsDarkTheme,
    ThemeData? androidHighContrastTheme,
    ThemeData? androidHghContrastDarkTheme,
    ThemeMode themeMode = ThemeMode.system,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    PlatformProperty<Map<LogicalKeySet, Intent>>? shortcuts,
    PlatformProperty<Map<Type, Action<Intent>>>? actions,
    String? restorationScopeId,
    PlatformProperty<ScrollBehavior>? scrollBehavior,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = true,
    bool androidDebugShowMaterialGrid = false,
    PlatformWindowButtonConfig? windowButtonConfig,
  }) {
    return PlatformAppRouter(
      androidScaffoldMessengerKey: androidScaffoldMessengerKey,
      routeInformationProvider: routeInformationProvider,
      routeInformationParser: routeInformationParser,
      routerDelegate: routerDelegate,
      backButtonDispatcher: backButtonDispatcher,
      builder: customBuilder(builder),
      title: title,
      onGenerateTitle: onGenerateTitle,
      androidTheme: androidTheme,
      androidDarkTheme: androidDarkTheme,
      linuxTheme: linuxTheme,
      linuxDarkTheme: linuxDarkTheme,
      iosTheme: iosTheme,
      macosTheme: macosTheme,
      macosDarkTheme: macosDarkTheme,
      windowsTheme: windowsTheme,
      windowsDarkTheme: windowsDarkTheme,
      androidHighContrastTheme: androidHighContrastTheme,
      androidHghContrastDarkTheme: androidHghContrastDarkTheme,
      themeMode: themeMode,
      color: color,
      locale: locale,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
      androidDebugShowMaterialGrid: androidDebugShowMaterialGrid,
      localizationsDelegates: [
        ...(localizationsDelegates ?? []),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentUI.FluentLocalizations.delegate,
      ],
      windowButtonConfig: windowButtonConfig,
    );
  }

  static Widget Function(BuildContext context, Widget? child) customBuilder(
    Widget Function(BuildContext context, Widget? child)? builder,
  ) {
    return (context, child) {
      final platformThemeData = PlatformThemeData.fromContext(context);
      var platformTheme = PlatformTheme(
        theme: platformThemeData,
        child: IconTheme(
          data: platformThemeData.iconTheme ?? Theme.of(context).iconTheme,
          child: DefaultTextStyle(
            style: platformThemeData.textTheme?.body ??
                Theme.of(context).textTheme.bodyMedium!,
            child: builder?.call(context, child) ?? child ?? Container(),
          ),
        ),
      );
      return platformTheme;
    };
  }

  @override
  Widget android(context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers!,
      builder: customBuilder(builder),
      title: title,
      onGenerateTitle: onGenerateTitle,
      theme: androidTheme,
      darkTheme: androidDarkTheme,
      highContrastTheme: androidHighContrastTheme,
      highContrastDarkTheme: androidHighContrastDarkTheme,
      themeMode: themeMode,
      color: color,
      locale: locale,
      localizationsDelegates: [
        ...(localizationsDelegates ?? []),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentUI.FluentLocalizations.delegate,
      ],
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
      debugShowMaterialGrid: debugShowMaterialGrid,
    );
  }

  @override
  Widget ios(context) {
    return CupertinoApp(
      navigatorKey: navigatorKey,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers!,
      builder: customBuilder(builder),
      title: title,
      onGenerateTitle: onGenerateTitle,
      theme: iosTheme,
      color: color,
      locale: locale,
      localizationsDelegates: [
        ...(localizationsDelegates ?? []),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentUI.FluentLocalizations.delegate,
      ],
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
    );
  }

  @override
  Widget linux(context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers!,
      builder: customBuilder(builder),
      title: title,
      onGenerateTitle: onGenerateTitle,
      theme: linuxTheme ?? AdwaitaThemeData.light(),
      darkTheme: linuxDarkTheme ?? AdwaitaThemeData.dark(),
      highContrastTheme: androidHighContrastTheme,
      highContrastDarkTheme: androidHighContrastDarkTheme,
      themeMode: themeMode,
      color: color,
      locale: locale,
      localizationsDelegates: [
        ...(localizationsDelegates ?? []),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentUI.FluentLocalizations.delegate,
      ],
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
      debugShowMaterialGrid: debugShowMaterialGrid,
    );
  }

  @override
  Widget macos(context) {
    return MacosApp(
      navigatorKey: navigatorKey,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers!,
      builder: customBuilder(builder),
      title: title,
      onGenerateTitle: onGenerateTitle,
      theme: macosTheme,
      darkTheme: macosDarkTheme,
      themeMode: themeMode,
      color: color,
      locale: locale,
      localizationsDelegates: [
        ...(localizationsDelegates ?? []),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentUI.FluentLocalizations.delegate,
      ],
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior ?? const MacosScrollBehavior(),
    );
  }

  @override
  Widget windows(context) {
    return FluentUI.FluentApp(
      navigatorKey: navigatorKey,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers!,
      builder: customBuilder(builder),
      title: title,
      onGenerateTitle: onGenerateTitle,
      theme: windowsTheme,
      darkTheme: windowsDarkTheme,
      themeMode: themeMode,
      color: color,
      locale: locale,
      localizationsDelegates: [
        ...(localizationsDelegates ?? []),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FluentUI.FluentLocalizations.delegate,
      ],
      supportedLocales: [
        ...supportedLocales,
        const Locale('en', 'US'),
      ],
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior ?? const FluentUI.FluentScrollBehavior(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (windowButtonConfig != null) {
      return PlatformWindowButtonConfigProvider(
        config: windowButtonConfig!,
        child: getPlatformType(context),
      );
    }
    return getPlatformType(context);
  }
}
