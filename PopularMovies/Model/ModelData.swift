//
//  ModelData.swift
//  PopularMovies
//
//  Created by Mira Kim on 5/9/2022.
//

import Foundation

class ModelData: ObservableObject {
    @Published var movies: [MovieModel] = []
    
    private let repository = TMDBMovieRepository()
    
    init() {
        load()
    }
    
    func load() {
        Task {
            do {
                let result = try await repository.getPopularMovies()
                let moviesList = result.results.map { item in
                    MovieDataUtil.convert(from: item)
                }
                DispatchQueue.main.async {
                    self.movies = moviesList
                }
            } catch {
                print(error)
            }
        }
    }
    
    func loadImage(forMovie movieId: String) {
        
    }
    
}
