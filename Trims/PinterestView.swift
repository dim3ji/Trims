//
//  PinterestView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 20/04/2024.
//

import SwiftUI

struct PinterestView: View {
    let spacing: CGFloat
    var hairStylesList: [HairStyleModel]
    var body: some View {
            HStack(alignment:.top, spacing: spacing) {
                VStack(spacing: spacing) {
                    ForEach(hairStylesList.indices, id: \.self) { index in
                        if index % 2 == 0 { // Place images in the first VStack
                            NavigationLink(destination: SelectedStyleView(selectedImage: hairStylesList[index].imageName)){
                                Image(hairStylesList[index].imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity) // Expand VStack to fill available width
                
                VStack(spacing: spacing) {
                    ForEach(hairStylesList.indices, id: \.self) { index in
                        
                        if index % 2 != 0 { // Place images in the second VStack
                            NavigationLink(destination: SelectedStyleView(selectedImage: hairStylesList[index].imageName)){
                                Image(hairStylesList[index].imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }

                }
                .frame(maxWidth: .infinity) // Expand VStack to fill available width
            }
    }
}

#Preview {
    PinterestView(spacing: 2, hairStylesList: [
        HairStyleModel(imageName: "Bellingham", tags: ["Fade","Low","MidFade","Waves"]),
        HairStyleModel(imageName: "ShortFade", tags: ["Fade","Low","LowCut","Waves"])
    ])
}
