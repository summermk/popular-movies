//
//  MovieDataUtilTests.swift
//  MovieDataUtilTests
//
//  Created by Mira Kim on 8/9/2022.
//

import XCTest
@testable import PopularMovies

class MovieDataUtilTests: XCTestCase {
    
    func testConvertFromDtoToModel() throws {
        let sampleDto = MovieDTO(
            backdrop_path: "some/path/to/backdrop",
            id: 1234,
            overview: "movie overview description",
            poster_path: "some/path/to/poster",
            release_date: "2022-08-02",
            title: "movie title",
            vote_average: 8.6,
            vote_count: 200
        )
        
        let result = MovieDataUtil.convert(from: sampleDto)
        XCTAssertEqual(result.id, "1234")
        XCTAssertEqual(result.title, "movie title")
        XCTAssertEqual(result.overview, "movie overview description")
        XCTAssertEqual(result.rating, "8.6")
        XCTAssertEqual(result.releaseDate, "2 Aug 2022")
    }

    func testFormatDate_withValidInput() throws {
        let releaseDate = "2022-08-01"
        
        let result = MovieDataUtil.formatDate(from: releaseDate)
        XCTAssertEqual(result, "1 Aug 2022")
    }
    
    func testFormatDate_withTwoDigitDate() throws {
        let releaseDate = "2022-08-21"
        
        let result = MovieDataUtil.formatDate(from: releaseDate)
        XCTAssertEqual(result, "21 Aug 2022")
    }
    
    func testFormatDate_withInvalidDateFormat() throws {
        let releaseDate = "20220821"
        
        let result = MovieDataUtil.formatDate(from: releaseDate)
        XCTAssertEqual(result, "20220821")
    }
    

}
