//
//  MovieDataUtil.swift
//  PopularMovies
//
//  Created by Mira Kim on 8/9/2022.
//

import Foundation

class MovieDataUtil {
    /**
     * Convert the date from DTO format to the model usable by the view
     */
    static func convert(from dto: MovieDTO) -> MovieModel {
        return MovieModel(
            id: String(dto.id),
            title: dto.title,
            overview: dto.overview,
            rating: String(dto.vote_average),
            releaseDate: MovieDataUtil.formatDate(from: dto.release_date),
            posterUrl: MovieDataUtil.posterFullUrl(posterPath: dto.poster_path),
            thumbnailUrl: MovieDataUtil.posterThumbnailUrl(posterPath: dto.poster_path)
        )
    }
    
    /**
     * Format the date from yyyy-mm-dd to
     */
    static func formatDate(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: dateString) else {
            // this shouldn't happen but if it does, just return the initial date string
            return dateString
        }
        
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    
    private static let posterFullSize = "w500"
    private static let posterThumbSize = "w92"
    
    static func posterUrl(size: String, posterPath: String) -> URL {
        return URL(string: "\(AppConfig.imageBaseUrl)/\(size)\(posterPath)")!
    }
    
    static func posterFullUrl(posterPath: String) -> URL {
        return MovieDataUtil.posterUrl(size: posterFullSize, posterPath: posterPath)
    }
    
    static func posterThumbnailUrl(posterPath: String) -> URL {
        return MovieDataUtil.posterUrl(size: posterThumbSize, posterPath: posterPath)
    }
}
