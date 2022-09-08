//
//  MovieList.swift
//  PopularMovies
//
//  Created by Mira Kim on 3/9/2022.
//

import SwiftUI

struct MovieList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.movies) { movie in
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
        MovieList()
            .environmentObject(ModelData())
    }
}
