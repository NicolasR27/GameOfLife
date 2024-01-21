//
//  GameView.swift
//  GameOfLife
//
//  Created by Nicolas Rios on 1/19/24.
//

import SwiftUI

struct GameView: View {

    @ObservedObject var viewModel = GameOfLifeViewModel()

    @State private var isGlowing = false
    @State private var generationCount = 0

    var body: some View {
        NavigationStack {
            VStack {
                ForEach(viewModel.grid.indices, id: \.self) { row in
                    HStack {
                        // Display the grid using nested ForEach loops
                        ForEach(viewModel.grid[row].indices, id: \.self) { column in
                            // Button for each cell in the grid
                            Button(action: {
                                // Button for each cell in the grid
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    isGlowing.toggle()
                                }
                                viewModel.toggleCellState(at: row, column: column)
                            }) {
                                // Rectangle representing each cell
                                Rectangle()
                                    .frame(width: 30, height: 35)
                                    .foregroundStyle(viewModel.grid[row][column].isAlive ? Color.purple : Color(uiColor: .systemGray4))
                            }
                        }
                    }
                    Spacer()
                }
                Spacer()
                // Button to set the initial seed for the grid
                Button(action: {
                    viewModel.setInitialSeed()
                    generationCount = 0
                }) {
                    Text("Set Initial Seed")
                        .padding(12)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .bold()
                }
                // Button to calculate and display the next generation
                Button(action: {
                    viewModel.nextGeneration()
                    generationCount += 1
                }) {
                    Text("Next Generation(\(generationCount))")
                        .padding(12)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .bold()

                }
                // Apply navigation bar styling
                Spacer()
                    .navigationBarTitle("Game Of Life")
                    .navigationBarTitleDisplayMode(.inline)

           }
        }
        // Apply padding to the entire view
        .padding()
    }
}

#Preview {
    GameView()
}
