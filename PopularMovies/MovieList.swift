//
//  MovieList.swift
//  PopularMovies
//
//  Created by Mira Kim on 3/9/2022.
//

import SwiftUI


struct MovieList: View {
    var movies: [MovieModel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { movie in
                    NavigationLink {
                        MovieDetails(model: movie)
                    } label: {
                        MovieRow(model: movie)
                    }
                }
                
            }
            .navigationTitle("Popular Movies")
        }
    }
}


struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        let movies = [
            MovieModel(id: "12345", title: "Top Gun: Maverick", overview: "", rating: "Rating: 8.2", releaseDate: "Release Date: 24 May 2022"),
            MovieModel(id: "23", title: "Thor: Love and Thunder", overview: "", rating: "Rating: 5", releaseDate: "Release Date: 24 June 2022"),
            MovieModel(id: "644", title: "Dragon Ball Super: MovieModel Hero", overview: "", rating: "Rating: 3", releaseDate: "Release Date: 2 May 2022")
        ]
        
        
        MovieList(movies: movies)
        
    }
}
