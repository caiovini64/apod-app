import 'package:apod_flutter/network/get_data.dart';
import 'package:flutter/material.dart';

class DayPicture extends StatelessWidget {
  const DayPicture({
    Key key,
    @required this.data,
  }) : super(key: key);

  final GetData data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data.getImages(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image(
                  width: 500,
                  image: NetworkImage(snapshot.data['url']),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  snapshot.data['title'],
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  snapshot.data['copyright'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  snapshot.data['date'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  snapshot.data['explanation'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
