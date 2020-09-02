//
//  SwiftUIView.swift
//  NaviCard
//
//  Created by Navi Budhraja on 7/7/20.
//  Copyright © 2020 Navi Budhraja. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        Capsule()
            .frame(height: 39, alignment: .center)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(.purple)
                
                Text(text).bold().foregroundColor(Color("FontColor"))
            })
            .padding(.all)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
