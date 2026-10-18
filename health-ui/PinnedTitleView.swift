//
//  PinnedTitleView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import SwiftUI
import Charts
import MapKit

struct PinnedTitleView: View {
    var body: some View {
        Text("Pinned")
            .padding(.horizontal)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.primary)
    }
}

#Preview {
    PinnedTitleView()

}
