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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Divider(height: 12.0,),
            const Text('Navigate From Here', style: TextStyle(fontSize: 18.0,),),
            const Divider(height: 12.0,),
            TextButton(
              onPressed: () => {
                Navigator.of(context,).pushNamed(RouteNames.copyAndPastePage,),
              },
              child: const Text('To Copy & Paste',),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:  Colors.blueAccent,
                textStyle: const TextStyle(fontSize: 18.0,),
              ),
            ),
            const Divider(height: 12.0,),
            TextButton(
              onPressed: () => {
                Navigator.of(context,).pushNamed(RouteNames.shareTextPage,),
              },
              child: const Text('To Sharing Text',),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:  Colors.blueAccent,
                textStyle: const TextStyle(fontSize: 18.0,),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
