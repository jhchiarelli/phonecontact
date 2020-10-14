import 'package:flutter/material.dart';
import 'package:phonecontact/src/core/models/about_model.dart';

class NotificationTile extends StatelessWidget {
  final AboutModel _data;

  const NotificationTile(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          contentPadding: EdgeInsets.all(4.0),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${_data.appname}',                      
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        // fontFamily: 'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      // style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Icon(
                    Icons.pin_drop,
                    color: Colors.green,
                    // size: 24,
                  ),
                ],
              ),
            ],
          ),
          subtitle: Text('${_data.apppoweredby}'),
        ),
      ),
    );
  }
}