import Foundation

private let Deck = "AKQJT98765432"
private let DeckPart2 = "AKQT98765432J"

private struct Play: Comparable {
    let cards: String, bid: Int, original: String?

    var handType: HandType {
        let counts = cards.map { card in cards.filter { $0 == card }.count }
        switch counts {
        case let counts where counts.contains(5):
            return .fiveOfAKind
        case let counts where counts.contains(4):
            return .fourOfAKind
        case let counts where counts.contains(3) && counts.contains(2):
            return .fullHouse
        case let counts where counts.contains(3):
            return .threeOfAKind
        case let counts where counts.filter({ $0 == 2 }).count == 4:
            return .twoPairs
        case let counts where counts.contains(2):
            return .onePair
        default:
            return .highCard
        }
    }

    static func < (lhs: Play, rhs: Play) -> Bool {
        if lhs.handType.rawValue == rhs.handType.rawValue {
            if let lhsOriginal = lhs.original, let rhsOriginal = rhs.original {
                for (i, card) in lhsOriginal.enumerated() {
                    let rhsIdx = DeckPart2.index(DeckPart2.startIndex, offsetBy: i)
                    if let lhsIdx = DeckPart2.firstIndex(of: card),
                       let rhsIdx = DeckPart2.firstIndex(of: rhsOriginal[rhsIdx]),
                       lhsIdx != rhsIdx
                    {
                        return lhsIdx < rhsIdx
                    }
                }
            }
            for (i, card) in lhs.cards.enumerated() {
                let rhsIdx = Deck.index(Deck.startIndex, offsetBy: i)
                if let lhsIdx = Deck.firstIndex(of: card),
                   let rhsIdx = Deck.firstIndex(of: rhs.cards[rhsIdx]),
                   lhsIdx != rhsIdx
                {
                    return lhsIdx < rhsIdx
                }
            }
        }
        return lhs.handType.rawValue < rhs.handType.rawValue
    }
}

private enum HandType: Int {
    case fiveOfAKind
    case fourOfAKind
    case fullHouse
    case threeOfAKind
    case twoPairs
    case onePair
    case highCard
}

struct Day07: AdventDay {
    var data: String

    func part1() -> Any {
        let hands = data.split(separator: "\n")
            .compactMap { line -> Play? in
                guard let match = line.firstMatch(of: #/(.+) (\d+)/#),
                      let bid = Int(match.output.2)
                else {
                    return nil
                }
                let cards = String(match.output.1)
                return Play(cards: cards, bid: bid, original: nil)
            }.sorted().reversed()

        return hands.enumerated()
            .map { i, h in (i + 1) * h.bid }
            .reduce(0, +)
    }

    private let possibilities = "AKQT98765432"
    private func replacements(hand: String) -> [String] {
        guard let first = hand.first else {
            return [""]
        }
        let others = replacements(hand: String(hand.dropFirst()))
        var hands = [String]()
        if first == "J" {
            for candicate in possibilities {
                let rest = others.map { other in String(candicate) + other }
                hands.append(contentsOf: rest)
            }
        } else {
            let rest = others.map { other in String(first) + other }
            hands.append(contentsOf: rest)
        }
        return hands
    }

    func part2() -> Any {
        let hands = data.split(separator: "\n").compactMap { line -> Play? in
            guard let match = line.firstMatch(of: #/(.+) (\d+)/#),
                  let bid = Int(match.output.2)
            else {
                return nil
            }
            let cards = String(match.output.1)
            let replacement = replacements(hand: cards)
                .map { Play(cards: $0, bid: bid, original: cards) }
                .sorted().first!
            return replacement
        }.sorted().reversed()

        return hands.enumerated()
            .map { i, h in (i + 1) * h.bid }
            .reduce(0, +)
    }
}
