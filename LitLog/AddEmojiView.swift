//
//  AddEmojiView.swift
//  LitLog
//
//  Created by shalinth adithyan on 06/08/25.
//

import SwiftUI

struct AddEmojiView: View {
    let rating :Int
    var body: some View {
        switch rating{
        case 1 :
            Text("🫩")
        case 2:
            Text("🙂")
        case 3:
            Text("😐")
        case 4:
            Text("😊")
        default :
            Text("😄")
        
        
        }
        
    }
}

#Preview {
    AddEmojiView(rating: 3)
}
