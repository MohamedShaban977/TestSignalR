import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_signalr_flutter/local_notifacation_helper.dart';
import 'package:workmanager/workmanager.dart';
import 'signalR_real_time.dart';
/*
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SignalRHelper.init();

  await LocalNotificationHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}



///_____________________________________________________________________
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    FlutterBackgroundService().sendData({"action": "setAsBackground"});

    super.initState();

    SignalRHelper.connectionOn();
  }

  listenNotification() =>
      LocalNotificationHelper.onNotification.stream.listen(onClickNotification);

  onClickNotification(String? payload) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SecondPage(payload: payload)));

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

///________________________________________________________________________


///_________________________________________________________________________

class SecondPage extends StatelessWidget {
  final String? payload;

  const SecondPage({Key? key, this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(payload ?? ''),
      ),
    );
  }
}

*/
///=======================================================
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SignalRHelper.init();
  // await LocalNotificationHelper.init();
  await
/*  await initializeService();
  FlutterBackgroundService().sendData({"action": "setAsBackground"});*/
  Workmanager().registerOneOffTask("uniqueName", "taskName",
      initialDelay: Duration(seconds: 10), inputData: {"hi": "${Random().nextInt(1000)}"});
  Workmanager().registerPeriodicTask("uniqueName1", "taskName1",frequency:Duration(seconds: 10) );
  runApp(MyApp());
}
/*
Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
}

// to ensure this executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch
void onIosBackground() {
  WidgetsFlutterBinding.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');
}

Future<void> onStart() async {
  WidgetsFlutterBinding.ensureInitialized();

  final service = FlutterBackgroundService();
  service.onDataReceived.listen((event) {
    if (event!["action"] == "setAsBackground") {
      service.setForegroundMode(false);
    }
    print("=======================");
    print(event);
  });

  // bring to foreground
  service.setForegroundMode(true);
  // if (!(await service.isServiceRunning())) timer.cancel();

  // test using external plugin
  await SignalRHelper.init();
  SignalRHelper.connection.on('ReceiveNotification', (arguments) {
    service.sendData(arguments!.first);
  });

  Timer.periodic(Duration(seconds: 30), (timer) {

    service.sendData({"id":"123","header":"hi Mohamed","content":"hi Mohamed hi Mohamed"});
  });
}*/
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
    await SignalRHelper.init();
    await LocalNotificationHelper.init();
    await SignalRHelper.connectionOn();
    print('================================================');
    print(inputData);
    return Future.value(true);
  });
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String text = "Stop Service";

  @override
  void initState() {
/*     initializeService();

    onStart();
    FlutterBackgroundService().onDataReceived.listen((event) {
      if (event!["action"] == "setAsBackground") {
        FlutterBackgroundService().setForegroundMode(false);
      }
      if (event.keys.first.contains('id')) {
        LocalNotificationHelper.showNotification(
            id:  Random().nextInt(1000), title: event['header'], body: event['content']);
      }
      print("////////////////////////////////////////////////////////");
      print(event);
    });*/
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    // SignalRHelper.connectionOn();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Service App'),
        ),
        body: Column(
          children: [
            /*          StreamBuilder<Map<String, dynamic>?>(
              stream: FlutterBackgroundService().onDataReceived,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final data = snapshot.data!;
                String? device = data["header"];
                return Column(
                  children: [
                    Text(device ?? 'Unknown'),
                  ],
                );
              },
            ),
            ElevatedButton(
              child: const Text("Foreground Mode"),
              onPressed: () {
                FlutterBackgroundService()
                    .sendData({"action": "setAsForeground"});
              },
            ),
            ElevatedButton(
              child: const Text("Background Mode"),
              onPressed: () {
                FlutterBackgroundService()
                    .sendData({"action": "setAsBackground"});
              },
            ),
            ElevatedButton(
              child: Text(text),
              onPressed: () async {
                final service = FlutterBackgroundService();
                var isRunning = await service.isServiceRunning();
                if (isRunning) {
                  service.sendData(
                    {"action": "stopService"},
                  );
                } else {
                  service.start();
                }

                if (!isRunning) {
                  text = 'Stop Service';
                } else {
                  text = 'Start Service';
                }
                setState(() {});
              },
            ),*/
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // FlutterBackgroundService().sendData({
            //   "hello": "world",
            // });
          },
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
