//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    var layer2 = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    var body: some View {
        NavigationStack{
            VStack{
                // header
                HeaderView(background: Color(uiColor: color), angle: -30,title: "Register")
                
                // form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                    
                    TextField("Sign up", text: $viewModel.email)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Password", text: $viewModel.password  )
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        viewModel.register()
                    } label: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(uiColor: color))
                            .overlay {
                                Text("Register")
                                    .foregroundColor(.white)
                            }
                    }
                    
                }
                //  Spacer()
                
                // login
                VStack{
                    //   Spacer()
                    Text("Already a user")
                    
                    NavigationLink("Log in") {
                        LoginView()
                    }
                    
                    
                }
                
            }
            
        }
        Spacer()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
