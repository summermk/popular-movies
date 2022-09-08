//
//  ContentView.swift
//  PopularMovies
//
//  Created by Mira Kim on 3/9/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MovieList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
