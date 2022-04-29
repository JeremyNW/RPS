//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jeremy Warren on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    @State var choices = ["Rock", "Paper", "Scissors"]
    @State var shouldWin: Bool = true
    @State var winningChoice = Int.random(in: 0...2)
    @State var scoreTitle = ""
    @State var points: Int = 0
    var body: some View {
        NavigationView {
            VStack {
                Text("")
                    .bold()
                
                VStack {
                    Text("Select Your Answer!")
                        .padding()
                    HStack(spacing: 5) {
                        ForEach(0..<3) { rps in
                            Button {
                                choiceMade(rps)
                            } label: {
                                Image(choices[rps])
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }

                        }
                    }
                    .navigationBarTitle("Rock Paper Scissors")
                }
            }
        }
    }
    func choiceMade(_ choice: Int) {
        if choice == winningChoice {
            scoreTitle = "Nice!"
            points += 1
        } else {
            scoreTitle = "R.I.P"
        }
        
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
