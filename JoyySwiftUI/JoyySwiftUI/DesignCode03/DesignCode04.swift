//
//  DesignCode04.swift
//  JoyySwiftUI
//
//  Created by 常远 on 2021/5/17.
//

import SwiftUI

struct DesignCode04: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Card Back")
            }
            .frame(width: 300, height: 220.0)
            .background(Color.blue)
            .cornerRadius(10.0)
            .shadow(radius: 20)
            .offset(x: 0, y: -20)
            
            VStack {
                HStack {
                    VStack {
                        Text("UI Design")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.horizontal)
                Spacer()
                Image("Background")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
                
        }
    }
}

struct DesignCode04_Previews: PreviewProvider {
    static var previews: some View {
        DesignCode04()
    }
}
