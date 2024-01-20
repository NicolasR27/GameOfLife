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

    init() {
        grid = Array(repeating: Array(repeating: Cell(isAlive: false), count: 10), count: 10)
    }

    func toggleCellState(at row: Int, column: Int) {
        grid[row][column].isAlive.toggle()
    }

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

        grid = nextGrid
    }

    private func countLiveNeighbors(row: Int, column: Int) -> Int {
        var count = 0

        for i in -1...1 {
            for j in -1...1 {
                let neighborRow = row + i
                let neighborColumn = column + j

                if neighborRow >= 0 && neighborRow < grid.count && neighborColumn >= 0 && neighborColumn < grid[row].count {
                    if grid[neighborRow][neighborColumn].isAlive {
                        count += 1
                    }
                }
            }
        }

        if grid[row][column].isAlive {
            count -= 1
        }

        return count
    }
}
