//
//  ContentView.swift
//  Shared
//
//  Created by Donovon Spencer on 6/17/21.
//

import SwiftUI

struct ImageView: View {
    let image = (UIImage(named: "WhiteBackgroundSmall"))
    let text: String

    var body: some View {
        VStack {
            Image(uiImage: generateImageWithText(text: text)!)
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
        let newImage = generateImageWithText(text: text)
        
        let av = UIActivityViewController(activityItems: [newImage!], applicationActivities: nil)
        av.isModalInPresentation = true
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    func generateImageWithText(text: String) -> UIImage? {
        let image = UIImage(named: "WhiteBackgroundSmall")!

        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.clear
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.text = text
        label.font = UIFont(name: "Helvetica Bold", size: 122)
        label.adjustsFontSizeToFitWidth = true
        
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imageWithText = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView2 = UIImageView(image: imageWithText)
        imageView2.backgroundColor = UIColor.clear
        imageView2.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.width)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.width))

        UIGraphicsBeginImageContextWithOptions(label2.bounds.size, false, 0)
        imageView2.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imageWithText2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageWithText2
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
