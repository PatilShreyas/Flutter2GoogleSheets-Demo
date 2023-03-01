import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tentang Kami',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAboutPage(title: 'Tentang Kami'),
    );
  }
}

class MyAboutPage extends StatefulWidget {
  MyAboutPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  void initState() {
    super.initState();
  }

  String sanitizeUrl(String _url) {
    String url = _url;
    if (!url.startsWith("http://") && !url.startsWith("https://")) {
      url = "https://$url";
    }
    if (url.endsWith(".")) {
      url = url.substring(0, url.length - 1);
    }
    if (url.endsWith("/")) {
      url = url.substring(0, url.length - 1);
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        padding: const EdgeInsets.all(40.0),
        children: [
          Text(
            "Mohd Fisha Hafiz bin Abidin",
            style: Theme.of(context).textTheme.headline6,
          ),
          DecoratedText(
            selectable: true,
            text:
                "{*Penolong Pengarah*}<->Sektor Data dan Teknologi Maklumat</->",
            rules: [
              DecoratorRule.between(
                start: "{",
                end: "}",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              DecoratorRule.between(
                start: "<->",
                end: "</->",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              DecoratorRule.between(
                start: "*",
                end: "*",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                removeMatchingCharacters: true,
              ),
            ],
          ),
          Divider(),
          Text(
            "Match text starting with",
            style: Theme.of(context).textTheme.headline6,
          ),
          DecoratedText(
            text: "Like twitter accounts @gabdsg or hashtags #decoratedtext",
            rules: [
              DecoratorRule.startsWith(
                text: "@",
                onTap: (match) {
                  print(match);
                },
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              DecoratorRule.startsWith(
                text: "#",
                onTap: (match) {
                  print(match);
                },
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Divider(),
          Text(
            "Match specific words",
            style: Theme.of(context).textTheme.headline6,
          ),
          DecoratedText(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            rules: [
              DecoratorRule.words(
                words: ["lorem ipsum", "industry", "book", "make"],
                onTap: (match) {
                  print(match);
                },
                style: TextStyle(
                  background: Paint()..color = Colors.yellow,
                ),
              ),
            ],
          ),
          Divider(),
          Text(
            "Match links",
            style: Theme.of(context).textTheme.headline6,
          ),
          DecoratedText(
            text:
                "You can match links with https https://pub.dev/ and links without it like google.com",
            rules: [
              DecoratorRule.url(
                onTap: (url) {
                  print(url);
                },
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                humanize: false,
                removeWww: false,
              ),
            ],
          ),
          Divider(),
          Text(
            "Custom link match",
            style: Theme.of(context).textTheme.headline6,
          ),
          DecoratedText(
            text:
                "Match links and add the favicon: https://pub.dev/, https://google.com, stackoverflow.com and talkingpts.org",
            rules: [
              DecoratorRule(
                regExp: RegExp(
                  r'((https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*))',
                  caseSensitive: false,
                  dotAll: true,
                  multiLine: true,
                ),
                onTap: (url) {
                  print(url);
                },
                style: TextStyle(
                  color: Colors.blue,
                ),
                leadingBuilder: (match) => Container(
                  width: 16 * 0.8,
                  height: 16 * 0.8,
                  margin: const EdgeInsets.only(right: 2, left: 2),
                  child: CachedNetworkImage(
                    imageUrl: "${sanitizeUrl(match)}/favicon.ico",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
