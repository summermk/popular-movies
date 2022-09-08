//
//  Model.swift
//  PopularMovies
//
//  Created by Mira Kim on 4/9/2022.
//

import Foundation
import UIKit

struct MovieModel: Identifiable {
    var id: String
    var title: String
    var overview: String
    var rating: String
    var releaseDate: String
    var posterUrl: URL?
    var posterImage: UIImage?
    var thumbnailUrl: URL?
    var thumbnailImage: UIImage?
}

struct PopularMoviesDTO: Decodable {
    let page: Int
    let results: [MovieDTO]
    let total_pages: Int
    let total_results: Int
}

struct MovieDTO: Decodable {
    let backdrop_path: String
    let id: Int
    let overview: String
    let poster_path: String
    let release_date: String
    let title: String
    let vote_average: Float
    let vote_count: Int
}
