import Foundation

public class Day02: Advent {
    private struct Game {
        struct Round { let r: Int, g: Int, b: Int }

        let id: Int, rounds: [Round]

        init?(from line: String) {
            guard line.count > 0 else { return nil }
            let regex = #/Game ([0-9]+): (.+)/#
            guard let match = line.matches(of: regex).first else {
                return nil
            }
            guard let gameId = Int(match.output.1) else {
                return nil
            }
            id = gameId
            rounds = match.output.2
                .components(separatedBy: "; ")
                .compactMap {
                    var r = 0, g = 0, b = 0
                    if let m = $0.matches(of: #/([0-9]+) red/#).first, let val = Int(m.output.1) {
                        r = val
                    }
                    if let m = $0.matches(of: #/([0-9]+) green/#).first, let val = Int(m.output.1) {
                        g = val
                    }
                    if let m = $0.matches(of: #/([0-9]+) blue/#).first, let val = Int(m.output.1) {
                        b = val
                    }
                    return Round(r: r, g: g, b: b)
                }
        }
    }

    override public func part1() -> Int {
        return input.compactMap(Game.init).filter { game in
            game.rounds.filter { $0.r <= 12 && $0.g <= 13 && $0.b <= 14 }
                .count == game.rounds.count
        }.map(\.id).reduce(0, +)
    }

    override public func part2() -> Int {
        return input.compactMap(Game.init).compactMap { game -> Int? in
            guard let r = game.rounds.max(by: { $0.r < $1.r })?.r,
                  let g = game.rounds.max(by: { $0.g < $1.g })?.g,
                  let b = game.rounds.max(by: { $0.b < $1.b })?.b
            else {
                return nil
            }
            return r * g * b
        }.reduce(0, +)
    }
}
