//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Fernanda on 09/07/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    // var message: Text? // nil
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency Screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
