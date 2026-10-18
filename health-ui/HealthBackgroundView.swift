//
//  HealthBackgroundView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds

struct HealthBackgroundView: View {
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        ZStack {
            Color("HealthBackground")

            LinearGradient(
                colors: [
                    Color(red: 0.50, green: 0.12, blue: 0.56),
                    Color(red: 0.55, green: 0.20, blue: 0.12)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: 350)
            .opacity(colorScheme == .dark ? 1 : 0.18)
            .mask {
                LinearGradient(
                    stops: [
                        .init(color: .white, location: 0),
                        .init(color: .white, location: 0.45),
                        .init(color: .clear, location: 1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
    }
}


#Preview {
    HealthBackgroundView()
}
