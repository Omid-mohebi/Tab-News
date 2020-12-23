import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_new_try/app/modules/home/catagori_model.dart';
import 'package:my_new_try/app/modules/home/controllers/home_controller.dart';

class MyStragged extends StatelessWidget {
  final Category data;
  HomeController controller = HomeController();
  MyStragged({@required this.data});
  String un = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StaggeredGridView.countBuilder(
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        itemCount: data.articles.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.articles[index].source.name.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Regular',
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.articles[index].title.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      data.articles[index].urlToImage.toString(),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "News description: ${data.articles[index].description.toString()}"),
                  ),
                  TextButton(
                      child: Text(
                        'See more...',
                      ),
                      onPressed: () {
                        controller
                            .muLuncher(data.articles[index].url.toString());
                        print(data.articles[index].url);
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Author: ${data.articles[index].author != null ? data.articles[index].author.toString() : un}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      ),
    );
  }
}
