//
//  Onboarding.swift
//  Care&Love
//
//  Created by mohammed on 13/02/2024.
//

import SwiftUI

struct Onboarding: View {
    //Properties
    
    @AppStorage("isOnboarding") var isOnboarding:Bool = true
    @State var isAnimating:Bool = false
    @State var imageOffset: CGSize = CGSize(width: 0.0, height: 0.0)
    @State var buttonOffset : CGFloat = 0.0
    @State var buttonWidth : Double = UIScreen.main.bounds.width - 80
    
    let feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea()
            
            VStack{
                //MARK: - Header
                VStack{
                    Text(abs(imageOffset.width) > 0 ? "Care." : "Love")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.white)
                    
                    Text("Life doesn't come with an manua, it comes with a mother")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .padding(.horizontal , 10)
                        .multilineTextAlignment(.center)
                }//: Vstack
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeInOut(duration: 1) , value: isAnimating)
                Spacer()
                //MARK: Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width)/5 , opaque: false)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .offset(x: imageOffset.width , y:0)
                        .rotationEffect(.degrees(imageOffset.width / 15))
                        .scaleEffect(isAnimating ? 1 : 0.8)
                        .animation(.easeInOut(duration: 0.5), value: isAnimating)
                        .shadow(color: .black.opacity(0.5), radius: 8, x: 3, y: 30)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundStyle(.white)
                                .opacity(abs(imageOffset.width) > 0 ? 0 : 1)
                            ,alignment: .bottom
                        )
                        .frame(width: 300 , alignment: .center)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if abs(gesture.translation.width) <= 150{
                                    imageOffset = gesture.translation
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    imageOffset = .zero
                                }
                                })
                                 
                        )
                }//: Zstack
                
                Spacer()
                
                //MARK: - Footer
                
                ZStack{
                    //1. Background
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    //2. Text
                    Text("Start")
                        .font(.system(size: 30 , design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    //3. Capsule Dynamic
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80 + buttonOffset)
                        Spacer()
                    }
                    //4. Dragable Circle
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 25 , weight: .bold , design: .rounded))
                                .foregroundStyle(.white)
                        }
                        .offset(x: buttonOffset)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0.0  && buttonOffset <= buttonWidth - 80{
                                    buttonOffset = gesture.translation.width
                                }
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        if buttonOffset < buttonWidth / 2{
                                            buttonOffset = 0
                                            feedback.notificationOccurred(.error)
                            
                                        }else {
                                            isOnboarding = false
                                            playSound(soundFile: "chimeup", soundType: "mp3")
                                            feedback.notificationOccurred(.success)
                                        }
                                    }
                                })
                        )
                        Spacer()
                    }
                }//: Zstack (end of footer)
                .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.horizontal , 40)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeInOut(duration: 1) , value: isAnimating)
            }
        }
        .onAppear(perform: {
            isAnimating.toggle()
        })
    }
}

#Preview {
    Onboarding()
}
