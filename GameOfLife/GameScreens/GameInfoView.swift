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
            Section(header: Text("Game Description")) {
                Text("The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input.")
            }

            Section(header: Text("Rules")) {
                Text("Rule 1: Any live cell with two to three neighbors survives")
                Text("Rule 2: Any dead cell with three live neighbors becomes a live cell")
                Text("Rule 3: All other live cells die in the next generation. All other dead cells stay dead")
            }
        }
    }
}


#Preview {
    GameInfoView()
}
