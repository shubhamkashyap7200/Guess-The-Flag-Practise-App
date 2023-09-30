//
//  ContentView.swift
//  Guess The Flag Practise App
//
//  Created by Shubham on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Spain", "UK", "US", "Russia", "Nigeria", "Italy"].shuffled()
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30.0) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(Color.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(Color.white)
                }
                
                ForEach(0..<3) { number in
                    Button{
                        
                    }
                label: {
                    Image(countries[number])
                        .renderingMode(.original)
                }
                }
            }
        }
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
