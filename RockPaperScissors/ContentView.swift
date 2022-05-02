//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jeremy Warren on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    @State var showingScore = false
    @State var winningChoice = Int.random(in: 0...2)
    @State var losingChoice = Int.random(in: 0...2)
    @State var scoreTitle = ""
    @State var points: Int = 0
    @State var wantsToWin = Bool.random()
    var choices = ["Rock", "Paper", "Scissors"]
    var winningChoices = ["Paper", "Scissors", "Rock"]
    var losingChoices = ["Scissors", "Rock", "Paper"]
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .cyan, .gray], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Your score is \(points)")
                        .padding()
                    if wantsToWin == true {
                        Text("Your opponent picked \(winningChoices[winningChoice]) and wants to win.")
                            .bold()
                    } else if wantsToWin == false {
                        Text("Your opponent picked \(losingChoices[losingChoice]) and wants to lose.")
                            .bold()
                    }
                    
                    VStack {
                        Text("Select Your Answer!")
                            .padding()
                        HStack(spacing: 5) {
                            ForEach(0..<3) { choice in
                                Button {
                                    choiceMade(choice)
                                } label: {
                                    Image(choices[choice])
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                                
                                
                            }
                            .navigationBarTitle("R P S", displayMode: .inline)
                            
                        }
                        
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is now \(points)")
        }
        
    }
    
    func choiceMade(_ choice: Int) {
        if wantsToWin == true {
            if choice == winningChoice {
                scoreTitle = "Nice!"
                points += 1
            } else {
                scoreTitle = "Wrong, the correct answer was \(choices[winningChoice])"
            }
        }
        if wantsToWin == false {
            if choice == losingChoice {
                scoreTitle = "Nice!"
                points += 1
            } else {
                scoreTitle = "Wrong, the correct answer was \(choices[losingChoice])"
            }
        }
        showingScore = true
        
    }
    
    func askQuestion() {
        wantsToWin = Bool.random()
        winningChoice = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
