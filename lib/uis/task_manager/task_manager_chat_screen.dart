/**
 * Inspired by : https://dribbble.com/shots/21695673-Task-Manager-App-iOS
 */

import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'models/models.dart';

class TaskManagerChatScreen extends StatelessWidget {
  const TaskManagerChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).padding.top,
            child: SingleChildScrollView(child: _MainScreenWidget()),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const TaskManagerNavigation(),
          )
        ],
      ),
    );
  }
}


class _MainScreenWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Chats", style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w900
              ),),
              MaterialButton(
                onPressed: (){},
                padding: EdgeInsets.zero,
                height: 45,
                minWidth: 45,
                elevation: 0,
                color: Colors.black.withOpacity(0.07),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                child: Icon(Ionicons.chatbubbles, color: Colors.black.withOpacity(0.6),),
              )
            ],
          )
        ),
        SizedBox(height: 38,),
        ChatList(
          chats: [
            ChatListItem("Martini", "Super", "assets/images/king_p.png", "21:39", false),
            ChatListItem("Oiseau Whatsapp", "Video", "assets/images/oiseau_p.png", "21:11", true, isVideo: true, unReadCount: 2, hasStatus: true),
            ChatListItem("Maël M", "Screenshot_20230610-211023.png", "assets/images/mael_p.png", "21:11", false, isImage: true),
            ChatListItem("Uriel", "La coline vient après", "assets/images/uriel_p.png", "21:10", false, unReadCount: 5),
            ChatListItem("ULRICH (O)", "D'accord", "assets/images/ulrich_p.png", "20:05", false, isSticker: false, hasStatus: true),
            ChatListItem("Robert", "Sticker", "assets/images/robert_p.png", "19:56", false, isSticker: true),
            ChatListItem("Laure", "Voici encore ton affaire de mets de pistaches", "assets/images/laure_p.png", "Yesterday", false, hasStatus: true, unReadCount: 8),
            ChatListItem("Jessy Leïla", "Voilà, tu as tout compris", "assets/images/jessy_p.png", "Wednesday", false,),

          ],
        )
      ],
    );
  }

}

class ChatList extends StatelessWidget{
  final List<ChatListItem> chats;
  const ChatList({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        ChatListItem chat = chats[index];
        Color messageColor = Colors.black.withOpacity(0.4);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),

          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.05)))
          ),
          child: Row(
            children: [
              Container(
                height: 52,
                width: 52,
                padding: chat.hasStatus ? const EdgeInsets.all(2) : EdgeInsets.zero,
                decoration: BoxDecoration(
                  border: chat.hasStatus ? Border.all(color: Colors.blue, width: 2) : Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(45),

                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      image: DecorationImage(
                          image: AssetImage(chat.image),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chat.label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: .5),),
                    SizedBox(height: 1,),
                    Row(
                      children: [
                        Builder(
                          builder: (_) {

                            if(chat.isImage) return Icon(Ionicons.document, size: 13, color: messageColor,);
                            else if (chat.isVideo) return Icon(Icons.videocam_rounded, size: 13, color: messageColor,);
                            else if (chat.isSticker) return Icon(Icons.sticky_note_2, size: 13, color: messageColor,);
                            else return SizedBox();
                          },
                        ),
                        SizedBox(width: 1,),
                        Expanded(child: Text(chat.lastMessage, style: TextStyle(color: messageColor, fontSize: 13, overflow: TextOverflow.ellipsis, ), softWrap: true, maxLines: 1,))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 8,),
              Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(

                      builder: (context) {
                        Color localColor = chat.unReadCount > 0 ? Colors.blue : Colors.black.withOpacity(0.4);
                        FontWeight localFontWeight = chat.unReadCount > 0 ? FontWeight.bold : FontWeight.normal;
                        return Row(

                          children: [
                            Text(chat.timeElapsed, style: TextStyle(fontSize: 10, color: localColor, fontWeight: localFontWeight, letterSpacing: -0.25),),
                            chat.pinned
                                ? Container(margin: EdgeInsets.only(left: 4), child: Icon(Icons.star, size: 13, color: localColor,),)
                                : SizedBox(),

                          ],
                        );
                      }
                    ),
                    SizedBox(height: 6,),
                    Builder(
                      builder: (_){
                        return chat.unReadCount > 0
                        ? Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black.withOpacity(0.1)
                              )
                            ]
                          ),
                          child: Center(child: Text("${chat.unReadCount}", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),)),
                        )
                        : SizedBox();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

}

class TaskManagerNavigation extends HookWidget{
  const TaskManagerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withOpacity(0.05)
          )
        ]
      ),
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TaskManagerNavigationItem(iconData: AntDesign.home, label: "Home"),
          _TaskManagerNavigationItem(iconData: Ionicons.reader_outline, label: "Tasks"),
          _TaskManagerNavigationItem(iconData: Ionicons.folder_open_outline, label: "Projects"),
          _TaskManagerNavigationItem(iconData: Icons.calendar_month_outlined, label: "Calendar"),
          _TaskManagerNavigationItem(iconData: Ionicons.chatbubble_ellipses_outline, label: "Chat", isActive: true,),
        ],
      ),
    );
  }
}

class _TaskManagerNavigationItem extends StatelessWidget{

  final IconData iconData;
  final String label;
  final bool isActive;

  const _TaskManagerNavigationItem({super.key, required this.iconData, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? Colors.black : Colors.black.withOpacity(0.3);
    FontWeight fontWeight = FontWeight.bold; // isActive ? FontWeight.bold : FontWeight.normal;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: color,),
        SizedBox(height: 2,),
        Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: fontWeight, letterSpacing: -0.25),)
      ],
    );
  }

}