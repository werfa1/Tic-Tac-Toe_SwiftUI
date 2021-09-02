//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Pavel Otverchenko on 01.09.2021.
//

import SwiftUI

//MARK: - Game View -

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 5){
                    ForEach(0..<9) {i in
                        ZStack {
                            
                            CircleView(geometry: geometry)
                            
                            PlayerIndicatorView(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle,
                                              action: viewModel.restartTheGame))
            })
        }
    }
}

//MARK: - Circle View -

struct CircleView : View {
    
    var geometry: GeometryProxy
    
    var body : some View {
        Circle()
            .foregroundColor(.purple)
            .frame(width: geometry.size.width / 3 - Offsets.safeAreaOffset,
                   height: geometry.size.width / 3 - Offsets.safeAreaOffset)
    }
}

//MARK: - Player Indicator View -

struct PlayerIndicatorView: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: Sizes.imageSide,
                   height: Sizes.imageSide)
            .foregroundColor(.white)
    }
}

//MARK: - Preview -

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

//MARK: - Constants -

extension CircleView {
    
    private enum Offsets {
        
        /// # 15
        static let safeAreaOffset : CGFloat = 15
    }
}

extension PlayerIndicatorView {
    
    private enum Sizes {
        
        /// # 40
        static let imageSide : CGFloat = 40
    }
}
