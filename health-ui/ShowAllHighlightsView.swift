//
//  ShowAllHighlightsView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds

struct ShowAllHighlightsView: View {
    var body: some View {
        HStack {
            Text("Show All Highlights")
                .foregroundStyle(.blue)
                .font(.caption)

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
    ShowAllHighlightsView()
}
