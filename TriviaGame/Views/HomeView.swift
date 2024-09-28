//
//  HomeView.swift
//  TriviaGame
//
//  Created by A'zamjon Abdumuxtorov on 28/09/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    @State var showView = false
    @EnvironmentObject var manager: TriviaManager
    @State var categories = ["General Knowladge","Books","Film","Music","Musicals & Theatres","Television","Video Games","Board Games","Nature","Computers","Mathematics","Mythology","Sports","Geography","History","Politics","Art","Celebraties","Animals","Vehicles","Comics","Gadgets","Japanese Anime & Manga","Cartoon Animations"]
    var body: some View {
        VStack(spacing:20){
            ScrollView{
                Text("Chouse the category!")
                    .lilacTitle()
                ForEach(categories,id: \.self) { item in
                    NavigationLink {
                        TriviaView()
                            .environmentObject(manager)
                            .onAppear{
                                print(item.count)
                                manager.category = 8 + item.count
                                withAnimation{
                                    showView = true
                                }
                                print(manager.category)
                            }
                    } label: {
                        HStack {
                            Text("\(item)")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.accent)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(.white)
                        .cornerRadius(15)
                    }
                    
                    //                    Button {
                    //                        print(item.count)
                    //                        manager.category = 8 + item.count
                    //                        withAnimation{
                    //                            showView = true
                    //                        }
                    //                        print(manager.category)
                    //                    } label: {
                    //
                    //                    }
                    //                    .fullScreenCover(isPresented: $showView) {
                    //                        TriviaView()
                    //                            .environmentObject(manager)
                    //                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.bg)
    }
}

#Preview {
    HomeView()
        .environmentObject(TriviaManager())
}
