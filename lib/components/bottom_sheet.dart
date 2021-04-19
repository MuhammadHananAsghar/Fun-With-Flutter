import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:foxy/components/constants.dart';
import 'package:foxy/screens/foxy.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: "your text"));
                        },
                        icon: Icon(Icons.copy),
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                        color: primaryColor,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Heading",
                style: GoogleFonts.lato(
                    color: textColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 30)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
            ],
          ),
        ),
      ),
    );
  }
}
