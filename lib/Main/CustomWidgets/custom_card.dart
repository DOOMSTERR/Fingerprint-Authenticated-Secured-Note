import 'package:flutter/material.dart';
import 'package:Notes/Main/Classes/note.dart';
import 'package:Notes/Main/Views/add_note_view.dart';

class CustomCard extends StatelessWidget {
  final Note data;
  CustomCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Card(
        color: Color(0xFFff5722),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
                builder: (context) => AddNote(
                      note: data,
                    ));
            Navigator.push(context, route);
          },
          splashColor: Color(0xFFd7ccc8),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    data.title,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ), 
                Icon(      
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}


