class ShowVideoModel {

  late final bool success;
  late final Video video;
  
  ShowVideoModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    video = Video.fromJson(json['video']);
  }

}

class Video {

  late final String student;
  late final String videoId;
  late final String videoGuid;
  late final String videoHtml;
  
  Video.fromJson(Map<String, dynamic> json){
    student = json['student'];
    videoId = json['video_id'];
    videoGuid = json['video_guid'];
    videoHtml = json['video_html'];
  }

}