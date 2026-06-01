import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const SPDPadApp());
}

class SPDPadApp extends StatelessWidget {
  const SPDPadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Raju's Octapad",
      theme: ThemeData.dark(),
      home: const SPDHomePage(),
    );
  }
}

class SPDHomePage extends StatefulWidget {
  const SPDHomePage({super.key});

  @override
  State<SPDHomePage> createState() => _SPDHomePageState();
}

class _SPDHomePageState extends State<SPDHomePage> {
  int currentKit = 0;

  final AudioPlayer player = AudioPlayer();

  final List<String> kits = [
    "Jazz Kit",
    "Rock Kit",
    "EDM Kit",
    "Indian Kit",
    "Percussion Kit",
  ];

  final List<String> pads = [
    "Crash",
    "FX",
    "Tom1",
    "Tom2",
    "HiHat2",
    "HiHat1",
    "Snare",
    "Kick",
  ];

  Future<void> playPad(String pad) async {
    final sounds = {
      "Crash": "crash.wav",
      "FX": "fx.wav",
      "Tom1": "tom1.wav",
      "Tom2": "tom2.wav",
      "HiHat2": "hihat2.wav",
      "HiHat1": "hihat1.wav",
      "Snare": "snare.wav",
      "Kick": "kick.wav",
    };

    final file = sounds[pad];

    if (file != null) {
      await player.stop();
      await player.play(
        AssetSource('sounds/$file'),
      );
    }
  }

  void nextKit() {
    setState(() {
      currentKit = (currentKit + 1) % kits.length;
    });
  }

  void prevKit() {
    setState(() {
      currentKit =
          currentKit == 0 ? kits.length - 1 : currentKit - 1;
    });
  }

  Widget buildPad(String name) {
    return GestureDetector(
      onTap: () => playPad(name),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade700,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSmallButton(String text) {
    return SizedBox(
      width: 80,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Row(
          children: [

            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: pads.map(buildPad).toList(),
                ),
              ),
            ),

            Container(
              width: 260,
              color: Colors.black,
              child: Column(
                children: [

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      buildSmallButton("MUTE"),
                      buildSmallButton("FX CTRL"),
                      buildSmallButton("KIT"),
                      buildSmallButton("PHRASE"),
                      buildSmallButton("LOOP"),
                      buildSmallButton("SETUP"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: 220,
                    height: 140,
                    color: Colors.lightBlue.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "KIT ${(currentKit + 1).toString().padLeft(3, '0')}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          kits[currentKit],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      buildSmallButton("MENU"),
                      buildSmallButton("QUICK"),
                      buildSmallButton("BACK"),
                      buildSmallButton("ENTER"),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: prevKit,
                        child: const Text("◀"),
                      ),
                      const Text(
                        "KIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: nextKit,
                        child: const Text("▶"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
