//
//  ContentView.swift
//  cameraPractice
//
//  Created by Adolfo Calderon on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var camera = Camera()
    
    var body: some View {
        VStack{
            CameraView(camera: camera)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
