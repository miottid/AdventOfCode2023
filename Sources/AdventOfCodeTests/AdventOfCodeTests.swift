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

        let day01Prod = Day01(getDayInput("day01"))
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

        let day02Prod = Day02(getDayInput("day02"))
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

        let day03Prod = Day03(getDayInput("day03"))
        XCTAssertEqual(day03Prod.part1(), 529_618)
        XCTAssertEqual(day03Prod.part2(), 77_509_019)
    }

    func test_day04() {
        let day4Input = """
        Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
        Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
        Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
        Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
        Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
        Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
        """.components(separatedBy: .newlines)

        let day04 = Day04(day4Input)
        XCTAssertEqual(day04.part1(), 13)
        XCTAssertEqual(day04.part2(), 30)

        let day04Prod = Day04(getDayInput("day04"))
        XCTAssertEqual(day04Prod.part1(), 20855)
        XCTAssertEqual(day04Prod.part2(), 5_489_600)
    }
}
