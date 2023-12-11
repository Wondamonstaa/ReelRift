import 'package:flutter/material.dart';


class Sliver extends StatefulWidget {

  //Designates the genre of the movies
  final String genre;

  //The constructor of the class
  const Sliver({ Key? key, required this.genre}): super(key: key);

  //The state of the class
  @override
  _SilverAppBar createState() => _SilverAppBar();
}

class _SilverAppBar extends State<Sliver> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 10,
      clipBehavior: Clip.antiAlias,
      forceMaterialTransparency: false,
      toolbarHeight: 25,
      pinned: true,
      floating: false,
      backgroundColor: const Color(0xff171616),
      shadowColor: Colors.black,
      toolbarTextStyle: const TextStyle(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,],
        centerTitle: true,
        title: SizedBox(
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.genre, textAlign: TextAlign.center, style:
              const TextStyle(fontSize: 30, fontFamily: 'Roboto', fontWeight: FontWeight.bold, decorationColor: Colors.black, fontStyle: FontStyle.normal), overflow: TextOverflow.ellipsis, strutStyle:
              const StrutStyle(fontSize: 30, height: 1.0, leading: 1.5, fontFamily: 'Proxima Nova', fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, debugLabel: 'Proxima Nova')),
            ],
          ),
        ),
      ),
    );
  }
}