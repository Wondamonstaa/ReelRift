import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  final String photoLink;
  final String movieName;
  final String movieLink;
  final String alternativePhotoLink; // Add this line

  const Description({
    Key? key,
    required this.photoLink,
    required this.movieName,
    required this.movieLink,
    required this.alternativePhotoLink, //Alternative photo link
  }) : super(key: key);

  @override
  _FullInfo createState() => _FullInfo();
}

class _FullInfo extends State<Description> {
  _launchURLBrowser(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieName),
        backgroundColor: Color(0xff232323),
      ),
      body: InkWell(
        onTap: () => _launchURLBrowser(widget.movieLink),
        child: Hero(
          tag: 'moviePoster${widget.movieLink.hashCode}', // Use a unique tag for Hero
          child: Image.asset(
            widget.alternativePhotoLink, // Use the alternative image link here
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
