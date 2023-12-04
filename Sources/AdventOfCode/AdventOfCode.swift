import ArgumentParser
import Foundation

@main
struct AdventOfCode: ParsableCommand {
    @Option(name: .shortAndLong, help: "The day to run, if not provided all days will run.")
    var day: Int?

    @Option(name: .shortAndLong, help: "The part to run, if not provided all parts will run.")
    var part: Int?

    mutating func run() throws {
        let adventTypes = [Day01.self, Day02.self, Day03.self, Day04.self]
        if let day = day {
            let adventType = adventTypes[day - 1]
            let input = getDayInput(String(format: "day%02d", day))
            let advent = adventType.init(input)
            runAdvent(advent)
        } else {
            for (i, adventType) in adventTypes.enumerated() {
                let input = getDayInput(String(format: "day%02d", i + 1))
                let advent = adventType.init(input)
                runAdvent(advent)
            }
        }
    }

    private func runAdvent(_ advent: Day) {
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
        print(advent.name + "\n" + parts.joined(separator: "\n") + "\n")
    }
}

// MARK: Common

public class Day {
    public var name: String { "Must be overriden in subclass" }
    public let lines: [String]
    public required init(_ lines: [String]) {
        self.lines = lines
    }

    public func part1() -> Int { fatalError("Must be overridden in subclass") }
    public func part2() -> Int { fatalError("Must be overridden in subclass") }
}

public func getDayInput(_ name: String) -> [String] {
    let inputPath = Bundle.module.url(forResource: name, withExtension: "txt")!,
        contents = try! String(contentsOf: inputPath)
    return contents.trimmingCharacters(in: .whitespacesAndNewlines)
        .components(separatedBy: .newlines)
}

private func measureElapsedTime(_ operation: () -> Int) -> (Int, Double) {
    let startTime = DispatchTime.now()
    let result = operation()
    let endTime = DispatchTime.now()
    let elapsed = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000
    return (result, elapsed)
}
