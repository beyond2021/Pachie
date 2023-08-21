//
//  ContentView.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/11/23.
//
/*
import SwiftUI

struct ContentView: View {
    //View Properties
    @State private var showSignup: Bool = false
    // Keyboard Status
    @State private var isKeyboardShowing: Bool = false
    var body: some View {
        NavigationStack {
            LoginView(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    SignUp(showSignup: $showSignup)
                }
            /// checking if a keyboard is visible
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: { _ in
                    
                    // Disabling it for signup
                    if !showSignup {
                        isKeyboardShowing = true
                    }
                    
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
                    isKeyboardShowing = false
                })
            
        }
        .overlay {
            // iOS17 Bounce Animations
            if #available(iOS 17, *) {
                CircleView()
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: showSignup)
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: isKeyboardShowing)
                
            } else {
                CircleView()
                    .animation(.easeInOut(duration: 0.3), value: showSignup)
                    .animation(.easeInOut(duration: 0.3), value: isKeyboardShowing)
                
            }
            
        }
       
//       HomeView()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.BG) // shapestyle extension
//            .preferredColorScheme(.light)
    }
    //MARK: Moving Blurred background
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(.linearGradient(colors: [.appYellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            
            .frame(width: 200, height: 200)
        ///  Moves when the sign up page loads/dismisses
        
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardShowing ? 200 : 0))
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}
 */



import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        if logStatus {
            DemoHome()
        } else {
            Home()
        }
 //       Home()
//        if logStatus{
//            // MARK: YOUR HOME VIEW
//           // Home()
 //          DemoHome()
//
//        }else{
//            Login()
//        }
    }
    
    @ViewBuilder
    func DemoHome()->some View{
        NavigationStack{
           // Text("Logged In")
            HomeView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.BG) // shapestyle extension
                .preferredColorScheme(.light)
                .navigationTitle("Pachie")
                .toolbar {
                    ToolbarItem{
                        Button("Logout"){
                            try? Auth.auth().signOut()
                            GIDSignIn.sharedInstance.signOut()
                            withAnimation(.easeInOut){
                                logStatus = false
                            }
                        }
                    }
                }
        }
    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
