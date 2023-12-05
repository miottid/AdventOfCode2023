import Algorithms
import Foundation

private typealias MapRule = (src: Range<Int>, dst: Range<Int>)

private let rangeRegex = #/([0-9]+) ([0-9]+) ([0-9]+)/#

private struct Almanac {
    let seeds: [Int]
    let blocks: [[MapRule]]

    init(data: String) {
        var lines = data.components(separatedBy: .newlines)
        seeds = lines.removeFirst()
            .components(separatedBy: ":")[1]
            .components(separatedBy: .whitespaces)
            .compactMap(Int.init)
        var blocks = [[MapRule]](repeating: [], count: 7)
        var index = -1
        for line in lines {
            guard !line.isEmpty else {
                continue
            }
            if line.contains("map:") {
                index += 1
                continue
            }
            guard let match = line.matches(of: rangeRegex).first,
                  let dest = Int(match.output.1),
                  let src = Int(match.output.2),
                  let offset = Int(match.output.3)
            else {
                continue
            }
            blocks[index].append(
                (src ..< src + offset, dest ..< dest + offset)
            )
        }
        self.blocks = blocks
    }
}

struct Day05: AdventDay {
    var data: String
    private var almanac: Almanac

    init(data: String) {
        self.data = data
        almanac = Almanac(data: data)
    }

    func part1() -> Any {
        almanac.seeds.map {
            var step = $0
            for rules in almanac.blocks {
                for rule in rules {
                    if step >= rule.src.startIndex, step < rule.src.endIndex {
                        step = rule.dst.startIndex + (step - rule.src.startIndex)
                        break
                    }
                }
            }
            return step
        }.min() ?? 0
    }

    func part2() -> Any {
        var seeds = almanac.seeds.chunks(ofCount: 2)
            .map { $0.first! ..< $0.first! + $0.last! }
        for rules in almanac.blocks {
            var new = [Range<Int>]()
            while let seed = seeds.popLast() {
                let s = seed.startIndex, e = seed.endIndex
                var found = false
                for rule in rules {
                    let a = rule.dst.startIndex, b = rule.src.startIndex,
                        bc = rule.src.endIndex,
                        os = max(s, b), oe = min(e, bc)
                    if os < oe {
                        new.append(os - b + a ..< oe - b + a)
                        if os > s {
                            seeds.append(s ..< os)
                        }
                        if e > oe {
                            seeds.append(oe ..< e)
                        }
                        found = true
                        break
                    }
                }
                if !found {
                    new.append(seed)
                }
            }
            seeds = new
        }

        return seeds.map(\.startIndex).sorted().first ?? 0
    }
}
