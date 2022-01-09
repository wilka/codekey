//
//  ContentView.swift
//  CodeKey
//
//  Created by Wilka Hudson on 27/12/2021.
//

import SwiftUI


struct ContentView: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Button("Test") {}
                .buttonStyle(.borderedProminent)
            Button {
                print("clicked")
            }
            label: {
                Text("Cheese").padding()
            }
            TextField("Username", text: $username).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
