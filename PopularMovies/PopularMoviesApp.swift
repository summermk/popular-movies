//
//  PopularMoviesApp.swift
//  PopularMovies
//
//  Created by Mira Kim on 3/9/2022.
//

import SwiftUI

@main
struct PopularMoviesApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
