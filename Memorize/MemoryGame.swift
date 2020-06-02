//
//  MemoryGame.swift
//  Memorize
//
//  Created by Bob Voorneveld on 01/06/2020.
//  Copyright © 2020 Bob Voorneveld. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {

    var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        let index = self.index(of: card)
        cards[index].isFaceUp = !cards[index].isFaceUp
    }

    func index(of card: Card) -> Int {
        return cards.firstIndex { card.id == $0.id } ?? 0
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
