hereimport 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Three-Dots menu se aayi hui dynamic config keys ko read karna
  Map<String, dynamic> config = {};
  try {
    String configContent = await rootBundle.loadString('assets/app_config.json');
    config = jsonDecode(configContent);
    print("Three-Dots Keys Configuration Synced Successfully!");
  } catch (e) {
    print("No custom dynamic configuration keys found, running default framework stack.");
  }

  runApp(WorldAIGeneratedApp(config: config));
}

class WorldAIGeneratedApp extends StatelessWidget {
  final Map<String, dynamic> config;
  const WorldAIGeneratedApp({super.key, required this.config});

  @override
  Widget build(BuildContext WidgetContext) {
    // Dynamic config se Agora ya AdMob ke parameters read karna
    String agoraAppId = config['agoraId'] ?? 'NOT_SET';
    String admobId = config['admobId'] ?? 'NOT_SET';

    return MaterialApp(
      title: 'World AI Generated App',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('World AI Live Instance'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bolt, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              Text('Agora RTC Instance: $agoraAppId', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('AdMob Instance: $admobId', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 30),
              const Text('AI Engine Core Connected & Ready for Dynamic Injection!', 
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
