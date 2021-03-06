import 'package:flutter_webrtc/flutter_webrtc.dart';

typedef void StreamStateCallback(Session? session, MediaStream stream);

class Session {
  Session({this.sid, this.pid});

  late String? pid;
  late String? sid;
  late RTCPeerConnection pc;
  late RTCDataChannel dc;
  List<RTCIceCandidate> remoteCandidates = [];
}

class Signaling {
  MediaStream? localStream;
  StreamStateCallback? onLocalStream;

  Map<String, dynamic> _iceServers = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
    ]
  };

  final Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ]
  };

  final Map<String, dynamic> _dcConstraints = {
    'mandatory': {
      'OfferToReceiveAudio': false,
      'OfferToReceiveVideo': false,
    },
    'optional': [],
  };

  Future<MediaStream?> createStream() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth': '1280',
          'maxWidth': '1280',
          'minHeight': '720',
          'maxHeight': '720',
          'minFrameRate': '30',
          'minAspectRatio': '1.77'
        },
        'facingMode': 'user',
        'optional': [],
      }
    };

    // MediaStream stream = userScreen
    //     ? await navigator.mediaDevices.getDisplayMedia(mediaConstraints)
    //     : await navigator.mediaDevices.getUserMedia(mediaConstraints);
    //
    // onLocalStream?.call(null, stream);
    return navigator.mediaDevices.getUserMedia(mediaConstraints);
  }

  connect() async {
    localStream = await createStream();
  }

  void switchCamera() {
    if (localStream != null) {
      Helper.switchCamera(localStream!.getVideoTracks()[0]);
    }
  }

  void muteMic() {
    if (localStream != null) {
      bool enabled = localStream!.getAudioTracks()[0].enabled;
      localStream!.getAudioTracks()[0].enabled = !enabled;
    }
  }
}
