import Foundation

struct Day04: AdventDay {
    var data: String
    var lines: [String] { data.components(separatedBy: "\n") }

    private func getMatchCount(in line: String) -> Int {
        let parts = line.components(separatedBy: " | ")
            .map {
                $0.components(separatedBy: " ")
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                    .compactMap(Int.init)
            }
        return Set(parts[0]).intersection(Set(parts[1])).count
    }

    func part1() -> Any {
        lines.map {
            let matchingNumbers = getMatchCount(in: $0)
            var points = 0
            for i in 0 ..< matchingNumbers {
                points = i == 0 ? 1 : points * 2
            }
            return points
        }.reduce(0, +)
    }

    private func getScratchcardsAt(_ lineIndex: Int, cache: inout [Int: [Int]]) -> [Int] {
        if let scratchcards = cache[lineIndex] {
            return scratchcards
        }
        let matches = getMatchCount(in: lines[lineIndex])
        var scratchcards = [Int](repeating: 0, count: lines.count)
        for i in 0 ..< matches {
            let nextLineIndex = lineIndex + i + 1
            scratchcards[nextLineIndex] += 1
            let copies = getScratchcardsAt(nextLineIndex, cache: &cache)
            for (i, val) in copies.enumerated() {
                scratchcards[i] += val
            }
        }
        cache[lineIndex] = scratchcards
        return scratchcards
    }

    func part2() -> Any {
        var cache: [Int: [Int]] = [:]
        var scratchcards = [Int](repeating: 1, count: lines.count)
        for i in 0 ..< lines.count {
            for (i, val) in getScratchcardsAt(i, cache: &cache).enumerated() {
                scratchcards[i] += val
            }
        }
        return scratchcards.reduce(0, +)
    }
}
