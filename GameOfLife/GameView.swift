//
//  ContentView.swift
//  GameOfLife
//
//  Created by Nicolas Rios on 1/19/24.
//

import SwiftUI


struct GameView: View {
    @ObservedObject var viewModel = GameOfLifeViewModel()

    var body: some View {
        NavigationView{
            VStack {
                ForEach(viewModel.grid.indices, id: \.self) { row in
                    HStack {
                        ForEach(viewModel.grid[row].indices, id: \.self) { column in
                            Button(action: {
                                viewModel.toggleCellState(at: row, column: column)
                            }) {
                                Rectangle()
                                    .frame(width: 30, height: 35)
                                    .foregroundStyle(viewModel.grid[row][column].isAlive ? Color.blue : Color(uiColor: .systemGray4))
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
                Button(action: {
                    viewModel.nextGeneration()
                }) {
                    Text("Next Generation")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .navigationBarTitle("Game Of Life")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .padding()
    }
}

#Preview {
    GameView()
}
