import 'package:flutter/material.dart';
import 'package:quizapp/services/models.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({ Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.img,
      child: Card(
        //round the edges
        clipBehavior: Clip.antiAlias,
        //not tappable by default so add InkWell
        child: InkWell(
          onTap: () {

          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/covers/${topic.img}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    //gracefully fade out
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}