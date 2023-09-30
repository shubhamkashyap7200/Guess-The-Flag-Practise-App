//
//  ContentView.swift
//  Guess The Flag Practise App
//
//  Created by Shubham on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()

            HStack {
                VerticalBoxView()
                VerticalBoxView()
                VerticalBoxView()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct VerticalBoxView: View {
    var body: some View {
        VStack() {
            TextBoxView()
            TextBoxView()
            TextBoxView()
            
        }
    }
}

struct TextBoxView: View {
    var body: some View {
        Text("O")
            .frame(width: 70, height: 70)
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}
