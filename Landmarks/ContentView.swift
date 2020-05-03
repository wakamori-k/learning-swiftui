//
//  ContentView.swift
//  Landmarks
//
//  Created by 若森和昌 on 2020/05/02.
//  Copyright © 2020 若森和昌. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                NavigationLink(destination:
                TurtleRockContentView()) {
                    Text("Turtle Rock")
                }
                NavigationLink(destination:  Greeting()) {
                    Text("Greeting")
                }
                NavigationLink(destination: Typing()){
                    Text("Typing")
                }                
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
