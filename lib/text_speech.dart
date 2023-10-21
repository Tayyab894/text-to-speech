import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechApp extends StatefulWidget {
  const TextToSpeechApp({super.key});

  @override
  State<TextToSpeechApp> createState() => _TextToSpeechAppState();
}

class _TextToSpeechAppState extends State<TextToSpeechApp> {
  TextEditingController textcontroller =
      TextEditingController(text: "Write Some Text For Speech");
  FlutterTts fluttertts = FlutterTts();
  double volumerange = 0.5;
  double pitchrange = 1;
  double speechrange = 0.5;

  play() async {
    await fluttertts.speak(textcontroller.text);
  }

  stop() async {
    await fluttertts.stop();
  }

  pause() async {
    await fluttertts.pause();
  }

  volume(val) async {
    volumerange = val;
    await fluttertts.setVolume(volumerange);
    setState(() {});
  }

  pitch(val) async {
    pitchrange = val;
    await fluttertts.setPitch(pitchrange);
    setState(() {});
  }

  speech(val) async {
    speechrange = val;
    await fluttertts.setSpeechRate(speechrange);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text(
          'Text to Speech App',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              width: 250,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: TextEditingController(),
                maxLines: null,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Write Some Text For Speech",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashRadius: 40,
                    onPressed: play,
                    color: Colors.grey,
                    iconSize: 60,
                    icon: const Icon(Icons.play_circle)),
                IconButton(
                    splashRadius: 40,
                    onPressed: stop,
                    color: Colors.red,
                    iconSize: 60,
                    icon: const Icon(Icons.stop_circle)),
                IconButton(
                    splashRadius: 40,
                    onPressed: pause,
                    color: Colors.lightGreen,
                    iconSize: 60,
                    icon: const Icon(Icons.pause_circle)),
              ],
            ),
            Slider(
              max: 1,
              value: volumerange,
              onChanged: (value) {
                volume(value);
              },
              divisions: 10,
              label: "Volume: $volumerange",
              activeColor: Colors.red,
            ),
            const Text("Set Volume"),
            Slider(
              max: 2,
              value: pitchrange,
              onChanged: (value) {
                pitch(value);
              },
              divisions: 10,
              label: 'Pitch Rate : $pitchrange',
              activeColor: Colors.teal,
            ),
            const Text("Set Pitch"),
            Slider(
              max: 1,
              value: speechrange,
              onChanged: (value) {
                speech(value);
              },
              divisions: 10,
              label: 'Speech Rate: $speechrange',
              activeColor: Colors.amber,
            ),
            const Text("Set Speech Rate"),
           const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
