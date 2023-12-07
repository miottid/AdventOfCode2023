import XCTest

@testable import AdventOfCode

final class AdventOfCodeTests: XCTestCase {
    func test_day01() {
        let demo1 = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """

        let day01demo = Day01(data: demo1)
        XCTAssertEqual(day01demo.part1() as? Int, 142)

        let demo2 = """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """

        let day01p02 = Day01(data: demo2)
        XCTAssertEqual(day01p02.part2() as? Int, 281)

        let day01Prod = Day01()
        XCTAssertEqual(day01Prod.part1() as? Int, 55123)
        XCTAssertEqual(day01Prod.part2() as? Int, 55260)
    }

    func test_day02() {
        let demo = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """

        let day02demo = Day02(data: demo)
        XCTAssertEqual(day02demo.part1() as? Int, 8)
        XCTAssertEqual(day02demo.part2() as? Int, 2286)

        let day02Prod = Day02()
        XCTAssertEqual(day02Prod.part1() as? Int, 2406)
        XCTAssertEqual(day02Prod.part2() as? Int, 78375)
    }

    func test_day03() {
        let demo = """
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
        """

        let day03demo = Day03(data: demo)
        XCTAssertEqual(day03demo.part1() as? Int, 4361)
        XCTAssertEqual(day03demo.part2() as? Int, 467_835)

        let day03Prod = Day03()
        XCTAssertEqual(day03Prod.part1() as? Int, 529_618)
        XCTAssertEqual(day03Prod.part2() as? Int, 77_509_019)
    }

    func test_day04() {
        let demo = """
        Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
        Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
        Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
        Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
        Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
        Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
        """

        let day04demo = Day04(data: demo)
        XCTAssertEqual(day04demo.part1() as? Int, 13)
        XCTAssertEqual(day04demo.part2() as? Int, 30)

        let day04Prod = Day04()
        XCTAssertEqual(day04Prod.part1() as? Int, 20855)
        XCTAssertEqual(day04Prod.part2() as? Int, 5_489_600)
    }

    func test_day05() {
        let demo = """
        seeds: 79 14 55 13

        seed-to-soil map:
        50 98 2
        52 50 48

        soil-to-fertilizer map:
        0 15 37
        37 52 2
        39 0 15

        fertilizer-to-water map:
        49 53 8
        0 11 42
        42 0 7
        57 7 4

        water-to-light map:
        88 18 7
        18 25 70

        light-to-temperature map:
        45 77 23
        81 45 19
        68 64 13

        temperature-to-humidity map:
        0 69 1
        1 0 69

        humidity-to-location map:
        60 56 37
        56 93 4
        """

        let day05demo = Day05(data: demo)
        XCTAssertEqual(day05demo.part1() as? Int, 35)
        XCTAssertEqual(day05demo.part2() as? Int, 46)

        let day05Prod = Day05()
        XCTAssertEqual(day05Prod.part1() as? Int, 251_346_198)
        XCTAssertEqual(day05Prod.part2() as? Int, 72_263_011)
    }

    func test_day06() {
        let demo = """
        Time:      7  15   30
        Distance:  9  40  200
        """

        let day06demo = Day06(data: demo)
        XCTAssertEqual(day06demo.part1() as? Int, 288)
        XCTAssertEqual(day06demo.part2() as? Int, 71503)

        let day06Prod = Day06()
        XCTAssertEqual(day06Prod.part1() as? Int, 781_200)
        XCTAssertEqual(day06Prod.part2() as? Int, 49_240_091)
    }

    func test_day07() {
        let demo = """
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
        """

        let day07demo = Day07(data: demo)
        XCTAssertEqual(day07demo.part1() as? Int, 6440)
        XCTAssertEqual(day07demo.part2() as? Int, 5905)

        let day07 = Day07()
        XCTAssertEqual(day07.part1() as? Int, 254_024_898)
        XCTAssertEqual(day07.part1() as? Int, 254_115_617)
    }
}
