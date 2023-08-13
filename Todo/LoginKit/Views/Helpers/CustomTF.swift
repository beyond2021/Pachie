//
//  CustomTF.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 8/5/23.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    // Hides Password
    var isPassword: Bool = false
    @Binding var value: String
    // View Properties
    @State private var showPassword: Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
            // Wee need width to align textfields
                .frame(width:  30)
            //  move down slightly down
                .offset(y: 2)
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        //reveal pw wghen user needs it
                        if showPassword {
                            TextField(hint, text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }
                    }
                   
                    
                } else {
                    TextField(hint, text: $value)
                    
                }
                Divider()
                
            })
            .overlay(alignment: .trailing) {
                // Password reveal button
               if isPassword {
                   Button(action: {
                       
                       withAnimation {
                           showPassword.toggle()
                       }
                   }, label: {
                       Image(systemName: showPassword ? "eye.slash" : "eye")
                           .foregroundStyle(.gray)
                           .padding(10)
                           .contentShape(.rect)
                       
                   })
                    
                }
       
            }
        })
    }
}

