//
//  ContentView.swift
//  Swift_Arrays
//
//  Created by Zach Mommaerts on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var deck = [Card]()
    @State private var label = "Card name"
    private var suits = ["Spades", "Clubs", "Diamonds", "Hearts"]
    
    struct Card : Equatable{
        
        @State var value:Int
        @State var suit:String
        
        static func == (card1:Card, card2:Card) -> Bool{
            card1.value == card2.value && card1.suit == card2.suit ? true : false
        }
    }
    
    var body: some View {
        VStack {
            Text(label)
            Spacer()
            Button(action: {
                let randValue = Int.random(in: 1...13)
                let randSuit = suits.randomElement()
                
                let card = Card(value: randValue, suit: randSuit!)
                
                if(deck.contains(card)){
                    label = "Generated a duplicate card"
                }else{
                    deck.append(card)
                    if(randValue == 1){
                        label = "Generated an Ace of \(card.suit)"
                    } else if(randValue == 11){
                        label = "Generated a Jack of \(card.suit)"
                    } else if(randValue == 12){
                        label = "Generated a Queen of \(card.suit)"
                    } else if(randValue == 13){
                        label = "Generated a King of \(card.suit)"
                    } else {
                        label = "Generated a \(card.value) of \(card.suit)"
                    }
                }
                
            }, label: {
                Text("Generate Card")
            })
            Spacer()
            Button(action: {
                if(deck.isEmpty){
                    label = "No cards in the deck"
                } else{
                    let drawncard = deck.randomElement()
                    
                    if(drawncard!.value == 1){
                        label = "Drew an Ace of \(drawncard!.suit)"
                    } else if(drawncard!.value == 11){
                        label = "Drew a Jack of \(drawncard!.suit)"
                    } else if(drawncard!.value == 12){
                        label = "Drew a Queen of \(drawncard!.suit)"
                    } else if(drawncard!.value == 13){
                        label = "Drew a King of \(drawncard!.suit)"
                    } else {
                        label = "Drew a \(drawncard!.value) of \(drawncard!.suit)"
                    }
                }
            }, label: {
                Text("Choose Card")
            })
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
