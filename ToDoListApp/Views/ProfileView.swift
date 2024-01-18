//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user{
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125,height: 125)
                        .padding()
                    
                        // Info - name , email , member access
                        VStack(alignment: .leading){
                            HStack{
                                Text("Name - ").bold()
                                Text(user.name)
                            }.padding()
                            
                            HStack{
                                Text("Email - ").bold()
                                Text(user.email)
                            }.padding()
                            
                            HStack{
                                Text("Member Since - ").bold()
                                Text((Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened)))
                            }.padding()
                            
                        }
                   //  sign out
                        Button {
                            viewModel.logout()
                        } label: {
                            Text("Sign out").foregroundColor(.red)
                        }
                }
                else{
                    Text("Loading Profile data")
                }
            }.navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
