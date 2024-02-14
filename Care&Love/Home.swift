//
//  Home.swift
//  Care&Love
//
//  Created by mohammed on 13/02/2024.
//

import SwiftUI

struct Home: View {
    //Properties
    
    @AppStorage("isOnboarding") var isOnboarding:Bool = false
    @State var isAnimating : Bool = false
    let feedback = UINotificationFeedbackGenerator()

    //Body
    var body: some View {

        VStack(alignment:.center , spacing: 30){
            //MARK: -Header
            ZStack{
                CircleGroupView(circleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300 , alignment: .center)
                    .offset(y: isAnimating ? 30 : -30)
                    .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true) , value: isAnimating )
            }//: Zstack
            
            Text("Having children just puts the whole world into perspecive. Everything else just disapears.")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundStyle(.gray)
            
            
            Button(action: {
                isOnboarding.toggle()
                playSound(soundFile: "success", soundType: "m4a")
                feedback.notificationOccurred(.success)
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 25 , design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        }//: Vstack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                isAnimating.toggle()
            }
        })
    }
}

#Preview {
    Home()
}
