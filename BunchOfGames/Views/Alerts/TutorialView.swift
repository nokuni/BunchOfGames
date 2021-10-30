//
//  TutorialView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 30/08/2021.
//

import SwiftUI
import UIKit

struct TutorialView: View {
    @Binding var alert: AlertModel?
    @State private var isAnimating = false
    var toggleAlert: (() -> Void)?
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.01).ignoresSafeArea()
            TabView {
                if let alert = alert {
                    if let list = alert.messageList {
                        ForEach(list, id: \.self) { text in
                            MessageView(message: text, color: .theme.accent)
                        }
                    }
                    VStack {
                        if let message = alert.message {
                            MessageView(message: message, color: .theme.accent)
                        }
                        Button(action: {
                            toggleAlert?()
                        }) {
                            MessageView(message: alert.actionLabel, color: alert.theme)
                                .padding()
                                .background(Color.theme.accent.cornerRadius(25))
                                .padding(.top)
                        }
                        .buttonStyle(PressedEffectStyle(scaling: 0.95))
                    }
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

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(alert: .constant(AlertModel.defaultAlert))
    }
}
