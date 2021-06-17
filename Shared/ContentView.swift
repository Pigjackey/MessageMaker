//
//  ContentView.swift
//  Shared
//
//  Created by Donovon Spencer on 6/17/21.
//

import SwiftUI

struct ImageView: View {
    let image = (UIImage(named: "WhiteBackground"))
    let text: String

    var body: some View {
        VStack {
            Image(uiImage: textToImage(drawText: text, inImage: image!, atPoint: CGPoint(x: 20, y: 20)))
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
        let newImage = textToImage(drawText: text, inImage: image!, atPoint: CGPoint(x: 20, y: 20))
        
        let av = UIActivityViewController(activityItems: [newImage], applicationActivities: nil)
        av.isModalInPresentation = true
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 122)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
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
                    destination: ImageView(text: transformText),
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
