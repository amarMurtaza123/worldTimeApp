import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  String? bgImage;
  Color? bgColor;

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorldTime>(
      builder: (context, state, ch) {
        widget.bgImage = state.isDayTime ? 'day.png' : 'night.png';
        widget.bgColor =
            state.isDayTime ? Colors.lightBlue : Colors.indigo[700] as Color;

        return Scaffold(
          backgroundColor: widget.bgColor,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/${widget.bgImage}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChooseLocation(state.urlList, state.locationList, state.flagList))),
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                      style: TextButton.styleFrom(primary: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.getLocation(),
                          style: const TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      state.getTime(),
                      style: const TextStyle(
                        fontSize: 66,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
