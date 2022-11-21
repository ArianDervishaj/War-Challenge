//
//  ContentView.swift
//  war-challenge
//
//  Created by Arian Dervishaj on 12.11.22.
//

import SwiftUI
struct Settings {
    static let playerScoreKey = "playerScore"
    static let cpuScoreKey = "cpuScore"
    static let playerCardKey = "playerCard"
    static let cpuCardKey = "cpuCard"
    
}
struct ContentView: View {
    @AppStorage(Settings.playerCardKey) var playerCard = "back"
    @AppStorage(Settings.cpuCardKey) var cpuCard = "back"
    @AppStorage(Settings.playerScoreKey) var playerScore = 0
    @AppStorage(Settings.cpuScoreKey) var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable(resizingMode: .stretch)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    //Player Card View
                    Spacer()
                    Image(playerCard)
                    
                    Spacer()
                    
                    //CPU Card View
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                //Button DEAL
                Button(action:{
                    
                    //random number generator
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    //Update the card
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    //Update the score
                    if(playerRand < cpuRand){
                        cpuScore += 1
                    }
                    if(playerRand > cpuRand){
                        playerScore += 1
                    }
                    
                }) {
                    Image("dealbutton")
                }
                Spacer()
                HStack{
                    Spacer()
                    
                    //Player Score
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom,10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }

                    Spacer()
                    
                    //CPU Score
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom,10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }

                    Spacer()
                }
                Spacer()
                
                //New Game
                Button {
                    //player reset
                    playerScore = 0
                    playerCard = "back"
                    //cpu reset
                    cpuScore = 0
                    cpuCard = "back"
                    
                } label: {
                    Text("New Game")
                        .font(.title3)
                        .foregroundColor(Color.white)
                    
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
