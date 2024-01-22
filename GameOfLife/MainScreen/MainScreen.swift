//
//  MainScreen.swift
//  GameOfLife
//
//  Created by Nicolas Rios on 1/21/24.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            TabView {
                NavigationView {
                    GameView()
                        .padding()
                }
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }
                .tag(1)

                NavigationView {
                    GameInfoView()
                        .padding()
                        .navigationBarTitle("Info")
                }
                .tabItem {
                    Label("Info", systemImage: "info")
                }
                .tag(2)
            }
        }
    }
}
#Preview {
    MainScreen()
}
