import Foundation

private let symbolRegex = #/[^0-9\.]/#
private let numberRegex = #/[0-9]+/#
private let starRegex = #/\*/#

struct Day03: AdventDay {
    var data: String
    var lines: [String] { data.components(separatedBy: "\n") }

    func part1() -> Any {
        var symbols = [Int: [Range<String.Index>]]()
        for (i, line) in lines.enumerated() {
            symbols[i] = line.ranges(of: symbolRegex)
        }
        return lines.enumerated().flatMap { i, line in
            var numberThatSumsUp = [Int]()
            for range in line.ranges(of: numberRegex) {
                guard let number = Int(line[range]) else { continue }
                let lowerBound = range.lowerBound > line.startIndex ? line.index(before: range.lowerBound) : line.startIndex
                let upperBound = range.upperBound < line.endIndex ? line.index(after: range.upperBound) : line.endIndex
                let isInRange = { (range: Range<String.Index>) in range.lowerBound >= lowerBound && range.upperBound <= upperBound }
                if symbols[i]?.first(where: isInRange) != nil ||
                    symbols[i - 1]?.first(where: isInRange) != nil ||
                    symbols[i + 1]?.first(where: isInRange) != nil
                {
                    numberThatSumsUp.append(number)
                }
            }
            return numberThatSumsUp
        }.reduce(0, +)
    }

    func part2() -> Any {
        var gearRatios = 0
        let numberPositions = lines.map { $0.ranges(of: numberRegex) },
            starPositions = lines.map { $0.ranges(of: starRegex) }
        for (lineIndex, starsInLine) in starPositions.enumerated() {
            guard starsInLine.count > 0 else {
                continue
            }
            let line = lines[lineIndex]
            for star in starsInLine {
                let lowerBound = star.lowerBound > line.startIndex ? line.index(before: star.lowerBound) : line.startIndex,
                    upperBound = star.upperBound < line.endIndex ? line.index(after: star.upperBound) : line.endIndex,
                    isInRange = { (range: Range<String.Index>) in range.upperBound > lowerBound && range.lowerBound < upperBound }
                var adjacentNumbers = [Int]()
                for i in -1 ... 1 {
                    let ranges = numberPositions[lineIndex + i].filter(isInRange)
                    for range in ranges {
                        if let number = Int(lines[lineIndex + i][range]) {
                            adjacentNumbers.append(number)
                        }
                    }
                }
                if adjacentNumbers.count == 2 {
                    gearRatios += adjacentNumbers.reduce(1, *)
                }
            }
        }

        return gearRatios
    }
}
