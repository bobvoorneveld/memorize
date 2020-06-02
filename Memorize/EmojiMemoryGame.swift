//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bob Voorneveld on 01/06/2020.
//  Copyright © 2020 Bob Voorneveld. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "💋", "🕷", "☠️", "🎃"]
        let amountOfPairs = (2...emojis.count).randomElement()!
        return MemoryGame<String>(numberOfPairsOfCards: amountOfPairs) { emojis[$0] }
    }

    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
