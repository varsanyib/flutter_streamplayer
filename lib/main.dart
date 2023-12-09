import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();
void main() {
  runApp(
    const MaterialApp(
        title: "Hálózati közvetítés lejátszó app", home: MyHome()),
  );
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hálózati közvetítés",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Dosis",
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 31, 29, 29),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: startevent,
                    iconSize: 40,
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.green,
                      semanticLabel: "Indítás",
                    )),
                IconButton(
                    onPressed: stopevent,
                    iconSize: 40,
                    icon: Icon(
                      Icons.stop,
                      color: Colors.red,
                      semanticLabel: "Leállítás",
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void startevent() {
  if (!player.playing) {
    Fluttertoast.cancel();
    player.setUrl('https://stream1.virtualisan.net/prx/8080/risefm_hq');
    player.play();
    Fluttertoast.showToast(
        msg: "Lejátszás elindítva!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

void stopevent() {
  if (player.playing) {
    player.stop();
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: "Lejátszás leállítva!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
