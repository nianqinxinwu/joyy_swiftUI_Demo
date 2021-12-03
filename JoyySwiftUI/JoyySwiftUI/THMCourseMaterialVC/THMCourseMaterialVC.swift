//
//  THMCourseMaterialVC.swift
//  JoyySwiftUI
//
//  Created by 常远 on 2021/11/1.
//

import SwiftUI

struct THMCourseMaterialVC: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("OverView")
                    .font(.system(size: 18))
                Text("Content")
                    .font(.system(size: 18))
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: 40, alignment: .center)
            Image("accent")
                .frame(width: 60, height: 6, alignment: .bottomLeading)
                .background(THMRoundCorners(color: .green, tl: 1.0, tr: 1.0, bl: 1.0, br: 1.0))
                .offset(x: -40, y: -10)
        }
        .frame(width:UIScreen.main.bounds.width - 32, height: 60, alignment: .center)
    }
}




struct THMCourseMaterialVC_Previews: PreviewProvider {
    static var previews: some View {
        THMCourseMaterialVC()
    }
}
