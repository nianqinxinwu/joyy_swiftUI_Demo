//
//  DesignCode02-1.swift
//  JoyySwiftUI
//
//  Created by 常远 on 2021/9/10.
//

import SwiftUI

struct DesignCode02_1: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .background(Color(.blue))
        .cornerRadius(10)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x: 10, y: 10)
        .onTapGesture {
            print("hello")
        }
        
    }
}

struct DesignCode02_1_Previews: PreviewProvider {
    static var previews: some View {
        DesignCode02_1()
    }
}
