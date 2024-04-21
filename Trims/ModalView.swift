//
//  ModalView.swift
//  Trims
//
//  Created by Dimeji Adekanmbi on 19/04/2024.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var isShowing: Bool
    @State private var curHeight: CGFloat = 300
    
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    var body: some View {
        ZStack(alignment: .bottom){
        if isShowing{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeIn)
    }
    var mainView: some View{
        VStack{
            
            ZStack{
                Capsule()
                    .frame(width: 35, height: 4)
                    .foregroundColor(Color(.lightGray))
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack{
                HStack(alignment: .center){
                    Text("open")
                        .foregroundStyle(Color(.black))
                    Spacer()
                    Text("Haircut Info")
                        .font(.system(size: 15, weight: .regular))
                    Spacer()
                    Button(action: {
                        isShowing = false
                    }, label: {
                        Text("Close")
                        .font(.system(size: 15, weight: .regular))
                    })
                    
                }
                .padding(.horizontal)
            }
            ZStack{
                VStack{
                    Text("Lorem ipsum dolor sit amet. Non quos cupiditate id voluptatem repellendus ex neque ipsum cum eius voluptatibus et obcaecati dolor. In voluptatibus natus sit consequatur expedita eos consequatur laboriosam aut eius maxime quo voluptas numquam qui aspernatur laudantium vel nemo ")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(Color(.lightGray))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
                    
                }
                .padding(.horizontal, 30)
                }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    Rectangle()
                    .frame(height: curHeight / 2)
            }
                .foregroundColor(.black))
    }
    
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                }else{
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
       }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedStyleView(selectedImage: "MidFades")
    }
}
