//
//  RingView.swift
//  JoyySwiftUI
//
//  Created by 常远 on 2021/9/8.
//

import SwiftUI

struct RingView: View {
    /// 默认变量
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 200
    var height: CGFloat = 200
    var percent: CGFloat = 88
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        
        /// 圆环
        return ZStack {
            /// 底图
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth:5 * multiplier))
                .frame(width: width, height:height)
            /// 进度条
            Circle()
                /// 设置进度条进度起点终点
                .trim(from: show ? progress : 1, to: 1.0)
                /// 颜色填充
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style:  StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
                /// 旋转角度
                .rotationEffect(Angle(degrees: 90))
                /// 旋转角度
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0, z: 0.0)
                )
                /// 视图大小
                .frame(width: width, height: height)
                /// 阴影
                .shadow(color: Color(color2).opacity(0.1), radius: 3, x: 0, y: 3 * multiplier)
                .animation(.easeOut)
            /// 进度文案
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
                }
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
