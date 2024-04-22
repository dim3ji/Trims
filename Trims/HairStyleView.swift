//
//  hairStyleView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 31/03/2024.
//

import SwiftUI

struct HairStyleView: View {
    let imageName: String
    @Binding var sort: String

    var body: some View {
        NavigationLink(destination: SelectedStyleView(selectedImage: imageName, title: $sort)) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}


#Preview {
    HairStyleView(imageName: "Bellingham", sort: Binding.constant("Low Cut"))
}
