/**
 * Inspired By https://dribbble.com/shots/20632201-Music-Player-App
 */

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'models/models.dart';


class MusicMainScreen extends HookWidget{
  const MusicMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        )
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const _MusicAppBackground(),
            Positioned.fill(
              top: MediaQuery.of(context).padding.top,
              child: SingleChildScrollView(child: _MusicHomeView()),
            ),
            Positioned(
              bottom: 16,
              left: 12,
              right: 12,
              child: _MusicNavigationWidget(),
            )
          ],
        ),
      ),
    );
  }

}

class _MusicHomeView extends HookWidget{
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaY: 4,
        sigmaX: 4
      ),
      child: Container(
        color: Colors.white.withOpacity(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
            _FilteredSearchBarWidget(),
            SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Trending right now", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 16,),
            _BigTrendsList(
              musics: [
                MusicItem("Thank You Lord", "Locko", "assets/images/thank_u_lord.png", true),
                MusicItem("I'm In Love", "Iza", "assets/images/im_in_love.png", true),
              ],
            ),
            const SizedBox(height: 28,),
            HookBuilder(
              builder: (_) {
                var categories =  [
                  MusicCategory(1, "Trending right now"),
                  MusicCategory(2, "Rock"),
                  MusicCategory(3, "Hip Hop"),
                  MusicCategory(4, "Electro"),
                  MusicCategory(5, "Country"),
                ];
                return _MusicCategoryList(
                  activeIndex: 1,
                  categories: categories,
                );
              },
            ),
            const SizedBox(height: 20,),
            _MusicVerticalList(
              musics: [
                MusicItem("Billionaire", "Teni", "assets/images/teni.png", false),
                MusicItem("Red Flag", "Ruger", "assets/images/red_flag.png", false),
                MusicItem("Love Don't Care", "Simi", "assets/images/love_dont_care.png", true),
                MusicItem("Okay", "Adekunle Gold", "assets/images/okay_okay.png", false),
                MusicItem("Understand", "Omah Lay", "assets/images/teni.png", false),
                MusicItem("For Life", "Runtown", "assets/images/teni.png", false),
                MusicItem("Leg Over", "Mr Easy", "assets/images/teni.png", false),
              ],
            )
          ],
        ),
      ),
    );
  }
  
}
class _MusicAppBackground extends StatelessWidget{
  const _MusicAppBackground({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          /*gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              Colors.yellow,
              Colors.red,
              Colors.indigo,
              Colors.teal,
            ],
          )*/
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover
          )
      ),


    );
  }

}

class _FilteredSearchBarWidget extends HookWidget{

  final double height = 40;
  final Color widgetBgColor = Colors.white.withOpacity(0.2);
  final BorderRadius widgetCornerRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      padding: EdgeInsets.only(left: 12, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          MaterialButton(
            onPressed: (){},
            child: Icon(Icons.filter_list_rounded, color: Colors.white.withOpacity(0.9), size: 20,),
            minWidth: height,
            color: widgetBgColor,
            padding: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: widgetCornerRadius),
          ),
          SizedBox(width: 8,),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: widgetCornerRadius,
                color: widgetBgColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10,),
                  Icon(AntDesign.search1, color: Colors.white.withOpacity(0.5), size: 20,),
                  SizedBox(width: 10,),
                  Text("Search", style: TextStyle(color: Colors.white.withOpacity(0.4)),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
}

class _BigTrendsList extends StatelessWidget{
  final List<MusicItem> musics;

  const _BigTrendsList({super.key, required this.musics});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 16),
        itemCount: musics.length,
        itemBuilder: (_, index) => AspectRatio(
          aspectRatio: 4/2.5,
          child: _BigTrendWidget(music: musics[index]),
          ),
        ),
    );
  }
  
}

class _BigTrendWidget extends HookWidget{
  final MusicItem music;

  _BigTrendWidget({super.key, required this.music});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.7),
        image: DecorationImage(
            image: AssetImage(music.image),
            fit: BoxFit.cover
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              child: IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_rounded, color: Colors.white,)),
            alignment: Alignment.topRight,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 60,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.black.withOpacity(0.3),

            ),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5
              ),
              child: Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(music.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.2),),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Icon(Icons.music_note_rounded, color: Colors.white, size: 12,),
                              SizedBox(width: 2,),
                              Text(music.singer, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6)),)
                            ],
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){},
                      padding: EdgeInsets.zero,
                      color: Colors.blue[50],
                      height: 37,
                      minWidth: 37,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      child: Icon(Icons.pause),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}

class _MusicCategoryList extends StatelessWidget{
  final List<MusicCategory> categories;
  final int activeIndex;

  const _MusicCategoryList({super.key, required this.categories, required this.activeIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 16),
        itemCount: categories.length,
        itemBuilder: (_, index){
          bool isActive = index + 1 == activeIndex;
          MusicCategory category = categories[index];
          return Container(
            margin: EdgeInsets.only(left: 16),
            child: MaterialButton(
              onPressed: () => {},
              color: isActive ? Colors.black.withOpacity(0.5) : Colors.transparent,
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                category.label,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.white.withOpacity(0.9),
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 13
                ),
              ),
            ),
          );
        }
      ),
    );
  }
  
}

// Todo: Create MusicCategoryWidget

class _MusicVerticalList extends StatelessWidget{
  final List<MusicItem> musics;

  const _MusicVerticalList({super.key, required this.musics});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      itemCount: musics.length,
      itemBuilder: (_, index)  {
        MusicItem music = musics[index];

        return Container(
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Image.asset(music.image, fit: BoxFit.cover),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(music.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,letterSpacing: 0.3),),
                    Text(music.singer, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w600, letterSpacing: 1.2))
                  ],
                ),
              ),
              Icon(music.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.white,)
            ],
          ),
        );
      },
    );
  }
}

// Todo: Create MusicItemWidget

class _MusicNavigationWidget extends HookWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.6,
            0.7,
            0.9,
          ],
          colors: [
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.4),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: (){},
              padding: EdgeInsets.zero,
              elevation: 0,
              color: Colors.white.withOpacity(0.3),
              height: 42,
              minWidth: 42,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Icon(FontAwesome.home, color: Colors.white, size: 20,),
            ),
            IconButton(onPressed: (){}, icon: Icon(AntDesign.search1, color: Colors.white.withOpacity(0.7),)),
            IconButton(onPressed: (){}, icon: Icon(Icons.music_note_outlined, color: Colors.white.withOpacity(0.7),)),
            IconButton(onPressed: (){}, icon: Icon(Ionicons.person_outline, color: Colors.white.withOpacity(0.7),)),
          ],
        ),
      ),
    );
  }
  
}