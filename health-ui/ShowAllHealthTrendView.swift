//
//  ShowAllHealthTrendView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import SwiftUI
import Charts
import MapKit

struct ShowAllHealthTrendView: View {
    @Environment(\.colorScheme) private var colorScheme

    @ViewBuilder
    private var trendIcon: some View {
        if colorScheme == .light {
            Image("trends-light")
                .resizable()
                .scaledToFit()
        } else {
            Image("trends")
                .resizable()
                .scaledToFit()
        }
    }

    var body: some View {
        HStack{
            trendIcon
                .frame(width: 20, height: 20)

            Text("Show All Health Trends")
                .foregroundStyle(.primary)
                .font(.caption)
                .padding(3)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.caption)


        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(Color("HealthCard"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)
    }
}


#Preview {
    ShowAllHealthTrendView()
}
