import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oniric/models/Images.dart';
import 'package:oniric/screens/NoDataScreen.dart';
import 'package:oniric/services/services.dart';
import '../../constants.dart';
import '../../conf/configuration.dart';

class BoatImagesWidget extends StatefulWidget {
  int vslId;
  BoatImagesWidget({Key key, @required this.vslId}) : super(key: key);
  @override
  _BoatImagesWidget createState() => _BoatImagesWidget();
}

class _BoatImagesWidget extends State<BoatImagesWidget> {
  final Services _services = new Services();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _services.getImagesFromVslId(widget.vslId),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return new CircularProgressIndicator();
            } else {
              if (snapshot.hasError) {
                return new Text("Error loading images...");
              } else {
                List<Images> img = snapshot.data;
                if (img.length > 0) {
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: CarouselSlider.builder(
                      itemCount: img.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 250,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        reverse: false,
                        aspectRatio: 5.0,
                      ),
                      itemBuilder: (context, i, id) {
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                img[i].arcPath.toString(),
                                width: 500,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () {
                            var url = img[i];
                            print(url.toString());
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: CarouselSlider.builder(
                      itemCount: VESSELS_DEFAULT.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 250,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        reverse: false,
                        aspectRatio: 5.0,
                      ),
                      itemBuilder: (context, i, id) {
                        //for onTap to redirect to another screen
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            //ClipRRect for image border radius
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage(VESSELS_DEFAULT[i]),
                              ),
                            ),
                          ),
                          onTap: () {
                            var url = VESSELS_DEFAULT[i];
                            print(url.toString());
                          },
                        );
                      },
                    ),
                  );
                }
              }
            }
          }),
    );
  }
}
