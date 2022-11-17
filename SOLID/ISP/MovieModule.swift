private class MovieService {
    
    func movie(byID id: Int) -> Movie {
        Movie()
    }
    
    func allMovie(byID id: Int) -> [Movie] {
        [Movie()]
    }
    
    func newMovie(movie: Movie) {
        
    }
    
}


private class PosterSevice {
    func posters(forMovie: Movie) -> [Poster] {
        [Poster()]
    }
}

private class Services {
    
    let movieService: MovieService
    let posterSevice: PosterSevice
    
    init(movieService: MovieService, posterSevice: PosterSevice) {
        self.movieService = movieService
        self.posterSevice = posterSevice
    }
    
}

private class MoviesController {
    
    enum State {
        
        struct Error {
            let title: String
            let description: String
            let tryAgainAction: () -> Void
        }
        
        struct Movies {
            let title: String
            let reloadAction: () -> Void
            let nextPage: () -> Void
            let selectMovieAction: (Movie) -> Void
        }
        
        case fail(Error)
        case success(Movies)
        
        
    }
    
    let movieService: MovieService
    let moviesView: MoviesView
    
    init(movieService: MovieService, moviesView: MoviesView) {
        self.movieService = movieService
        self.moviesView = moviesView
    }
    
    
}


private class MoviesView {
    var view: View?
    
    func setup(withState state: MoviesController.State) {
        switch state {
        case .success(let state):
            view = MoviesList(withState: state)
        case .fail(let state):
            view = ErrorView(withState: state)
        }
    }
    
}


private class ErrorView {
    
    init(withState state: MoviesController.State.Error) {
        
    }
    
}

private class MoviesList {
    
    init(withState state: MoviesController.State.Movies) {
        
    }
    
}
