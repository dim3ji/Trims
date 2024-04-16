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
                            Spacer()
                            Button("All"){
                            }
                            .frame(height: 10)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.black))
                            .clipShape(Capsule())

                            Button("Low Cut"){
                            }
                            .frame(height: 11)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .clipShape(Capsule())
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 0.5)
                            )
                            
                            Button("Skin Fade"){
                            }
                            .frame(height: 11)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .clipShape(Capsule())
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 0.5)
                            )
                            Spacer()
                            Button("Drop Fade"){
                            }
                            .frame(height: 11)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color(.white))
                            .clipShape(Capsule())
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 0.5)
                            )
                            Spacer()
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
                            hairStylesList = dataService.getData()
                        })
                    }

                }
                .padding(0.5)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    MainView()
}
