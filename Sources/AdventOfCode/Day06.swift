import Foundation

struct Day06: AdventDay {
    var data: String

    func part1() -> Any {
        let lines = data.components(separatedBy: "\n")
        let numbers = lines.compactMap {
            $0.components(separatedBy: ":")[1]
                .components(separatedBy: " ")
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .compactMap(Double.init)
        }
        return zip(numbers[0], numbers[1]).map {
            let discr = sqrt($0 * $0 - 4 * ($1 + 1))
            let a = ceil(($0 - discr) / 2), b = floor(($0 + discr) / 2)
            return Int(b - a + 1)
        }.reduce(1, *)
    }

    func part2() -> Any {
        let lines = data.components(separatedBy: "\n")
        let numbers = lines.compactMap {
            $0.components(separatedBy: ":")[1]
                .components(separatedBy: " ")
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .joined(separator: "")
        }.compactMap(Double.init)
        let t = numbers[0], d = numbers[1]
        let discr = sqrt(t * t - 4 * (d + 1))
        let a = ceil((t - discr) / 2), b = floor((t + discr) / 2)
        return Int(b - a + 1)
    }
}
