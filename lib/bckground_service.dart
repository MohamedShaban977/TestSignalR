


/*class BackgroundService{
 static Future<void> initializeService() async {
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

 static void onIosBackground() {
    WidgetsFlutterBinding.ensureInitialized();
    print('FLUTTER BACKGROUND FETCH');
  }

 static Future<void> onStart() async {
    WidgetsFlutterBinding.ensureInitialized();

    final service = FlutterBackgroundService();
    service.onDataReceived.listen((event) {
      if (event!["action"] == "setAsForeground") {
        service.setForegroundMode(true);
        return;
      }

      if (event["action"] == "setAsBackground") {
        service.setForegroundMode(false);
      }

      if (event["action"] == "stopService") {
        service.stopBackgroundService();
      }
    });


    // bring to foreground
    service.setForegroundMode(true);
    SignalRHelper.connectionOn();

    // String title, body, payload;
    service.sendData({
        "current_date": DateTime.now().toIso8601String(),
        "device": 'device',
        });

    print("onDataReceived====>${service.onDataReceived.last}");
    // Timer.periodic(const Duration(seconds: 1), (timer) async {
    //   if (!(await service.isServiceRunning())) timer.cancel();
    //   service.setNotificationInfo(
    //     title: "My App Service",
    //     content: "Updated at ${DateTime.now()}",
    //   );
    //
    //   // test using external plugin
    //   final deviceInfo = DeviceInfoPlugin();
    //   String? device;
    //   if (Platform.isAndroid) {
    //     final androidInfo = await deviceInfo.androidInfo;
    //     device = androidInfo.model;
    //   }
    //
    //   if (Platform.isIOS) {
    //     final iosInfo = await deviceInfo.iosInfo;
    //     device = iosInfo.model;
    //   }
    //
    //   service.sendData({
    //     "current_date": DateTime.now().toIso8601String(),
    //     "device": device,
    //     });
    // });
  }
}*/
