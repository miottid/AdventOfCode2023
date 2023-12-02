import ArgumentParser
import Foundation

@main
struct AdventOfCode: ParsableCommand {
    @Option(name: .shortAndLong, help: "The day to run, if not provided all days will run.")
    var day: Int?

    @Option(name: .shortAndLong, help: "The part to run, if not provided all parts will run.")
    var part: Int?

    mutating func run() throws {
        let advents = [Day01.self, Day02.self]
        if let day = day {
            let advent = advents[day - 1]
            print("Day \(day) –", terminator: " ")
            let input = getAdventInput(String(format: "day%02d", day))
            runAdvent(advent.init(input))
        } else {
            for (i, advent) in advents.enumerated() {
                print("Day \(i + 1) –", terminator: " ")
                let input = getAdventInput(String(format: "day%02d", i + 1))
                runAdvent(advent.init(input))
            }
        }
    }

    private func runAdvent(_ advent: Advent) {
        var parts = [String]()
        if part == 1 || part == nil {
            parts.append("Part 1: \(advent.part1())")
        }
        if part == 2 || part == nil {
            parts.append("Part 2: \(advent.part2())")
        }
        print(parts.joined(separator: ", "))
    }
}

// MARK: Common

public class Advent {
    let input: [String]
    public required init(_ input: [String]) {
        self.input = input
    }

    func part1() -> Int { fatalError("Must be overridden in subclass") }
    func part2() -> Int { fatalError("Must be overridden in subclass") }
}

public func getAdventInput(_ name: String) -> [String] {
    let inputPath = Bundle.module.url(forResource: name, withExtension: "txt")!,
        contents = try! String(contentsOf: inputPath)
    return contents.components(separatedBy: .newlines)
}
