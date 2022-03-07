//
//  KeyboardView.swift
//  CodeKey Keyboard
//
//  Created by Wilka Hudson on 07/03/2022.
//

import Foundation
import SwiftUI

struct KeyboardView: View {
    var viewController: KeyboardViewController
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            Button(action: {
                showingAlert = true;
            }) {
                Text("Show alert").background(Color.pink).frame(width: 200, height: 200).padding()
            }
            .alert("blah", isPresented: $showingAlert) {
                Button("Go away", role: .cancel) {}
            }
            
            Rectangle().fill(Color.green).frame(width: 50, height: 150)
        }
    }
}
