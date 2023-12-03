import Foundation

private let textDigits = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

public class Day01: Challenge {
    override public var name: String { "--- Day 1: Trebuchet?! ---" }

    override public func part1() -> Int {
        return lines.compactMap {
            let numbers = $0.compactMap(\.wholeNumberValue)
            guard let first = numbers.first, let last = numbers.last,
                  let value = Int("\(first)\(last)")
            else {
                return nil
            }
            return value
        }.reduce(0, +)
    }

    override public func part2() -> Int {
        return lines.compactMap {
            var numberPositions = [(Int, String.Index)]()
            for (i, d) in textDigits.enumerated() {
                var position = $0.startIndex
                while let range = $0.range(of: d, range: position ..< $0.endIndex) {
                    numberPositions.append((i + 1, range.lowerBound))
                    position = $0.index(after: range.lowerBound)
                }
                position = $0.startIndex
                while let range = $0.range(of: "\(i + 1)", range: position ..< $0.endIndex) {
                    numberPositions.append((i + 1, range.lowerBound))
                    position = $0.index(after: range.lowerBound)
                }
            }
            let numbers = numberPositions.sorted(by: { $0.1 < $1.1 }).map(\.0)
            guard let first = numbers.first, let last = numbers.last,
                  let value = Int("\(first)\(last)")
            else {
                return nil
            }
            return value
        }.reduce(0, +)
    }
}
