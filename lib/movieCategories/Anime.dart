import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/Description.dart';
import 'package:movies/Design.dart';
import 'package:url_launcher/url_launcher.dart';

// Defined colors for the icons
Color _arcane = Colors.white;
Color _witcher = Colors.white;
Color _dota = Colors.white;
Color _spider = Colors.white;
var icons = [_arcane, _witcher, _dota, _spider];

// Images for the posters: original + alternative
const altPosters = [
  'assets/animation/arcane.jpg',
  'assets/animation/wolf.jpg',
  'assets/animation/dota.jpg',
  'assets/animation/spider.jpg'
];

const posters = [
  'assets/animation/arcane.gif',
  'assets/animation/witcher.gif',
  'assets/animation/dota.gif',
  'assets/animation/spider.gif'
];

// The names of the movies
const movies = ['Arcane', 'The Witcher', 'DOTA', "Spider-Man"];

// Wiki links
const wiki = [
  'https://en.wikipedia.org/wiki/Arcane_(TV_series)',
  'https://en.wikipedia.org/wiki/The_Witcher:_Nightmare_of_the_Wolf',
  'https://en.wikipedia.org/wiki/Dota:_Dragon%27s_Blood',
  'https://en.wikipedia.org/wiki/Spider-Man:_Across_the_Spider-Verse'
];

// IMBd links
const imbd = [
  'https://www.imdb.com/title/tt11126994/',
  'https://www.imdb.com/title/tt11657662/',
  'https://www.imdb.com/title/tt14069590/',
  'https://www.imdb.com/title/tt9362722/'
];

// Directors and actors
const directors = [
  'Pascal Charrue, 2021',
  'Kwang Il Han, 2021',
  'Ashley Miller, 2021',
  'Joaquim Dos Santos, 2023'
];

const actors = [
  ['Hailee Steinfeld', 'Kevin Alejandro', 'Jason Spisak'],
  ['Theo James', 'Mary McDonnell', 'Lara Pulver'],
  ['Yuri Lowenthal', 'Lara Pulver', 'Troy Baker'],
  ['Shameik Moore', 'Hailee Steinfeld', 'Brian Tyree Henry']
];

// Time and rating of the movies
const time = ['41m', '1h 23m', '25m', '2h 20m'];

const rating = [
  ['IMDb: 9/10', 'Rotten Tomatoes: 100%'],
  ['IMDb: 7.2/10', 'RottenTomatoes: 100%'],
  ['IMDb: 7.7/10', 'RottenTomatoes: 85%'],
  ['IMDb: 8.7/10', 'RottenTomatoes: 96%']
];

// The constructor of the class
class Anime extends StatefulWidget {
  const Anime({Key? key}) : super(key: key);

  // The state of the class
  @override
  _Anime createState() => _Anime();
}

// The state of the class
class _Anime extends State<Anime> {
  _launchURLBrowser(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'The provided URL is damaged: $url';
    }
  }

  _showMenu(imdburl, wikiurl, index) {
    showMenu<String>(
      context: context,
      color: const Color(0xff232323),
      position:
      const RelativeRect.fromLTRB(50.0, 400.0, 0, 0).shift(const Offset(0, 18)),
      items: [
        const PopupMenuItem<String>(
          value: 'Details',
          child: Text('Details',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        const PopupMenuItem<String>(
          value: 'Wiki',
          child: Text('Wiki',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        const PopupMenuItem<String>(
          value: 'IMDb',
          child: Text('IMDb',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
      ],
      elevation: 18.0,
    ).then((e) {
      if (e == 'Details') {
        Navigator.push(
          context,
          _pageRouter(
            Design(
              movie: movies[index],
              director: directors[index],
              actors: actors[index],
              time: time[index],
              reviews: rating[index],
            ),
          ),
        );
      } else if (e == 'Wiki') {
        _launchURLBrowser(wikiurl);
      } else if (e == 'IMDb') {
        _launchURLBrowser(imdburl);
      }
    });
  }

  PageRouteBuilder _pageRouter(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.elasticInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.0,
        child: ListView.builder(
          dragStartBehavior: DragStartBehavior.down,
          scrollDirection: Axis.horizontal,
          itemCount: 4, // Number of movies
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, position) {
            return InkWell(
              focusColor: Colors.transparent,
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                Navigator.push(
                  context,
                  _pageRouter(
                    Description(
                      photoLink: posters[position],
                      movieName: movies[position],
                      movieLink: imbd[position],
                      alternativePhotoLink: altPosters[position],
                    ),
                  ),
                );
              },
              onLongPress: () =>
                  _showMenu(imbd[position], wiki[position], position),
              child: Hero(
                tag: 'moviePoster$position',
                child: Container(
                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 7.0],
                      colors: [Colors.transparent, Colors.black],
                    ),
                  ),
                  width: 300.0,
                  height: 300.0,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff232323),
                    border: Border.all(width: 2.0, color: const Color(0xFF282828)),
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(posters[position]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                    selectedTileColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    enableFeedback: true,
                    title: Text(
                      movies[position],
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 7.0,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      directors[position],
                      style: const TextStyle(
                        backgroundColor: Colors.transparent,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 6.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      enableFeedback: true,
                      tooltip: 'Like',
                      icon: const Icon(Icons.thumb_up, size: 32),
                      color: icons[position],
                      selectedIcon: const Icon(Icons.thumb_up, size: 32, color: Color(0xff378cfc)),
                      onPressed: () {
                        setState(() {
                          icons[position] = icons[position] == Colors.white ? const Color(0xff378cfc) : Colors.white;
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomRectTween {
  CustomRectTween({required this.begin, required this.end});

  final Rect begin;
  final Rect end;

  Rect lerp(double t) {
    return Rect.fromLTRB(
      lerpDouble(begin.left, end.left, t)!,
      lerpDouble(begin.top, end.top, t)!,
      lerpDouble(begin.right, end.right, t)!,
      lerpDouble(begin.bottom, end.bottom, t)!,
    );
  }
}
