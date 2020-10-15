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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: GestureDetector(
              child: Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? 'Pick a date '
                            : selectedDate.toString().substring(0, 10),
                        style: TextStyle(
                          color: Theme.of(context).textSelectionColor,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1965),
                  lastDate: DateTime.now(),
                ).then((date) {
                  setState(() {
                    selectedDate = date;
                  });
                });
              }),
        ),
        FutureBuilder(
          future: widget.data.getImages(selectedDate),
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
