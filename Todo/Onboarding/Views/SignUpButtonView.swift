//
//  SingUpButtonView.swift
//  Pachie
//
//  Created by KEEVIN MITCHELL on 8/16/23.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift
import Firebase

struct SignUpButtonView: View {
    @StateObject var loginModel: LoginViewModel = .init()
    var body: some View {
       
        GeometryReader {
            let size = $0.size
            Spacer(minLength: 0)
            HStack(spacing: 8){
                // MARK: Custom Apple Sign in Button
                CustomButton()
                .overlay {
                    SignInWithAppleButton { (request) in
                        loginModel.nonce = randomNonceString()
                        request.requestedScopes = [.email,.fullName]
                        request.nonce = sha256(loginModel.nonce)
                        
                    } onCompletion: { (result) in
                        switch result{
                        case .success(let user):
                            print("success")
                            guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                                print("error with firebase")
                                return
                            }
                            loginModel.appleAuthenticate(credential: credential)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .signInWithAppleButtonStyle(.white)
                    .frame(height: 55)
                    .blendMode(.overlay)
                }
                .clipped()
                
                // MARK: Custom Google Sign in Button
                CustomButton(isGoogle: true)
                .overlay {
                    // MARK: We Have Native Google Sign in Button
                    // It's Simple to Integrate Now
                    GoogleSignInButton{
                        Task{
                            do{
                                let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.shared.rootController())
                                
                                loginModel.logGoogleUser(user: result.user)
                                
                            }catch{
                                print(error.localizedDescription)
                            }
                        }
                    }
                    .blendMode(.overlay)
                }
                .clipped()
            }
            .frame(width: size.width)
            
        }
        
        
        
       /*
        VStack {
          HStack(alignment: .center, spacing: 8){
                // MARK: Custom Apple Sign in Button
                CustomButton()
                .overlay {
                    SignInWithAppleButton { (request) in
                        loginModel.nonce = randomNonceString()
                        request.requestedScopes = [.email,.fullName]
                        request.nonce = sha256(loginModel.nonce)
                        
                    } onCompletion: { (result) in
                        switch result{
                        case .success(let user):
                            print("success")
                            guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                                print("error with firebase")
                                return
                            }
                            loginModel.appleAuthenticate(credential: credential)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .signInWithAppleButtonStyle(.white)
                    .frame(height: 55)
                    .blendMode(.overlay)
                }
                .clipped()
                
                // MARK: Custom Google Sign in Button
                CustomButton(isGoogle: true)
                .overlay {
                    // MARK: We Have Native Google Sign in Button
                    // It's Simple to Integrate Now
                    GoogleSignInButton{
                        Task{
                            do{
                                let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.shared.rootController())
                                
                                loginModel.logGoogleUser(user: result.user)
                                
                            }catch{
                                print(error.localizedDescription)
                            }
                        }
                    }
                    .blendMode(.overlay)
                }
                .clipped()
            }
            .padding(.leading, 15)
            
        }
        */
}
    @ViewBuilder
    func CustomButton(isGoogle: Bool = false)->some View{
        HStack{
            Group{
                if isGoogle{
                    Image("Google")
                        .resizable()
                        .renderingMode(.template)
                }else{
                    Image(systemName: "applelogo")
                        .resizable()
                }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .frame(height: 45)
            
            Text("\(isGoogle ? "Google" : "Apple") Sign in")
                .font(.callout)
                .lineLimit(1)
        }
        .foregroundColor(.white)
        .padding(.horizontal,15)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.black)
        }
    
    }
       
}

#Preview {
    SignUpButtonView()
}
