//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Fernanda on 25/06/25.
//

import SwiftUI

struct ContentView: View {
    // let não é let de verdade, é constante
    // o @State é o negócio q faz ele poder ser um valor mutável, permite ele trocar
    // o @State diz que é possível alterar a UI
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    var body: some View { // var is let
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // conversion section
                HStack {
                    // left conversion section
                    VStack {
                        // currency
                        HStack {
                            // currency image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        
                        // text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    // right conversion section
                    VStack {
                        // currency
                        HStack {
                            // currency text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)

                            // currency image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        
                        // text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // info button
                HStack {
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                        print("showExchangeInfo value: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            // .border(.blue)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
    }
}

#Preview {
    ContentView()
}
