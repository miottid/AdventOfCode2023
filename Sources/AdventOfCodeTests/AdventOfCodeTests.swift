import AdventOfCode
import XCTest

final class AdventOfCodeTests: XCTestCase {
    func test_day01() {
        let part1Input = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """.components(separatedBy: .newlines)
        let day01 = Day01(part1Input)
        XCTAssertEqual(day01.part1(), 142)
        let part2Input = """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """.components(separatedBy: .newlines)
        let day01p02 = Day01(part2Input)
        XCTAssertEqual(day01p02.part2(), 281)

        let day01Prod = Day01(getAdventInput("day01"))
        XCTAssertEqual(day01Prod.part1(), 55123)
        XCTAssertEqual(day01Prod.part2(), 55260)
    }

    func test_day02() {
        let day2Input = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """.components(separatedBy: .newlines)
        let day02 = Day02(day2Input)
        XCTAssertEqual(day02.part1(), 8)
        XCTAssertEqual(day02.part2(), 2286)

        let day02Prod = Day02(getAdventInput("day02"))
        XCTAssertEqual(day02Prod.part1(), 2406)
        XCTAssertEqual(day02Prod.part2(), 78375)
    }

    func test_day03() {
        let day3Input = """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """.components(separatedBy: .newlines)
        let day03 = Day03(day3Input)
        XCTAssertEqual(day03.part1(), 4361)
        XCTAssertEqual(day03.part2(), 467_835)

        let day03Prod = Day03(getAdventInput("day03"))
        XCTAssertEqual(day03Prod.part1(), 529_618)
        XCTAssertEqual(day03Prod.part2(), 77_509_019)
    }
}
