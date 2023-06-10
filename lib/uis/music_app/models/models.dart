class MusicCategory{
  final int id;
  final String label;

  MusicCategory(this.id, this.label);

}

class MusicItem{
  final String title;
  final String singer;
  final String image;
  final bool isFavorite;

  MusicItem(this.title, this.singer, this.image, this.isFavorite);
}