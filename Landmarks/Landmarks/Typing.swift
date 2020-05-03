//
//  Typing.swift
//  Landmarks
//
//  Created by 若森和昌 on 2020/05/03.
//  Copyright © 2020 若森和昌. All rights reserved.
//

import SwiftUI

struct Typing: View {
    @State var word = "Hello"
    @State var input = ""
    @State var result = ""
    var body: some View {
        ScrollView {
            Text(word)
            
            CustomTextField(text: $input, target: self.word, onMatched: onMatched, isFirstResponder: true).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Text(result)
        }
    }
    
    func onMatched() {
        // View更新中はStateを更新できないので、asyncで更新
        DispatchQueue.main.async {
            self.result = "OK"
        }
    }
}

struct Typing_Previews: PreviewProvider {
    static var previews: some View {
        Typing()
    }
}
