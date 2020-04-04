class Movie {
  String title;
  String poster;
  // String year;
  // String imdbID;
  // String type;
  // String runtime;
  // String plot;
  // String actors;
  // String director;
  // String production;

  Movie({
      this.title,
      this.poster
  });

  Movie.fromMap(Map<String, dynamic> json){
    title = json['Title'] ?? "";
    poster = json['Poster'] ?? "";
  }
}