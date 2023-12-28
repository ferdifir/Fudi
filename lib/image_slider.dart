import 'package:flutter/material.dart';

class ImageSliderWithIndicator extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSliderWithIndicator({super.key, required this.imageUrls});

  @override
  _ImageSliderWithIndicatorState createState() =>
      _ImageSliderWithIndicatorState();
}

class _ImageSliderWithIndicatorState extends State<ImageSliderWithIndicator> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 200.0, // Sesuaikan tinggi slider di sini
              child: PageView.builder(
                itemCount: widget.imageUrls.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    widget.imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            _buildIndicator(),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.imageUrls.map((url) {
        int index = widget.imageUrls.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}