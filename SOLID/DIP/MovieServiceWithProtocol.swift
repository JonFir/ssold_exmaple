private protocol MovieService {
    
    func movie(byID id: Int) -> Movie
    func allMovie(byID id: Int) -> [Movie]
    func newMovie(movie: Movie)
    
}

private class MovieServiceDefault {
    
    func movie(byID id: Int) -> Movie {
        Movie()
    }
    
    func allMovie(byID id: Int) -> [Movie] {
        [Movie()]
    }
    
    func newMovie(movie: Movie) {
        
    }
    
}
