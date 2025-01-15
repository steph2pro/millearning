import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/features/home/models/chanel_model.dart';
import 'package:millearnia/src/features/home/models/video.dart';
import 'package:millearnia/src/shared/components/courses/course_header.dart';
import 'package:millearnia/src/shared/components/courses/course_video.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

@RoutePage()
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
 late ChanelModel _chanel= ChanelModel(id: 'id', title: 'title', profilePictureUrl: 'profilePictureUrl', subscriberCount: 'subscriberCount', videoCount: 'videoCount', 
uploadPlaylistId: 'uploadPlaylistId');
 bool _isLoading=false;
  

  @override
  void initState() {
    super.initState();
    // _initChannels();
  }

// _initChannels() async{
//   ChanelModel chanelModel=await ApiService.instance.fetchChannel(channelId:'UC6Dy0rQ6zDnQuHQ1EeErGUA');
//   print ('load chanel');
//   setState(() {
//     _chanel=chanelModel;
//   });
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        title: Text('chaine Youtube'),
        // backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.colorScheme.onPrimary,
      
      body: Column(
        children: [
          CourseVideo(videoId: 'T20fz20cjYE'),
          CourseHeader(
              videoId: 'T20fz20cjYE',
              back: (){
                context.router.popForced();
              },
            ),
          ]
      ),
      // _chanel!= null
      // ?  ListView.builder(
      //   // itemCount: 1+_chanel.videos!.length,
      //   itemBuilder: (BuildContext context, int index){
      //     if(index == 0){
      //       return _buildProfileInfo();
      //     }
      //     if (_chanel.videos != null && _chanel.videos!.isNotEmpty) {
      //       Video video = _chanel.videos![index];
      //       return _buildVideo(video);
      //     } else {
      //       print('La liste des vidéos est vide ou null');
      //     }

      //     // Video video = _chanel.videos[index]?? [];
      //     // return _buildVideo(video);
      //   }
      //   )
      // :CircularProgressIndicator()

    );
  }
  _buildProfileInfo(){
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.scrim,
            offset: Offset(0, 1),
            blurRadius: 6,
          )
        ]
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 53,
            backgroundImage: NetworkImage(_chanel.profilePictureUrl),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _chanel.title,
                ),
                Text(
                  '${_chanel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
            )
        ],
      ),
    );
  }
  _buildVideo(Video video){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      padding: EdgeInsets.all(10),
      height: 140,
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.scrim,
            offset: Offset(0, 1),
            blurRadius: 6,
          )
        ]
      ),
      child: Row(
        children: [
          Image(
            width: 150,
            image: NetworkImage(video.thumbnaiUrl)
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
              )
            )
        ],
      )
      );
  }
}
