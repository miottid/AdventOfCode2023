import Foundation

public final class Day04: Day {
    override public var name: String { "--- Day 4: Scratchcards ---" }

    private func getMatchCount(in line: String) -> Int {
        let parts = line.components(separatedBy: " | ")
            .map {
                $0.components(separatedBy: " ")
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                    .compactMap(Int.init)
            }
        return Set(parts[0]).intersection(Set(parts[1])).count
    }

    override public func part1() -> Int {
        return lines.map {
            let matchingNumbers = getMatchCount(in: $0)
            var points = 0
            for i in 0 ..< matchingNumbers {
                points = i == 0 ? 1 : points * 2
            }
            return points
        }.reduce(0, +)
    }

    private var scratchcardsCache: [Int: [Int]] = [:]
    private func getScratchcardsAt(_ lineIndex: Int) -> [Int] {
        if let scratchcards = scratchcardsCache[lineIndex] {
            return scratchcards
        }
        let matches = getMatchCount(in: lines[lineIndex])
        var scratchcards = [Int](repeating: 0, count: lines.count)
        for i in 0 ..< matches {
            let nextLineIndex = lineIndex + i + 1
            scratchcards[nextLineIndex] += 1
            let copies = getScratchcardsAt(nextLineIndex)
            for (i, val) in copies.enumerated() {
                scratchcards[i] += val
            }
        }
        scratchcardsCache[lineIndex] = scratchcards
        return scratchcards
    }

    override public func part2() -> Int {
        var scratchcards = [Int](repeating: 1, count: lines.count)
        for i in 0 ..< lines.count {
            for (i, val) in getScratchcardsAt(i).enumerated() {
                scratchcards[i] += val
            }
        }
        return scratchcards.reduce(0, +)
    }
}
