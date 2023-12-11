import 'package:flutter/material.dart';

//The main class of the app
class Design extends StatefulWidget {
  final String director;
  final String movie;
  final List<String> actors;
  final String time;
  final List<String> reviews;

  const Design({
    Key? key,
    required this.director,
    required this.actors,
    required this.time,
    required this.reviews,
    required this.movie,
  }) : super(key: key);

  @override
  _Design createState() => _Design();
}

//The state of the class
class _Design extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie),
        backgroundColor: const Color(0xff232323),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/animation/comet.gif', // Replace with your actual image URL
              fit: BoxFit.cover,
            ),
          ),
          // Your existing content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Director',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  widget.director,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3894fc),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                const Padding(padding: EdgeInsets.all(10)),
                const Icon(Icons.recent_actors_rounded,
                    color: Colors.white, size: 50),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  widget.actors[0],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3894fc),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  widget.actors[1],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3894fc),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  widget.actors[2],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3894fc),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Icon(Icons.timelapse_rounded,
                    color: Colors.white, size: 50),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3894fc),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Icon(Icons.star_border, color: Colors.white, size: 50),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  widget.reviews[0],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3894fc),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  widget.reviews[1],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3894fc),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
