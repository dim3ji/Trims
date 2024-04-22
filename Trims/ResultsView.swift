//
//  PinterestView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 20/04/2024.
//

import SwiftUI

struct ResultsView: View {
    @Binding var sort: String
    let spacing: CGFloat
    var hairStylesList: [HairStyleModel]

    var body: some View {
            HStack(alignment:.top, spacing: spacing) {
                LazyVStack(spacing: spacing) {
                    ForEach(hairStylesList.indices.filter { $0 % 2 == 0 }, id: \.self) { index in
                            HairStyleView(imageName: hairStylesList[index].imageUrl, sort: $sort)
                            .frame(maxWidth: .infinity)
                        }
                }
                LazyVStack(spacing: spacing) {
                    ForEach(hairStylesList.indices.filter { $0 % 2 != 0 }, id: \.self) { index in
                            HairStyleView(imageName: hairStylesList[index].imageUrl, sort: $sort)
                            .frame(maxWidth: .infinity)
                        }
                }
            }
    }
}

#Preview {
    ResultsView(sort: Binding.constant("LowFade"), spacing: 2, hairStylesList: [
        HairStyleModel(imageUrl: "Bellingham", tags: ["Fade","Low","MidFade","Waves"], info: "Information"),
        HairStyleModel(imageUrl: "ShortFade", tags: ["Fade","Low","LowCut","Waves"], info: "information")
    ])
}
