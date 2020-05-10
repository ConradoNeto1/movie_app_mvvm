class Movie {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;
  String runtime;
  String plot;
  String actors;
  String director;
  String production;

  Movie({
      this.title,
      this.year,
      this.imdbID,
      this.type,
      this.poster,
      this.runtime,
      this.plot,
      this.actors,
      this.director,
      this.production
  });

  Movie.fromMap(Map<String, dynamic> json){
    title = json['Title'] ?? "";
    year = json['Year'] ?? "";
    imdbID = json['imdbID'] ?? "";
    type = json['Type'] ?? "";
    poster = json['Poster'] ?? "";
    runtime = json['Runtime'] ?? "";
    plot = json['Plot'] ?? "";
    actors = json['Actors'] ?? "";
    director = json['Director'] ?? "";
    production = json['Production'] ?? "";
  }
}