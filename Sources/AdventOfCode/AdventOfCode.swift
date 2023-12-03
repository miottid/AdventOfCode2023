import ArgumentParser
import Foundation

@main
struct AdventOfCode: ParsableCommand {
    @Option(name: .shortAndLong, help: "The day to run, if not provided all days will run.")
    var day: Int?

    @Option(name: .shortAndLong, help: "The part to run, if not provided all parts will run.")
    var part: Int?

    mutating func run() throws {
        let adventTypes = [Day01.self, Day02.self, Day03.self]
        if let day = day {
            let adventType = adventTypes[day - 1]
            let advent = adventType.init(getAdventInput(String(format: "day%02d", day)))
            runAdvent(advent)
        } else {
            for (i, adventType) in adventTypes.enumerated() {
                let day = i + 1
                let advent = adventType.init(getAdventInput(String(format: "day%02d", day)))
                runAdvent(advent)
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
        print(advent.name)
        print(parts.joined(separator: ", "))
        print("")
    }
}

// MARK: Common

protocol Advent {
    var name: String { get }
    func part1() -> Int
    func part2() -> Int
}

public class Challenge: Advent {
    public var name: String {
        return "Challenge"
    }

    let lines: [String]
    public required init(_ lines: [String]) {
        self.lines = lines
    }

    public func part1() -> Int { fatalError("Must be overridden in subclass") }
    public func part2() -> Int { fatalError("Must be overridden in subclass") }
}

public func getAdventInput(_ name: String) -> [String] {
    let inputPath = Bundle.module.url(forResource: name, withExtension: "txt")!,
        contents = try! String(contentsOf: inputPath)
    return contents.components(separatedBy: .newlines)
}
