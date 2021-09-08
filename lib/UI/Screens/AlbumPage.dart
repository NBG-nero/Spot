import 'package:flutter/material.dart';
import 'package:preview/Providers/Album_Provider.dart';
import 'package:preview/core/models/models.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Consumer<AlbumProvider>(builder: (context, albumProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: FutureBuilder(
              future: albumProvider.getAlbums(),
              builder: (context, snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: albumProvider.model.length,
                  itemBuilder: (context, index) {
                    Model m = albumProvider.model[index];
                    return Material(
                      child: 
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                          elevation: 10,
                          child:
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${m.id} ${m.title} ${m.userId}'),
                              )),
                        ),
                      
                    );
                  },
                );
              }),
        ),
      );
    });
  }
}
