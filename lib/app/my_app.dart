import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled02/app/my_app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context,) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (buildContext, childWidget,) => SafeArea(child: childWidget!,),
      locale: const Locale('en',),
      supportedLocales: const [Locale('en',),],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: null,
      localeListResolutionCallback: null,
      navigatorKey: navKey,
      navigatorObservers: [navObserver,],
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: null,
      onGenerateInitialRoutes: null,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Navigate From Here', style: TextStyle(fontSize: 18.0,),),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
