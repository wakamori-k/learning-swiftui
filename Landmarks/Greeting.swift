//
//  Greeting.swift
//  Landmarks
//
//  Created by 若森和昌 on 2020/05/03.
//  Copyright © 2020 若森和昌. All rights reserved.
//

import SwiftUI

struct Greeting: View {
    // @Stateをつけると値を更新可能となり、更新するとViewが再描画される
    @State var label = "label"
    @State var text = "taro"

    var body: some View {
        VStack() {
            TextField("type", text: $text).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Button(action: {
                self.label = "Hello \(self.text)!"
            }) {
                Text("OK")
            }
            
            Text(label)
            

        }
    }
}

struct Greeting_Previews: PreviewProvider {
    static var previews: some View {
        Greeting()
    }
}
