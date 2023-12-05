import Foundation

protocol AdventDay {
    static var day: Int { get }
    init(data: String)
    func part1() -> Any
    func part2() -> Any
}

extension AdventDay {
    static var day: Int {
        let typeName = String(reflecting: Self.self)
        guard let i = typeName.lastIndex(where: { !$0.isNumber }),
              let day = Int(typeName[i...].dropFirst())
        else {
            fatalError(
                """
                Day number not found in type name: \
                implement the static `day` property \
                or use the day number as your type's suffix (like `Day3`).")
                """)
        }
        return day
    }

    var day: Int { Self.day }

    func part2() -> Any { "Not implemented yet" }

    init() {
        self.init(data: Self.loadData(challengeDay: Self.day))
    }

    static func loadData(challengeDay: Int) -> String {
        let dayString = String(format: "%02d", challengeDay)
        let dataFilename = "Day\(dayString)"
        let dataURL = Bundle.module.url(
            forResource: dataFilename,
            withExtension: "txt",
            subdirectory: "Resources"
        )

        guard let dataURL,
              let data = try? String(contentsOf: dataURL)
        else {
            fatalError("Couldn't find file '\(dataFilename).txt' in the 'Data' directory.")
        }

        return data.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
