//
//  ContentView.swift
//  OnBoarding
//
//  Created by Time Ruchutrakool on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoarding") var isOnBoardingActive = true
    
    var body: some View {
        if isOnBoardingActive{
            OnBoardingView()
        }
        else{
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
