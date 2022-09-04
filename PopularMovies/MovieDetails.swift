//
//  MovieDetails.swift
//  PopularMovies
//
//  Created by Mira Kim on 4/9/2022.
//

import SwiftUI


struct MovieDetails: View {
    var model: MovieModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("poster_thor")
                .resizable()
            
            Text(model.title)
                .font(.title)
            
            Text(model.overview)
            
            Text(model.rating)
            
            Text(model.releaseDate)
        }.padding()
    }
}


struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieModel(
            id: "1234",
            title: "Thor: Love and Thunder",
            overview: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Relatively Mighty Girl Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.",
            rating: "release_date: 2022-07-06",
            releaseDate: "vote_average: 6.8"
        )
        
        MovieDetails(model: movie)
    }
}
