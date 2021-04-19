import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:foxy/components/constants.dart';
import 'package:foxy/components/bottom_sheet.dart';
import 'package:foxy/connection.dart';
import 'package:google_fonts/google_fonts.dart';

class Foxy extends StatefulWidget {
  @override
  _FoxyState createState() => _FoxyState();
}

class _FoxyState extends State<Foxy> {
  final _textController = TextEditingController();
  Future<Album> _futureAlbum;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "F",
                  style: GoogleFonts.lato(
                      color: secondaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 45)),
                ),
                Text(
                  "O",
                  style: GoogleFonts.lato(
                      color: secondaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 45)),
                ),
                Text(
                  "X",
                  style: GoogleFonts.lato(
                      color: secondaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 45)),
                ),
                Text(
                  "Y",
                  style: GoogleFonts.lato(
                      color: secondaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 45)),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 2),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: secondaryColor.withOpacity(0.23)),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.text,
                      child: TextField(
                        controller: _textController,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            hintText: "Search!",
                            hintStyle: GoogleFonts.lato(
                              color: primaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: (_futureAlbum == null)
                        ? IconButton(
                            onPressed: () {
                              _textController.text = '';
                              setState(() {
                                _futureAlbum =
                                    createAlbum(_textController.text);
                              });
                              //_openSheet(context);
                            },
                            icon: Icon(
                              Icons.search,
                              color: primaryColor,
                              size: 30.0,
                            ),
                          )
                        : FutureBuilder<Album>(
                            future: _futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!.title);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              return CircularProgressIndicator();
                            },
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

void _openSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: CustomSheet(),
            ),
          ));
}
