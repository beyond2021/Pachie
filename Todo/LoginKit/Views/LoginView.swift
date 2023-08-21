//
//  LoginView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 8/5/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var showSignup: Bool
    //MARK: View Properties
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgetPasswordView: Bool = false
    /// reset password view with(password and confirm password)
    @State private var showResetView: Bool = false
    /// Present if we want to ask OTP for Login
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer(minLength: 0)
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Please sign in to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            VStack( spacing: 25, content: {
                // Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true,  value: $password)
                    .padding(.top, 5)
                Button("Forgot Password?") {
                    showForgetPasswordView.toggle()
                    
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.appYellow)
                .hSpacing(.trailing)
                //MARK: Login Button
                GradientButton(title: "Login", icon: "arrow.right") {
                    // YOUR Code
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                /// Disable until the data is entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
                
            })
            .padding(.top, 20)
            Spacer(minLength: 0)
            HStack(spacing: 6) {
                Text("Dont have an account?")
                    .foregroundStyle(.gray)
                Button("Sign Up!") {
                    showSignup.toggle()
                    
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
        // Getting Email To Send Reset Link
        .sheet(isPresented: $showForgetPasswordView, content: {
            if #available(iOS 16.4, *) {
                // since we wantewd a custom sheet corner radius
                ForgotPasswordView(showReset: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPasswordView(showReset: $showResetView)
                    .presentationDetents([.height(300)])
                    
            }
        })
        //Resetting New Password
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                // since we wantewd a custom sheet corner radius
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(350)])
                  
                    
            }
        })
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

#Preview {
    ContentView()
}
