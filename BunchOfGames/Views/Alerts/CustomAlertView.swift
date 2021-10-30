//
//  CustomAlertView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var alert: AlertModel?
    @State private var isAnimating = false
    var reset: (() -> Void)?
    var body: some View {
        ZStack {
            Color.white.opacity(0.01).ignoresSafeArea()
            VStack(spacing: 30) {
                if let alert = self.alert {
                    
                    if let title = alert.title {
                        Text(title)
                            .foregroundColor(.theme.accent)
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                    }
                    
                    Button(action: {
                        reset?()
                    }) {
                        if let actionLabel = alert.actionLabel {
                            MessageView(message: actionLabel, color: alert.theme)
                                .padding()
                                .background(Color.theme.accent.cornerRadius(25))
                                .padding(.top)
                        }
                    }
                    .buttonStyle(PressedEffectStyle(scaling: 0.95))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .background(alert?.theme.cornerRadius(25))
            .padding(.horizontal)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .offset(x: isAnimating ? 0 : 400, y: 0)
        }
        .animation(.spring())
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(alert: .constant(AlertModel.memoryGameWin))
            .environmentObject(GameViewModel())
    }
}
