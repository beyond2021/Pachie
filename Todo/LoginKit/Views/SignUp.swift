//
//  SignUp.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 8/5/23.
//

import SwiftUI

struct SignUp: View {
    @Binding var showSignup: Bool
    //MARK: View Properties
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    /// Present if we want to ask OTP for Login
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                showSignup = false
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
           Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack( spacing: 25, content: {
                
                // Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                
                CustomTF(sfIcon: "person", hint: "Full Name",  value: $fullName)
                    .padding(.top, 5)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true,  value: $password)
                    .padding(.top, 5)
         
                //MARK: Sign up Button
                GradientButton(title: "Continue", icon: "arrow.right") {
                    // YOUR CODE
                    askOTP.toggle()
                    
                }
                .hSpacing(.trailing)
                /// Disable until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
                
            })
            .padding(.top, 20)
            Spacer(minLength: 0)
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                Button("Login") {
                    showSignup = false
                    
                }
                .fontWeight(.bold)
                .tint(.appYellow)
            }
            .font(.callout)
            .hSpacing(.center)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        //OTP Prompt
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *) {
                // since we wantewd a custom sheet corner radius
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                  
                    
            }
        })
    }
}
//#Preview {
//    SignUp()
//}
