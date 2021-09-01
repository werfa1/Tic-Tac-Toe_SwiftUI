//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Pavel Otverchenko on 01.09.2021.
//

import SwiftUI

let columns : [GridItem] = [GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())]

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: columns, spacing: 5){
                    ForEach(0..<9) {_ in
                        ZStack {
                            Circle()
                                .foregroundColor(.purple)
                                .frame(width: geometry.size.width / 3 - 15,
                                       height: geometry.size.width / 3 - 15)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 40,
                                       height: 40)
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
