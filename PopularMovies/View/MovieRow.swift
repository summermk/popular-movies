//
//  MovieRow.swift
//  PopularMovies
//
//  Created by Mira Kim on 4/9/2022.
//

import SwiftUI

struct MovieRow: View {
    var model: MovieModel
    
    var body: some View {
        HStack {
            AsyncImage(url: model.thumbnailUrl) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(model.title)
                    .bold()
                    .font(.headline)
                Text(model.rating)
                    .font(.subheadline)
                Text(model.releaseDate)
                    .font(.subheadline)
            }
        }
        
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        let model =
        MovieModel(id: "23", title: "Thor: Love and Thunder", overview: "", rating: "Rating: 5", releaseDate: "Release Date: 24 June 2022")
        MovieRow(model: model)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
