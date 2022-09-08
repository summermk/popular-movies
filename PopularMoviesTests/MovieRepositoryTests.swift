//
//  MovieRepositoryTests.swift
//  MovieRepositoryTests
//
//  Created by Mira Kim on 3/9/2022.
//

import XCTest
@testable import PopularMovies

class MovieRepositoryTests: XCTestCase {
    
    private var repository: TMDBMovieRepository!

    override func setUpWithError() throws {
        repository = TMDBMovieRepository()
    }

    override func tearDownWithError() throws {
        repository = nil
    }

    func testRequestUrl() throws {
        let requestPath = "/some/api"
        let expectedResult = URL(string: "https://api.themoviedb.org/some/api?api_key=4ea529a3cc3b681044f6ac2a45ffde9d")!
        let result = repository.requestUrl(relativePath: requestPath)
        XCTAssertEqual(result, expectedResult)
    }


}
