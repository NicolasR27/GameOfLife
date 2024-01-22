//
//  GameInfoView.swift
//  GameOfLife
//
//  Created by Nicolas Rios on 1/21/24.
//

import SwiftUI

struct GameInfoView: View {
    var body: some View {
        Form {
            Section(header: Text("Game Info")
                .font(.largeTitle)
                .foregroundColor(.purple)) {
                    Text("1. Any live cell with two to three neighbors survives.")
                    Text("2. Any dead cell with three live neighbors becomes a live")
                    Text("3. All other live cells die in the next generation. All other dead cells stay dead")

                }
        }
        .padding()
    }
}

#Preview {
    GameInfoView()
}
