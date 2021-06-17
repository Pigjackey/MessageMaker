//
//  ContentView.swift
//  Shared
//
//  Created by Donovon Spencer on 6/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var transformText: String = "Welcome!"

    var body: some View {
        VStack {
            Text(transformText)
                .padding()
            
            TextField("Placeholder", text: $transformText)
                .border(Color(UIColor.separator))
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
