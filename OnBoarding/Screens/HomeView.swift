//
//  HomeView.swift
//  OnBoarding
//
//  Created by Time Ruchutrakool on 3/22/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onBoarding") var isOnBoardingActive = false
    @State var isAnimating = false
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    CircleView(ShapeColor: .gray, ShapeOpacity: 0.1)
                        .scaleEffect(isAnimating ? 1 : 0.6)
                        .animation(Animation.spring(dampingFraction: 0.3), value: isAnimating)
                    Image("character-2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                        .offset(y: isAnimating ? 20 : -20)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isAnimating)
                }
                Text("""
                    The time that leads to mastery is
                    dependent on the intensity of our
                    focus.
                    """)
                .foregroundColor(.gray)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                Button {
                    isOnBoardingActive = true
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(size: 20))
                        .bold()
                }
                .foregroundColor(.white)
                .padding(20)
                .background(Color("ColorBlue"))
                .cornerRadius(40)
                .padding()
                .offset(y: isAnimating ? 0 : 30)
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.easeOut(duration: 1), value: isAnimating)
                    

            }
        }//: ZSTACK
        .onAppear(){
            isAnimating = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
