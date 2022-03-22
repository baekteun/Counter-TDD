//
//  CounterView.swift
//  Counter
//
//  Created by 최형우 on 2022/03/22.
//  Copyright © 2022 baegteun. All rights reserved.
//

import SwiftUI

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .foregroundColor(resultToColor(viewModel.checkResults))
                .font(.largeTitle.bold())
            
            HStack {
                Spacer()
                Button {
                    viewModel.apply(.plusButtonDidTap)
                } label: {
                    Text("+")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                Spacer()
                Button {
                    viewModel.apply(.minusButtonDidTap)
                } label: {
                    Text("-")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            Button {
                viewModel.apply(.resetButtonDidTap)
            } label: {
                Text("Reset")
                    .font(.title)
                    .foregroundColor(.black)
            }.padding(.top, 30)
        }
    }
    
    func resultToColor(_ result: CheckResults) -> Color {
        switch result {
        case .lower:
            return .red
        case .equal:
            return .green
        case .higher:
            return .blue
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
