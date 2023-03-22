//
//  OnBoardingView.swift
//  OnBoarding
//
//  Created by Time Ruchutrakool on 3/22/23.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onBoarding") var isOnBoardingActive = true
    @State var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State var buttonOffset: CGFloat = 0
    @State var isAnimating = false
    @State var dragImage: CGSize = .zero
    
    var body: some View {
        
        ZStack{
            Color("ColorBlue")
                .edgesIgnoringSafeArea(.all)
            GeometryReader { geo in
                VStack{
                    //MARK: -  HEADER
                    VStack{
                        Text("Shared.")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                        
                        Text("""
                     It's not howmuch we give but
                     how much we love into giving
                     """)
                        .font(.title3)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    }//: VSTACK
                    .padding()
                    .offset(y: isAnimating ? 0 : -30)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeOut(duration: 1), value: isAnimating)
                    Spacer()
                    //MARK: - CENTER
                    ZStack{
                        CircleView(ShapeColor: .white, ShapeOpacity: 0.2)
                            .scaleEffect(isAnimating ? 1 : 0.8)
                            .animation(.spring(dampingFraction: 0.3), value: isAnimating)
                            .offset(x: -dragImage.width)
                            .blur(radius: abs(dragImage.width)/5)
                            .animation(.easeOut, value: dragImage)
                        
                        Image("character-1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 470,height: 470)
                            .offset(x: dragImage.width)
                            .rotationEffect(Angle(degrees: dragImage.width/50),anchor: .bottom)
                            .gesture(DragGesture()
                                .onChanged({ value in
                                    dragImage = value.translation
                                })
                                    .onEnded({ _ in
                                        withAnimation(Animation.spring(dampingFraction: 0.7)){
                                            dragImage = .zero
                                        }
                                    })
                            )
                        
                    }
                    Spacer()
                    
                    //MARK: - FOOTER
                    ZStack{
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                            .padding()
                        Text("Get Started")
                            .font(.system(size: 20))
                            .opacity(0.8)
                            .foregroundColor(.white)
                        
                        HStack{
                            Capsule().fill(Color("ColorRed"))
                                .frame(width: buttonOffset + 80)
                            Spacer()
                        }//:HSTACK
                        HStack{
                            ZStack{ //DragButton
                                Circle().fill(Color("ColorRed"))
                                Circle().fill(.black.opacity(0.15))
                                    .padding(8)
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 30))
                                    .bold()
                                    .foregroundColor(.white)
                            }//: ZSTACK
                            .offset(x:buttonOffset)
                            .gesture(DragGesture()
                                .onChanged({ value in
                                    if value.translation.width > 0{
                                        if buttonOffset <= buttonWidth - 80 {
                                            buttonOffset = value.translation.width
                                        }
                                    }
                                    
                                })
                                    .onEnded({ value in
                                        withAnimation(Animation.easeOut(duration: 0.4)){
                                            if value.translation.width < buttonWidth * 2 / 3 {
                                                buttonOffset = .zero
                                            }
                                            else{
                                                
                                                
                                                
                                                buttonOffset = buttonWidth - 80
                                                isOnBoardingActive = false
                                                
                                            }
                                        }
                                        
                                    })
                            )
                            //.animation(Animation.linear, value: buttonOffset)
                            Spacer()
                        }//: HSTACK
                        
                    }//: ZSTACK
                    .frame(width: buttonWidth,height: 80,alignment: .center)
                    .padding(.horizontal,70)
                    .offset(y: isAnimating ? 0 : 30)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeOut(duration: 1), value: isAnimating)
                }//: VStack
                .frame(width: geo.size.width,height: geo.size.height)
            }
            .padding()
        } //: ZSTACK
        .onAppear(){
            
            isAnimating = true
            
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
