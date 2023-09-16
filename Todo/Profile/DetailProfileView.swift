//
//  DetailProfileView.swift
//  Pachie
//
//  Created by KEEVIN MITCHELL on 9/5/23.
//

import SwiftUI
struct DetailProfileView: View {
    @Binding var showProfileView: Bool
    // Color Scheme
    @Environment(\.colorScheme) private var scheme
    var body: some View {
        VStack {
            GeometryReader(content: { geometry in
                let size = geometry.size
               
                Image(.pic)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .overlay {
                            let color = scheme == .dark ? Color.black : Color.white
                            LinearGradient(colors: [
                                .clear,
                                .clear,
                                .clear,
                                color.opacity(0.1),
                                color.opacity(0.5),
                                color.opacity(0.9),
                                color,
                            ], startPoint: .top, endPoint: .bottom)
                        }
                        .clipped()
               
            })
            .frame(maxHeight: 350)
            .overlay(alignment: .topLeading) {
                Button(action: {
                    //Closing Profile
                    showProfileView = false
                }, label: {
                    Image(systemName: "xmark")
//                        .font(.title3)
                        .foregroundStyle(.white)
                        .contentShape(.rect)
                        .padding(10)
                        .background(.black, in: .circle)
                })
                .padding([.leading, .top], 28)
                .scaleEffect(0.9)
            }
            Spacer()
       
        }
        
    }
}
