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
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: model.posterUrl) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 500)
                
                Text("Overview")
                    .font(.headline)
                    .padding(.top, 8)
                
                Text(model.overview)
                    .padding(.vertical, 4)
                
                HStack {
                    Text("Rating: ")
                        .font(.headline)
                    Text(model.rating)
                }.padding(.vertical, 4)
                
                HStack {
                    Text("Release date: ")
                        .font(.headline)
                    Text(model.releaseDate)
                }.padding(.vertical, 4)
            }.padding()
        }
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieModel(
            id: "1234",
            title: "Thor: Love and Thunder",
            overview: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Relatively Mighty Girl Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.",
            rating: "6.8",
            releaseDate: "2022-07-06"
            
        )
        
        MovieDetails(model: movie)
    }
}
