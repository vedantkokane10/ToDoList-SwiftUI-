//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
//        NavigationView { // by using navigation view we can go back and fowward
            if viewModel.isSignedIn,!viewModel.currentUserId.isEmpty{
                // signed in
                
                // call of view that we wrote down below
                accountView
                
            }
            else{
                RegisterView()
            }
            
//        }
        
    }
    
    
    @ViewBuilder
    var accountView : some View{
        TabView {
            ToDoListView(userId : viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "square.and.pencil")
                }
            
            ProfileView()
                .tabItem {
                    Label("Account", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
