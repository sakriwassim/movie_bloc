  class Movie {
    String? title;
    String? year;
    String? rated;
    String? released;
    String? runtime;
    String? genre;
    String? director;
    String? writer;
    String? actors;
    String? plot;
    String? language;
    String? country;
    String? awards;
    String? poster;
    String? metascore;
    String? imdbRating;
    String? imdbVotes;
    String? imdbID;
    String? type;
    String? dVD;
    String? boxOffice;
    String? production;
    String? website;
    String? response;

    Movie(
        {required this.title,
        required this.year,
        required this.rated,
        required this.released,
        required this.runtime,
        required this.genre,
        required this.director,
        required this.writer,
        required this.actors,
        required this.plot,
        required this.language,
        required this.country,
        required this.awards,
        required this.poster,
        required this.metascore,
        required this.imdbRating,
        required this.imdbVotes,
        required this.imdbID,
        required this.type,
        required this.dVD,
        required this.boxOffice,
        required this.production,
        required this.website,
        required this.response});

    Movie.fromJson(Map<String, dynamic> json) {
      title = json['Title'];
      year = json['Year'];
      rated = json['Rated'];
      released = json['Released'];
      runtime = json['Runtime'];
      genre = json['Genre'];
      director = json['Director'];
      writer = json['Writer'];
      actors = json['Actors'];
      plot = json['Plot'];
      language = json['Language'];
      country = json['Country'];
      awards = json['Awards'];
      poster = json['Poster'];
      metascore = json['Metascore'];
      imdbRating = json['imdbRating'];
      imdbVotes = json['imdbVotes'];
      imdbID = json['imdbID'];
      type = json['Type'];
      dVD = json['DVD'];
      boxOffice = json['BoxOffice'];
      production = json['Production'];
      website = json['Website'];
      response = json['Response'];
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['Title'] = this.title;
      data['Year'] = this.year;
      data['Rated'] = this.rated;
      data['Released'] = this.released;
      data['Runtime'] = this.runtime;
      data['Genre'] = this.genre;
      data['Director'] = this.director;
      data['Writer'] = this.writer;
      data['Actors'] = this.actors;
      data['Plot'] = this.plot;
      data['Language'] = this.language;
      data['Country'] = this.country;
      data['Awards'] = this.awards;
      data['Poster'] = this.poster;
      data['Metascore'] = this.metascore;
      data['imdbRating'] = this.imdbRating;
      data['imdbVotes'] = this.imdbVotes;
      data['imdbID'] = this.imdbID;
      data['Type'] = this.type;
      data['DVD'] = this.dVD;
      data['BoxOffice'] = this.boxOffice;
      data['Production'] = this.production;
      data['Website'] = this.website;
      data['Response'] = this.response;
      return data;
    }
  }
