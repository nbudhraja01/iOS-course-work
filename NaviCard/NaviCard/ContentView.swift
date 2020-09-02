//
//  ContentView.swift
//  NaviCard
//
//  Created by Navi Budhraja on 7/7/20.
//  Copyright © 2020 Navi Budhraja. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 184/255, green: 172/255, blue: 252/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("navika_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150.0, height: 150.0, alignment: .center)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                )
                
                Text("Navika Budhraja")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("IOS Developer")
                .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "415-272-0046", imageName: "phone.fill")
                InfoView(text:"nbudhraj@ucsd.edu", imageName: "envelope.fill")
                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

