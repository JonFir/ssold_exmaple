private protocol MovieProvider {
    func movie(byID id: Int) -> Movie
}

private protocol MoviesProvider {
    func allMovie(byID id: Int) -> [Movie]
}

private protocol MovieCreator {
    func newMovie(movie: Movie)
}

private protocol PostersProvider {
    func posters(forMovie: Movie) -> [Poster]
}


private class MovieService: MovieProvider, MoviesProvider, MovieCreator, PostersProvider {
    
    func movie(byID id: Int) -> Movie {
        Movie()
    }
    
    func allMovie(byID id: Int) -> [Movie] {
        [Movie()]
    }
    
    func newMovie(movie: Movie) {
        
    }
    
    func posters(forMovie: Movie) -> [Poster] {
        [Poster()]
    }
    
}







private class SomeViewController {
    typealias Service = MovieProvider & MovieCreator & PostersProvider
    
    let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
}



private class SomeTwoViewController {
    
    let movieProvider: MovieProvider
    let movieCreator: MovieCreator
    let postersProvider: PostersProvider
    
    init(movieProvider: MovieProvider, movieCreator: MovieCreator, postersProvider: PostersProvider) {
        self.movieProvider = movieProvider
        self.movieCreator = movieCreator
        self.postersProvider = postersProvider
    }
    
}
