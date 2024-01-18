//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    var layer2 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                // Header
                HeaderView(background: Color(uiColor: color), angle: 30,title: "Log in")
                
                Spacer()
                
                // form for login
                Form{
                    if !(viewModel.errorMessage.isEmpty){
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                        
                    }
                    
                    TextField("Email",text: $viewModel.email)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Password", text:  $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        viewModel.login()
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(uiColor: color))
                            .overlay {
                                Text("Log In").foregroundColor(.white)
                            }
                    }
                }
                
                // register
                VStack{
                    
                    Text("New User")
                    NavigationLink("Register") {
                        RegisterView()
                    }
                    
                }
                
                
                
            }
            
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
