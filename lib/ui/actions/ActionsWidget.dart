// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:junior_test/model/RootResponse.dart';
import 'package:junior_test/tools/MyColors.dart';
import 'package:junior_test/ui/actions/item/ActionsItemWidget.dart';

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({Key key}) : super(key: key);

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {
  @override
  Widget build(BuildContext context) {
    RootResponse response;
    return MaterialApp(
      home: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) => [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    centerTitle: true,
                    backgroundColor: MyColors.appbar_color,
                    title: Text(
                      'Акции',
                      style: TextStyle(color: MyColors.appbar_text),
                    ),
                  ),
                ],
            body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => index.isEven
                      ? StaggeredTile.count(2, 2)
                      : StaggeredTile.count(2, 1),
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: 5,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  itemBuilder: (context, index) {
                    return Content();
                  },
                ),
              ),
            )),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    RootResponse response;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActionsItemWidget()),
        );
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Flexible(
              child: Image.network(
                response.serverResponse.body.promo.item.imgThumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              response.serverResponse.body.promo.item.name,
              style: const TextStyle(
                color: MyColors.appbar_text,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: Text(
              response.serverResponse.body.promo.item.shop,
              style: const TextStyle(
                color: MyColors.appbar_text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
