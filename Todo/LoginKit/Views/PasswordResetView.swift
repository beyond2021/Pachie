//
//  PasswordResetView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 8/6/23.
//

import SwiftUI

struct PasswordResetView: View {
   
    //MARK: View Properties
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    // Environment Properties
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                dismiss()
                
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
           Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            VStack(spacing: 25) {
                // Custom Text Fields
                CustomTF(sfIcon: "lock", hint: "Password", value: $password)
                CustomTF(sfIcon: "lock", hint: "Confirm Password", value: $confirmPassword)
                .padding(.top, 5)

                //MARK: Sign up Button
                GradientButton(title: "Send link", icon: "arrow.right") {
                    // Code after link is sent
                    // Reset password
                    
                }
                .hSpacing(.trailing)
                /// Disable until the data is entered
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
               
                
            }
            .padding(.top, 20)
           
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        // since this is going to be a sheet
        .interactiveDismissDisabled()
    }
}

#Preview {
    PasswordResetView()
}
