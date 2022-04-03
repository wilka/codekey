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
            HStack {
                Button("Q") {}.buttonStyle(.borderedProminent)
                Button("W") {}.buttonStyle(.borderedProminent)
                Button("E") {}.buttonStyle(.borderedProminent)
                Button("R") {}.buttonStyle(.borderedProminent)
                Button("T") {}.buttonStyle(.borderedProminent)
                Button("Y") {}.buttonStyle(.borderedProminent)
            }.background(Color.purple)
            
            HStack {
                Button("A") {}.buttonStyle(.borderedProminent)
                Button("S") {}.buttonStyle(.borderedProminent)
                Button("D") {}.buttonStyle(.borderedProminent)
                Button("F") {}.buttonStyle(.borderedProminent)
                Button("G") {}.buttonStyle(.borderedProminent)
                Button("H") {}.buttonStyle(.borderedProminent)
            }.background(Color.green)
            
            HStack {
                Button("Z") {}.buttonStyle(.borderedProminent)
                Button("X") {}.buttonStyle(.borderedProminent)
                Button("C") {}.buttonStyle(.borderedProminent)
                Button("V") {}.buttonStyle(.borderedProminent)
                Button("B") {}.buttonStyle(.borderedProminent)
                Button("N") {}.buttonStyle(.borderedProminent)
            }.background(Color.yellow)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
