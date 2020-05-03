//
//  TurtleRockContentView.swift
//  Landmarks
//
//  Created by 若森和昌 on 2020/05/03.
//  Copyright © 2020 若森和昌. All rights reserved.
//

import SwiftUI

struct TurtleRockContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage().offset(y: -130).padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock").font(.title)
                HStack {
                    Text("Joshua Tree National Park").font(.subheadline)
                    Spacer()
                    Text("California").font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct TurtleRockContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
