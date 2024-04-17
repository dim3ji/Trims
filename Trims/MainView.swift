//
//  ContentView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 31/03/2024.
//

import SwiftUI

struct MainView: View {
    var dataService = DataService()
   @State var hairStylesList: [HairStyleModel] = [HairStyleModel]()
    @State var selectedImage = String()
    @State private var selectedButtonIndex: Int?

    let filters = ["All", "Low Cut", "Skin Fade", "Drop Fade"]
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .center){
                    Text("Trims")
                        .font(.largeTitle)
                        .bold()
                    
                    ScrollView(.horizontal,showsIndicators:false){
                        HStack{
                            Spacer()
                            ForEach(0..<filters.count, id: \.self) { index in
                                Button(action: {
                                    self.selectedButtonIndex = index
                                    hairStylesList = dataService.getSortedData(sortType: filters[index].removingWhitespaces())
                                }) {
                                    Text(filters[index])
                                        .frame(height: 10)
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
                        }.padding([.bottom,.top],0.3)
                    }

                    ScrollView(showsIndicators:false){
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 9),
                                            GridItem(.flexible())], spacing: 1){
                            ForEach(hairStylesList){hairStyle in
                                NavigationLink(destination: SelectedStyleView(selectedImage: hairStyle.imageName)){
                                    HairStyleView(hairStyle: hairStyle)
                                    }
                                }
                        }
                        .onAppear(perform: {
                            selectedButtonIndex = 0
                            hairStylesList = dataService.getData()
                        })
                    }

                }
                .padding(0.5)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    private func buttonBackgroundColor(for index: Int) -> Color {
        if let selectedIndex = selectedButtonIndex {
            return index == selectedIndex ? .black : .white
        } else {
            return .white
        }
    }
    
    private func buttonForegroundColor(for index: Int) -> Color {
        if let selectedIndex = selectedButtonIndex {
            return index == selectedIndex ? .white : .black
        } else {
            return .black
        }
    }
    
}

extension String {
    func removingWhitespaces() -> String {
        return self.filter { !$0.isWhitespace }
    }
}

#Preview {
    MainView()
}
