import ArgumentParser
import Foundation

let allAdvents: [any AdventDay] = [
    Day01(), Day02(), Day03(),
    Day04(), Day05(), Day06(),
]

@main
struct AdventOfCode: ParsableCommand {
    @Option(name: .shortAndLong, help: "The day to run, if not provided all days will run.")
    var day: Int?

    @Option(name: .shortAndLong, help: "The part to run, if not provided all parts will run.")
    var part: Int?

    mutating func run() throws {
        if let day {
            runAdvent(allAdvents[day - 1])
        } else {
            for advent in allAdvents {
                runAdvent(advent)
            }
        }
    }

    private func runAdvent(_ advent: any AdventDay) {
        var parts = [String]()
        if part == 1 || part == nil {
            let (part1, elapsed) = measureElapsedTime(advent.part1)
            let elapsedFormat = String(format: "%.02f", elapsed)
            parts.append("Part 1: \(part1) (\(elapsedFormat)ms)")
        }
        if part == 2 || part == nil {
            let (part2, elapsed) = measureElapsedTime(advent.part2)
            let elapsedFormat = String(format: "%.02f", elapsed)
            parts.append("Part 2: \(part2) (\(elapsedFormat)ms)")
        }
        print("-- Day \(String(format: "%02d", advent.day)) --")
        print(parts.joined(separator: "\n"), terminator: "\n\n")
    }
}

private func measureElapsedTime(_ operation: () -> Any) -> (Any, Double) {
    let startTime = DispatchTime.now()
    let result = operation()
    let endTime = DispatchTime.now()
    let elapsed = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000
    return (result, elapsed)
}
