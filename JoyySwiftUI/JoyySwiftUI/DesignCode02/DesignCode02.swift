//
//  DesignCode02.swift
//  JoyySwiftUI
//
//  Created by 常远 on 2021/5/17.
//

import SwiftUI

struct DesignCode02: View {
    var body: some View {
        HStack {
            VStack {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("Certificate")
                    .foregroundColor(Color("accent"))
            }
            Image("Logo")
        }
        
    }
}

struct DesignCode02_Previews: PreviewProvider {
    static var previews: some View {
        DesignCode02()
    }
}
