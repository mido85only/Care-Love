//
//  CircleGroupView.swift
//  Care&Love
//
//  Created by mohammed on 14/02/2024.
//

import SwiftUI

struct CircleGroupView: View {
    
    var circleGroupColor : Color = .red
    @State var isAnimation: Bool = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleGroupColor.opacity(0.2) , lineWidth: 40)
                .frame(width: 260, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Circle()
                .stroke(circleGroupColor.opacity(0.2) , lineWidth:  80)
                .frame(width: 260, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        } //: ZStack
        .scaleEffect(isAnimation ? 1 : 0.5)
        .animation(.easeInOut(duration: 1) , value: isAnimation)
        .onAppear(perform: {
            isAnimation.toggle()
        })
    }
}

#Preview {
    CircleGroupView()
}
