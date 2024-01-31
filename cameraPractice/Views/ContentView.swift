//
//  ContentView.swift
//  cameraPractice
//
//  Created by Adolfo Calderon on 1/25/24.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var viewModel = Camera()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
