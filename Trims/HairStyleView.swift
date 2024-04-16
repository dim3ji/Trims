//
//  hairStyleView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 31/03/2024.
//

import SwiftUI

struct HairStyleView: View {
    var hairStyle : HairStyleModel
    var body: some View {
        VStack{
            Image(hairStyle.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200)
                .clipped()
        }
    }
}

#Preview {
    HairStyleView(hairStyle: HairStyleModel(imageName: "Bellingham", tags: ["Fade","Low","MidFade","Waves"]))
}
