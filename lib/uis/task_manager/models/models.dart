class ChatListItem{
  final String label;
  final String lastMessage;
  final String image;
  final String timeElapsed;
  final bool pinned;

  final bool isVideo;
  final bool isAudio;
  final bool isSticker;
  final bool isImage;
  final bool hasStatus;
  final int unReadCount;

  ChatListItem(this.label, this.lastMessage, this.image, this.timeElapsed, this.pinned, {
    this.isAudio = false,
    this.isVideo = false,
    this.isSticker = false,
    this.isImage = false,
    this.unReadCount = 0,
    this.hasStatus = false
  });
}