//
//  MovieService.swift
//  PopularMovies
//
//  Created by Mira Kim on 4/9/2022.
//

import Foundation
import UIKit

protocol MovieRepository {
    func getPopularMovies() async throws -> PopularMoviesDTO
    func getImage(from url: URL) async throws -> UIImage
}

enum MovieRepositoryError: Error {
    case invalidResponse
    case invalidStatusCode
    case invalidDataFormat
    case invalidImageData
    
}

class TMDBMovieRepository: MovieRepository {
    let getPopularMovieRequest = "/3/movie/popular"
    
    func requestUrl(relativePath: String) -> URL {
        return URL(string: "\(AppConfig.movieRequestBaseUrl)\(relativePath)?api_key=\(AppConfig.movieRequestAPIKey)")!
    }
    
    func getPopularMovies() async throws -> PopularMoviesDTO {
        let url = requestUrl(relativePath: getPopularMovieRequest)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieRepositoryError.invalidResponse
        }
        
        guard let movies = try? JSONDecoder().decode(PopularMoviesDTO.self, from: data) else {
            throw MovieRepositoryError.invalidDataFormat
        }
            
        return movies
    }
    
    
    func getImage(from url: URL) async throws -> UIImage {
        let request = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieRepositoryError.invalidResponse
        }
        
        guard let image = UIImage(data: data) else {
            throw MovieRepositoryError.invalidImageData
        }
        
        return image
    }
}
