//
//  ContentView.swift
//  Guess The Flag Practise App
//
//  Created by Shubham on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var currentQuestionNumber = 1
    @State private var hasGameFinished = false
    @State private var scoreValue = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Spain", "UK", "US", "Russia", "Nigeria", "Italy"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    // MARK: Body
    var body: some View {
        ZStack {
            // Background Color
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            
            // All layout
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.white)
                                
                VStack(spacing: 15.0) {
                    VStack {
                        
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        
                        // Country name
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            // flag is tapped
                            flagTapped(number)
                        }
                    label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 6.0))
                            .shadow(radius: 10)
                    }
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width - 40)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
                
                Spacer()
                Spacer()
                
                Text("Current Score: \(scoreValue)")
                    .font(.title.bold())
                    .foregroundStyle(Color.white)
                
                Spacer()

                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button(hasGameFinished ? "Restart" : "Continue", action: hasGameFinished ? restartGame : askQuestion)
        } message: {
            Text("Your score is \(scoreValue)")
        }
    }
    
    func flagTapped(_ number: Int) {
        currentQuestionNumber += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreValue += 1
            if currentQuestionNumber > 8 {
                hasGameFinished = true
                scoreTitle = "Game is finished"
            }
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            
            if scoreValue > 0 {
                scoreValue -= 1
            }
            
            if currentQuestionNumber > 8 {
                hasGameFinished = true
                scoreTitle = "Game is finished"
            }
        }
        
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        hasGameFinished = false
        scoreValue = 0
        currentQuestionNumber = 1
        askQuestion()
    }
}

#Preview {
    ContentView()
}












//        LinearGradient(
//            stops: [
//                Gradient.Stop(color: .green, location: 0.25), Gradient.Stop(color: .yellow, location: 0.75)
//            ],
//            startPoint: .topLeading, endPoint: .bottomTrailing)

//        RadialGradient(gradient: Gradient(colors: [.indigo,.black]), center: .center, startRadius: 20, endRadius: 180)

//        AngularGradient(colors: [Color.green, Color.red], center: UnitPoint.center)

//        VStack(spacing: 20.0) {
//
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.purple)
//
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//
//            Button {
//
//            } label: {
//                Text("Custom Button Pressed")
//                    .padding()
//                    .font(.system(size: 25.0))
//                    .foregroundStyle(Color.white)
//                    .background(Color.green)
//                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
//            }
//
//
//            Button {
//
//            } label: {
//                Label("Edit", systemImage: "pencil")
//                    .font(.system(.title))
//            }
//
//
//        }
//
//
//// MARK: Alerts practise
//Button("Show Alert") {
//    showingAlert = true
//}
//.alert("Message here", isPresented: $showingAlert) {
//    Button("Delete", role: .destructive) { }
//    Button("Cancel", role: .cancel) { }
//} message: {
//    Text("Read this twice")
//}
//
