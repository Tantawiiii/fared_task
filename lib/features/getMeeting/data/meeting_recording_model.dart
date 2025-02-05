class MeetingRecording {
  Result? result;

  MeetingRecording({this.result});

  MeetingRecording.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }

    return data;
  }
}

class Result {
  List<Recordings>? recordings;


  Result({this.recordings, });

  Result.fromJson(Map<String, dynamic> json) {
    if (json['recordings'] != null) {
      recordings = <Recordings>[];
      json['recordings'].forEach((v) { recordings!.add(new Recordings.fromJson(v)); });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recordings != null) {
      data['recordings'] = this.recordings!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Recordings {
  String? recordID;
  String? meetingID;
  String? internalMeetingID;
  String? name;
  bool? isBreakout;
  bool? published;
  String? state;
  int? startTime;
  int? endTime;
  int? participants;
  int? rawSize;
  Metadata? metadata;
  int? size;
  List<Playbacks>? playbacks;

  Recordings({this.recordID, this.meetingID, this.internalMeetingID, this.name, this.isBreakout, this.published, this.state, this.startTime, this.endTime, this.participants, this.rawSize, this.metadata, this.size, this.playbacks,});

  Recordings.fromJson(Map<String, dynamic> json) {
    recordID = json['recordID'];
    meetingID = json['meetingID'];
    internalMeetingID = json['internalMeetingID'];
    name = json['name'];
    isBreakout = json['isBreakout'];
    published = json['published'];
    state = json['state'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    participants = json['participants'];
    rawSize = json['rawSize'];
    metadata = json['metadata'] != null ? new Metadata.fromJson(json['metadata']) : null;
    size = json['size'];
    if (json['playbacks'] != null) {
      playbacks = <Playbacks>[];
      json['playbacks'].forEach((v) { playbacks!.add(new Playbacks.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordID'] = this.recordID;
    data['meetingID'] = this.meetingID;
    data['internalMeetingID'] = this.internalMeetingID;
    data['name'] = this.name;
    data['isBreakout'] = this.isBreakout;
    data['published'] = this.published;
    data['state'] = this.state;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['participants'] = this.participants;
    data['rawSize'] = this.rawSize;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['size'] = this.size;
    if (this.playbacks != null) {
      data['playbacks'] = this.playbacks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  String? isBreakout;
  String? meetingId;
  String? meetingName;

  Metadata({this.isBreakout, this.meetingId, this.meetingName});

  Metadata.fromJson(Map<String, dynamic> json) {
    isBreakout = json['isBreakout'];
    meetingId = json['meetingId'];
    meetingName = json['meetingName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isBreakout'] = this.isBreakout;
    data['meetingId'] = this.meetingId;
    data['meetingName'] = this.meetingName;
    return data;
  }
}

class Playbacks {
  String? type;
  String? url;
  int? processingTime;
  int? length;
  int? size;

  Playbacks({this.type, this.url, this.processingTime, this.length, this.size, });

  Playbacks.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    processingTime = json['processingTime'];
    length = json['length'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['processingTime'] = this.processingTime;
    data['length'] = this.length;
    data['size'] = this.size;
    return data;
  }
}
