//
//  UserView.swift
//  ToDoList
//
//  Created by 若森和昌 on 2021/03/29.
//

import SwiftUI

struct UserView: View {
    
    let image: Image
    let userName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("こんにちは")
                    .foregroundColor(.tTitle)
                    .font(.footnote)
                Text(userName)
                    .foregroundColor(.tTitle)
                    .font(.title)
            }
            Spacer()
            image
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        .padding()
        .background(Color.tBackground)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserView(image: Image("profile"), userName: "User Name")
            Circle()
        }
    }
}
