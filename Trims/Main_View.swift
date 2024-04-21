//
//  ContentView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 31/03/2024.
//

import SwiftUI

struct Main_View: View {
    @StateObject var filterSelection = FilterSelection()
    @State var hairStylesList: [HairStyleModel] = []
    @State var selectedImage = String()
    @State private var isFirstAppearance: Bool = true
    
    let filters = ["All", "Low Cut", "Skin Fade", "Drop Fade"]
    var dataService = DataService()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.white.ignoresSafeArea()
                VStack(alignment: .center){
                    Text("Trims")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding()

                    ScrollView(.horizontal,showsIndicators:false){
                        HStack{
                            Spacer()
                            ForEach(0..<filters.count, id: \.self) { index in
                                Button(action: {
                                    filterSelection.selectedButtonIndex = index
                                    hairStylesList = dataService.getSortedData(sortType: filters[index].removingWhitespaces())
                                }) {
                                    Text(filters[index])
                                        .frame(height: 5)
                                        .padding()
                                        .foregroundColor(buttonForegroundColor(for: index))
                                        .background(buttonBackgroundColor(for: index))
                                        .clipShape(Capsule())
                                        .overlay( /// apply a rounded border
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.gray, lineWidth: 0.5)
                                        )
                                }
                            }
                        }.padding([.bottom,.top],10)
                    }
                    
                    ScrollView(showsIndicators:false){
                        PinterestView(spacing: 2, hairStylesList: hairStylesList)
                    }.onAppear(perform: {
                        hairStylesList = dataService.getData()
                    })

                }
                .padding(0.5)
            }
            .ignoresSafeArea(edges: .bottom)
            .environmentObject(filterSelection)
        }
    }
    
    private func buttonBackgroundColor(for index: Int) -> Color {
        if index == filterSelection.selectedButtonIndex {
             return .black
         } else {
             return .white
         }
     }
    
    private func buttonForegroundColor(for index: Int) -> Color {
        if index == filterSelection.selectedButtonIndex {
            return .white
        } else {
            return .black
        }
    }
    
}

#Preview {
    Main_View()
}
