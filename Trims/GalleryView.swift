//
//  GalleryView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 16/04/2024.
//

import SwiftUI

struct GalleryView: View {
    let imageNames: [String]
    @State private var currentIndex: Int = 0
    @GestureState private var translation: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
                    .gesture(
                        DragGesture()
                            .updating(self.$translation, body: { (value, state, _) in
                                state = value.translation.width / geometry.size.width
                            })
                            .onEnded({ (value) in
                                let offset = value.translation.width / geometry.size.width
                                let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                                self.currentIndex = max(0, min(Int(newIndex), self.imageNames.count - 1))
                            })
                    )
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }

        }
    }
}

struct ContentView: View {
    let images = ["Bellingham", "DropFade", "DropFade"] // Add your image names here

    var body: some View {
        NavigationView {
            GalleryView(imageNames: images)
                .navigationBarTitle("Gallery")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    GalleryView(imageNames: ["Bellingham","DropFade","MidFade"])
}
