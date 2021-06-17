//
//  ContentView.swift
//  Shared
//
//  Created by Donovon Spencer on 6/17/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("WhiteBackground")
                .resizable()
                .scaledToFit()
            Button(action: shareImage, label: {
                Text("Share")
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.5))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
        }
    }
    
    func shareImage() {
        let image = (UIImage(named: "WhiteBackground"))
        let av = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        av.isModalInPresentation = true
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

struct ContentView: View {
    @State private var transformText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text(transformText)
                    .padding()
                TextField("Text to strech", text: $transformText)
                    .border(Color(UIColor.separator))
                NavigationLink(
                    destination: ImageView(),
                    label: {
                        Text("Create Image")
                            .padding()
                            .background(Color(red: 0, green: 0, blue: 0.5))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    })
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
