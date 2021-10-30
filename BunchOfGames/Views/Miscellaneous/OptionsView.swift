//
//  OptionsView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 07/09/2021.
//

import SwiftUI

struct OptionsView: View {
    @Binding var isShowingOptions: Bool
    var body: some View {
        if isShowingOptions {
            ZStack {
                Color.primary.opacity(0.1).ignoresSafeArea()
                Color.theme.accent
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                    .shadow(color: Color.primary, radius: 2)
                    .padding(.horizontal)
                VStack {
                    Text("OPTIONS")
                        .font(.system(size: 40, weight: .heavy, design: .rounded))
                    Button(action: {
                        isShowingOptions.toggle()
                    }) {
                        Text("DISMISS")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(isShowingOptions: .constant(false))
    }
}
