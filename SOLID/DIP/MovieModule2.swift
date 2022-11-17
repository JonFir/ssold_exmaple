import UIKit

private protocol MoviesControllerView: UIView {
    func setup(withState state: MoviesController.State)
}

private protocol MoviesControllerService {
    func allMovie(byID id: Int) -> [Movie]
    func newMovie(movie: Movie)
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
    
    let movieService: MoviesControllerService
    let moviesView: MoviesControllerView
    
    init(movieService: MoviesControllerService, moviesView: MoviesControllerView) {
        self.movieService = movieService
        self.moviesView = moviesView
    }
      
}



private class MovieService: MoviesControllerService {
    
    func movie(byID id: Int) -> Movie {
        Movie()
    }
    
    func allMovie(byID id: Int) -> [Movie] {
        [Movie()]
    }
    
    func newMovie(movie: Movie) {
        
    }
    
}

private class MoviesView: UIView, MoviesControllerView {
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
