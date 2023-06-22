import 'package:chat_app/component/circle_image.dart';
import 'package:flutter/material.dart';

class SingleMeassage extends StatelessWidget {
  const SingleMeassage({super.key, required, this.event});
  final dynamic event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleImage(imgUrl: event["url"]),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(event["name"],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              letterSpacing: 1.2)),
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/1200px-Twitter_Verified_Badge.svg.png",
                        width: 20,
                      )
                    ],
                  ),
                  Text(
                    event["message"],
                    style: event["message"] == "Typing"
                        ? const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontStyle: FontStyle.italic,
                            color: Colors.red)
                        : const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(event["time"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )),
              const SizedBox(
                height: 5,
              ),
              event["badge"] == "NULL"
                  ? Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )
                  : Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.pink),
                      child: Center(
                        child: Text(
                          event["badge"],
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
