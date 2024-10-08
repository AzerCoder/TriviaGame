//
//  ContentView.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var manager = TriviaManager()
    var body: some View {
        NavigationView {
            VStack(spacing:40){
                VStack(spacing:20){
                    Text("Trivate Game")
                        .lilacTitle()
                    Text("Are you ready to test out your trivia skills?")
                }
                .foregroundColor(.accent)
                NavigationLink {
                    HomeView()
                        .environmentObject(manager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(.bg)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(TriviaManager())
}
