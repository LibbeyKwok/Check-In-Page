//
//  ContentView.swift
//  Check-In Page
//
//  Created by Libbey Kwok on 7/19/23.
//** LINKS USED **
// Smiling face:
// Meh Face:
// Sad Face:

import SwiftUI

struct ContentView: View {
    @State private var happyText = " "
    @State private var mehText = " "
    @State private var sadText = " "
    @State private var num = 0
    @State private var num1 = 0
    @State private var num2 = 0
    var body: some View {
        VStack {
            Text("Check-in")
                .font(.title)
            Text("How are you feeling?")
            HStack{
                Button(action:{
                    if (num==0)
                    {
                        happyText = "Yay! Let's keep it going. Write down 5 things you're grateful for in your journal."
                        num=1
                    }
                    else {
                        happyText = " "
                        num = 0
                    }
                    
                }) {
                    Image("smiling face")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                }
               
                Button(action:{
                    if (num1 == 0)
                    {
                        mehText = "Things could be better and they also could be worse. Push through! "
                        num1 = 1
                    }
                    else
                    {
                        mehText = ""
                        num1 = 0
                    }
                }) {
                    Image("meh face")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                }
                Button(action:{
                    if (num2 == 0)
                    {
                        sadText = "Everybody has their days. It is important to know that your feelings are valid and it will always get better. Write down your feelings in your journal. "
                        num2 = 1
                    }
                    else
                    {
                        sadText = ""
                        num2 = 0
                    }
                    
                }) {
                    Image("sad face")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                }
            }
            Text(happyText)
            Text(mehText)
            Text(sadText)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "CDD7B6"))
                VStack {
                    Text("Resources")
                        .font(.title)
                    
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }
    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue: Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
