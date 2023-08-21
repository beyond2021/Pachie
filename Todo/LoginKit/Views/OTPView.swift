//
//  OTPView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 8/6/23.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
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
            .padding(.top, 15)
           Text("Enter OTP code")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("A 6 digit code has been sent to your email.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack( spacing: 25, content: {
                // Custom OTP TextField
                OTPVerificationView(otpText: $otpText)
  
                //MARK: Sign up Button
                GradientButton(title: "Send link", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                /// Disable until the data is entered
                .disableWithOpacity(otpText.isEmpty)
               
                
            })
            .padding(.top, 20)
            Spacer(minLength: 0)
           
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        // since this is going to be a sheet
        .interactiveDismissDisabled()
    }
//}}
}

#Preview {
   ContentView()
}
