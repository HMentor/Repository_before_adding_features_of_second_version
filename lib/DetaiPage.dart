import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hmentor_completed/mentor.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // ignore: non_constant_identifier_names
  String Youtube() {
    if (widget.post.data['YouTube Link'] == null) {
      return "NA";
    } else {
      return widget.post.data['YouTube Link'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text(
          widget.post.data['Owner'],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.3, 0.6, 0.9],
            colors: [
              Colors.deepOrange[300],
              Colors.deepOrange[200],
              Colors.deepPurple[200],
              Colors.deepPurple[300],
            ],
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListView(
            padding: EdgeInsets.all(15.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: "Owner:- ",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: widget.post.data["Owner"],
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(thickness: 1,color: Colors.black,),
              RichText(
                text: TextSpan(
                    text: "Problem Statement:- ",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: widget.post.data["Problem Statement"],
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(thickness: 1,color: Colors.black,),
              RichText(
                text: TextSpan(
                    text: "Description:- ",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: widget.post.data["Description"],
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(thickness: 1,color: Colors.black,),
              RichText(
                text: TextSpan(
                    text: "Required Skills:- ",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: widget.post.data["Required Skill"],
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(thickness: 1,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Useful Link:- ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                Youtube(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            FlatButton(
                              splashColor: Colors.deepOrangeAccent,
                              child: Text(
                                "Copy Link",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.black,
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: Youtube()));
                              },
                            )
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  splashColor: Colors.orangeAccent,
                  hoverColor: Colors.orangeAccent,
                  color: Colors.deepOrangeAccent,
                  focusColor: Colors.orangeAccent,
                  child: Text(
                    "Ask to Mentor",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Mentor(post: widget.post)),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
