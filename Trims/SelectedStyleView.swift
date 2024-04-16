//
//  SelectedStyleView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 15/04/2024.
//

import SwiftUI

struct SelectedStyleView: View {
    @Environment(\.presentationMode) var presentationMode
    var selectedImage: String
    var body: some View {
        ZStack{
            Color(.black).ignoresSafeArea()
            VStack{
                Spacer()
                Image(selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(systemName: "info.circle").imageScale(.large)
            }
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                           , label: {
                        Image(systemName:"chevron.backward")
                    })
                }
            }
        }.foregroundColor(.white)
    }
}

#Preview {
    SelectedStyleView(selectedImage: "MidFades")
}
