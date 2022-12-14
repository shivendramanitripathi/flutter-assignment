import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:speakyeasy/models/carousel.dart';

class CarouselSliderDataFound extends StatefulWidget {
  final List<Carousel> carouselList;
  const CarouselSliderDataFound(this.carouselList);

  @override
  _CarouselSliderDataFoundState createState() => _CarouselSliderDataFoundState();
}

class _CarouselSliderDataFoundState extends State<CarouselSliderDataFound> {
  int _current = 0;
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.carouselList.map((e) => Container(
      margin: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: e.thumbnailUrl,
                errorWidget: (context, url, error) =>
                Icon(Icons.error),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'please slide',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
              items: imageSlider,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 14/9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.carouselList.map((e) {
              int index = widget.carouselList.indexOf(e);
              return Container(
                width: 7,
                height: 7,
                margin: EdgeInsets.symmetric(vertical: 8,horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
