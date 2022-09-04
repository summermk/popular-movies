//
//  Model.swift
//  PopularMovies
//
//  Created by Mira Kim on 4/9/2022.
//

import Foundation

struct MovieModel: Identifiable {
    var id: String
    var title: String
    var overview: String
    var rating: String
    var releaseDate: String
}
