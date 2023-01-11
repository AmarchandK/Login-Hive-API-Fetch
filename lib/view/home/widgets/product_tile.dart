import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../helpers/refactoring.dart';
import '../../../model/response.dart';

class Products extends GetView<HomeController> {
  const Products({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    final Result data = controller.data[index]!;
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_drop_up,
                      size: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      data.totalVoted.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text('Votes'),
                  )
                ],
              ),
              w10,
              Container(
                height: height(context) * 0.2,
                width: width(context) * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(data.poster!), fit: BoxFit.fill),
                ),
              ),
              w10,
              SizedBox(
                width: width(context) - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    h5, h5,
                    Bookdetails(
                      keytxt: 'Genre:',
                      valuetxt: data.genre!,
                    ),
                    h5,
                    Bookdetails(
                      keytxt: 'Director:',
                      valuetxt: data.director![0]!,
                    ),
                    h5,
                    Bookdetails(
                      keytxt: 'Starring:',
                      valuetxt: data.stars![0]!,
                    ),
                    h5,

                    Text(
                        '${data.runTime ?? "0"} m | ${data.language}  | ${data.releasedDate.toString().substring(0, 3)} '),
                    h5,
                    Text(
                      '${data.pageViews} views | Voted by ${data.voting} People',
                      style: const TextStyle(color: Colors.lightGreen),
                    )

                    // Text('Genre:Action,Adventure,Thriller')
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Watch Trailer'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bookdetails extends StatelessWidget {
  const Bookdetails({
    Key? key,
    required this.keytxt,
    required this.valuetxt,
  }) : super(key: key);
  final String keytxt;
  final String valuetxt;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: keytxt,
        style: const TextStyle(
            color: Colors.grey, fontSize: 17, overflow: TextOverflow.ellipsis),
        children: <TextSpan>[
          TextSpan(
            text: ' $valuetxt',
            style: const TextStyle(
                color: Colors.black, fontSize: 15, overflow: TextOverflow.fade),
          ),
        ],
      ),
    );
  }
}
