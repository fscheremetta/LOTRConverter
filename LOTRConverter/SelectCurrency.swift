//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Fernanda on 08/07/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var currency: Currency
    
    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // currency icons
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        if self.currency == currency {
                            CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                                .shadow(color: .black, radius: 10)
                                .overlay {
                                    RoundedRectangle (cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5)
                                }
                        } else {
                            CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                                .onTapGesture {
                                    self.currency = currency
                                }
                        }
                    }
                }
                
                // text
                Text("Select the currency you would like to covert to:")
                    .fontWeight(.bold)
                
                
                // currency icons
                
                // done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(currency: .silverPiece)
}
