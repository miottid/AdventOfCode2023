import Foundation

struct Day08: AdventDay {
    var data: String

    func part1() -> Any {
        let lines = data.components(separatedBy: "\n")
        var steps = lines[0]

        var network: [String: (s: String, d: String)] = [:]
        for line in lines.dropFirst() {
            guard !line.isEmpty else { continue }
            let parts = line.components(separatedBy: " = ")
            let pos = parts[0]
            if let targetMatch = parts[1].matches(of: #/([A-Z]{3}), ([A-Z]{3})/#).first {
                network[pos] = (String(targetMatch.output.1), String(targetMatch.output.2))
            }
        }

        var current = "AAA", step_count = 0
        while current != "ZZZ" {
            step_count += 1
            let firstStep = steps[steps.startIndex]
            current = firstStep == "L" ? network[current]!.s : network[current]!.d
            steps = steps.dropFirst() + String(firstStep)
        }
        return step_count
    }
}
