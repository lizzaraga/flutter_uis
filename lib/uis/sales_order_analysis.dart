/**
 * Inspired by https://dribbble.com/shots/21687851-NetSuite-Business-Software-Business-Management-Software
 */
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesOrderAnalysis extends HookWidget{
  const SalesOrderAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF322),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_rounded),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month_rounded)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.filter_alt_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_active_outlined)),
        ],
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("Sales Order \nAnalysis", style: TextStyle(
                  fontSize: 38, fontWeight: FontWeight.w800,
                ),),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 28),
                  height: 1,
                  color: Colors.black.withOpacity(0.05),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IndexedText(
                            text: "399.00",
                            indexedText: "\$",
                            textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                            indexedTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                        ),
                        Text("Payment Range", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IndexedText(
                            text: "11",
                            indexedText: "months",
                            textStyle: TextStyle(fontSize: 32,  fontWeight: FontWeight.w500),
                            indexedTextStyle: TextStyle(fontSize: 14,  fontWeight: FontWeight.w500)
                        ),
                        Text("Interested Period", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
                      ],
                    )
                  ],

                ),
                SizedBox(height: 40,),
                OperationIndicator(title: "Minimum Payment", indicatorText: "3,200", indicatorIndexedText: "\$"),
                SizedBox(height: 16,),
                OperationIndicator(title: "First Operation", indicatorText: "12", indicatorIndexedText: "months", flex: 1,),
                SizedBox(height: 16,),
                OperationIndicator(title: "Maximum Payment", indicatorText: "4,112", indicatorIndexedText: "\$", flex: 2,),
                SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class IndexedText extends StatelessWidget{
  final String text;
  final String indexedText;
  final TextStyle textStyle;
  final TextStyle indexedTextStyle;
  const IndexedText({super.key,
    required this.text,
    required this.indexedText,
    required this.textStyle,
    required this.indexedTextStyle
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: textStyle),
        const SizedBox(width: 2,),
        Text(indexedText, style: indexedTextStyle)
      ],
    );
  }

}

class OperationIndicator extends StatelessWidget{
  final String title;
  final String indicatorText;
  final String indicatorIndexedText;
  final int flex;
  const OperationIndicator({super.key, required this.title, required this.indicatorText, required this.indicatorIndexedText, this.flex = 3});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: TextStyle(
          fontSize: 15
        ),),
        SizedBox(height: 10,),
        Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: flex,
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IndexedText(
                          text: indicatorText,
                          indexedText: indicatorIndexedText,
                          textStyle: TextStyle(fontSize: 24, color: Colors.white),
                          indexedTextStyle: TextStyle(fontSize: 12, color: Colors.white)
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.call_made_rounded),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  
}