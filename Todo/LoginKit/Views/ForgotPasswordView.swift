//
//  ForgetPasswordView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 8/6/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var showReset: Bool
    //MARK: View Properties
    @State private var emailID: String = ""
    // Environment Properties
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                dismiss()
                
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
           Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("Please enter your email address so that we can send you a reset link")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack( spacing: 25, content: {
                
                // Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)

                //MARK: Sign up Button
                GradientButton(title: "Send link", icon: "arrow.right") {
                    // Code after link is sent
                    Task {
                        dismiss()
                        try await Task.sleep(nanoseconds: (0))
                        ///showing the reset view
                        showReset = true
                    }
                    
                }
                .hSpacing(.trailing)
                /// Disable until the data is entered
                .disableWithOpacity(emailID.isEmpty)
               
                
            })
            .padding(.top, 20)
           
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        // since this is going to be a sheet
        .interactiveDismissDisabled()
    }
}

//#Preview {
//    ForgetPasswordView()
//}
