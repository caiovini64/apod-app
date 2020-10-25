import 'package:apod_flutter/network/get_data.dart';
import 'package:flutter/material.dart';

class DayPicture extends StatefulWidget {
  const DayPicture({
    Key key,
    @required this.data,
  }) : super(key: key);

  final GetData data;

  @override
  _DayPictureState createState() => _DayPictureState();
}

class _DayPictureState extends State<DayPicture> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: widget.data.getImages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(08),
                        child: Image(
                          width: 500,
                          image: NetworkImage(snapshot.data['url']),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      snapshot.data['title'],
                      style: TextStyle(
                          fontSize: 28,
                          color: Theme.of(context).highlightColor),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      snapshot.data['explanation'],
                      style: TextStyle(
                          color: Theme.of(context).textSelectionColor),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          snapshot.data['copyright'],
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textSelectionColor
                                  .withOpacity(0.3)),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          snapshot.data['date'],
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textSelectionColor
                                  .withOpacity(0.3)),
                        ),
                      ),
                    ],
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
        ),
      ],
    );
  }
}
