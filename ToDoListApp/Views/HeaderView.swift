//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct HeaderView: View {
    var background : Color
    var layer1 = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    var layer2 = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    var angle : Double  // 30 for login
    @State var title = "Title"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(background).opacity(0.9)
                .rotationEffect(Angle(degrees: angle)) // to rotate
                .frame(width:600,height: 250)
                .padding()
                .offset(y:-100) // to move it up
                .ignoresSafeArea()
            
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .offset(y:-100) // to move it up
        }.frame(width:UIScreen.main.bounds.width * 3)
            
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(background: Color(.red), angle: 30,title: "String")
    }
}
