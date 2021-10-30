//
//  ToggleAlertView.swift
//  BunchOfGames
//
//  Created by Yann Christophe Maertens on 03/09/2021.
//

import SwiftUI

struct ToggleAlertView: View {
    var alert: AlertModel?
    @Binding var isChecked: Bool
    @Binding var isAlertsEnabled: Bool
    var body: some View {
        HStack {
            Button(action: { isChecked.toggle() }) {
                ZStack {
                    Image(systemName: "square")
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                    if isChecked && isAlertsEnabled == true {
                        Image(systemName: "checkmark")
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }
            Text("Check to \(isChecked ? "disable" : "enable") this tutorial for next time")
                .font(.system(size: 15, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct ToggleAlertView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleAlertView(isChecked: .constant(true), isAlertsEnabled: .constant(true))
            .environmentObject(GameViewModel())
    }
}
