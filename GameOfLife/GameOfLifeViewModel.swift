//
//  GameOfLifeViewModel.swift
//  GameOfLife
//
//  Created by Nicolas Rios on 1/19/24.
//

import Foundation
import SwiftUI
import Combine

struct Cell: Identifiable {
    let id = UUID()
    var isAlive: Bool
}

class GameOfLifeViewModel: ObservableObject {
    @Published var grid: [[Cell]]

    private var cancellables = Set<AnyCancellable>()
    private let numberOfRows = 10
    private let numberOfColums = 10

    init() {
        // Initialize the grid with dead cells
        grid = Array(repeating: Array(repeating: Cell(isAlive: false), count: numberOfColums), count: numberOfRows)
    }

    deinit {
        // Cancel any Combine subscriptions when the object is deallocated
        cancellables.forEach { $0.cancel() }
    }

    // Set the initial seed pattern for the grid
    func setInitialSeed() {
        let predefinedSeed = [
            [false, false, false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false, false, false],
            [false, false, false, true, true, true, false, false, false, false],
            [false, false, false, false, false, false, false, false, false, false],

        ]
        // Apply the predefined seed pattern to the grid
        for row in 0..<min(grid.count, predefinedSeed.count) {
            for column in 0..<min(grid[row].count, predefinedSeed[row].count) {
                grid[row][column].isAlive = predefinedSeed[row][column]
            }
        }
    }

    // Toggle the state of a cell at the specified row and column
    func toggleCellState(at row: Int, column: Int) {
        grid[row][column].isAlive.toggle()
    }

    // Calculate the next generation of the grid based on the rules of the Game of Life
    func nextGeneration() {
        var nextGrid = grid

        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                let cell = grid[row][column]
                let liveNeighbors = countLiveNeighbors(row: row, column: column)

                if cell.isAlive {
                    if liveNeighbors < 2 || liveNeighbors > 3 {
                        nextGrid[row][column].isAlive = false
                    }
                } else {
                    if liveNeighbors == 3 {
                        nextGrid[row][column].isAlive = true
                    }
                }
            }
        }
        // Update the grid to the next generation
        grid = nextGrid
    }
    // Count the number of live neighbors for a given cell
    private func countLiveNeighbors(row: Int, column: Int) -> Int {
        var count = 0

        for i in -1...1 {
            for j in -1...1 {
                let neighborRow = row + i
                let neighborColumn = column + j
                // Check if the neighbor is within bounds and alive
                if neighborRow >= 0 && neighborRow < grid.count && neighborColumn >= 0 && neighborColumn < grid[row].count {
                    if grid[neighborRow][neighborColumn].isAlive {
                        count += 1
                    }
                }
            }
        }
        // Subtract 1 if the current cell is alive to avoid counting itself
        if grid[row][column].isAlive {
            count -= 1
        }

        return count
    }
}


