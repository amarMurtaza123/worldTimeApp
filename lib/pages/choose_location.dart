import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/services/world_time.dart';

import '../models/world_model.dart';

class ChooseLocation extends StatelessWidget {
  final List<String> locations;
  final List<String> flags;
  final List<String> urls;

  const ChooseLocation(this.urls, this.locations, this.flags);

  void updateTime(index, BuildContext context) async {
    WorldModel? data;
    final worldTime = Provider.of<WorldTime>(context, listen: false);
    worldTime.setWorldModel(urls[index], locations[index], flags[index]);
    try {
      data = await worldTime.callTimeApi();
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      if (data != null) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Choose A Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: urls.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index, context);
                  },
                  title: Text(locations[index]),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${flags[index]}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
