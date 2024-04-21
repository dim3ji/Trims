//
//  SelectedStyleView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 15/04/2024.
//

import SwiftUI

struct SelectedStyleView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showModel = false
    var selectedImage: String
     var title = "Title" // Add a title property
    
    var body: some View {
        NavigationView { // Wrap your view in a NavigationView
            ZStack {
                Color(.black).ignoresSafeArea()
                VStack {
                    Spacer()
                    Image(selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Button(action: { showModel = true }) {
                        Image(systemName: "info.circle")
                            .imageScale(.large)
                    }
                }
                .foregroundColor(.white)
            }
            .navigationBarBackButtonHidden(true) // Hide default back button
            .navigationBarTitle(title, displayMode: .inline) // Set navigation title
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward").foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showModel) {
                ModalView(isShowing: $showModel)
            }
        }.onAppear(perform: {
            // Change the color of the navigation title
            UINavigationBar.appearance().titleTextAttributes = [
                .foregroundColor: UIColor(.white),
                .font: UIFont.systemFont(ofSize: 20, weight: .bold)
            ]
        })
    }
}
#Preview {
    SelectedStyleView(selectedImage: "MidFades")
}
