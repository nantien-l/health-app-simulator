//
//  WorkoutsHighlightView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import MapKit

struct WorkoutsHighlightView: View {

    @State private var cameraPosition: MapCameraPosition =
        .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 25.0173,
                    longitude: 121.5397
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.008,
                    longitudeDelta: 0.008
                )
            )
        )

    let route: [CLLocationCoordinate2D] = [
        .init(latitude: 25.0171, longitude: 121.5350),
        .init(latitude: 25.0172, longitude: 121.5388),
        .init(latitude: 25.0179, longitude: 121.5390),
        .init(latitude: 25.0179, longitude: 121.5376),
        .init(latitude: 25.0181, longitude: 121.5380),
        .init(latitude: 25.0187, longitude: 121.5386),
        .init(latitude: 25.0192, longitude: 121.5394),
        .init(latitude: 25.0190, longitude: 121.5401),
        .init(latitude: 25.0185, longitude: 121.5407),
        .init(latitude: 25.0188, longitude: 121.5414),
        .init(latitude: 25.0183, longitude: 121.5420),
        .init(latitude: 25.0176, longitude: 121.5418),
        .init(latitude: 25.0171, longitude: 121.5412),
        .init(latitude: 25.0165, longitude: 121.5415),
        .init(latitude: 25.0159, longitude: 121.5411),
        .init(latitude: 25.0163, longitude: 121.5399),
        .init(latitude: 25.0157, longitude: 121.5380),
        .init(latitude: 25.0155, longitude: 121.5361)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // Header
            HStack {
                Image(systemName: "flame.fill")
                Text("Workouts")
                    .fontWeight(.semibold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(.orange)
            .padding(16)

            // Summary
            Text("Your average pace during your last walk was 31 minutes, 24 seconds per kilometre.")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.primary)
                .padding(.horizontal, 16)
                .padding(.bottom, 24)

            // Map
            Map(position: $cameraPosition) {
                MapPolyline(coordinates: route)
                    .stroke(.green, lineWidth: 6)
            }
            .mapStyle(.standard(elevation: .flat))
            .frame(height: 260)
            .allowsHitTesting(false)

            // Metrics
            HStack(spacing: 0) {
                metric("Distance", "1.1", "km")

                Divider()
                    .overlay(.gray)
                    .padding(.horizontal, 16)

                metric("Duration", "35", "min")

                Divider()
                    .overlay(.gray)
                    .padding(.horizontal, 16)

                metric("Energy", "69.6", "kcal")
            }
            .frame(height: 70)
            .padding(16)
        }
        .background(Color("HealthHighlight"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)
    }

    func metric(
        _ title: String,
        _ value: String,
        _ unit: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)

            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text(value)
                    .font(.title2.bold())
                    .foregroundStyle(.primary)

                Text(unit)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}


#Preview {
    WorkoutsHighlightView()
}
