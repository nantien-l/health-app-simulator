import SwiftUI
import Playgrounds
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ZStack{

                HealthBackgroundView()

                ScrollView{
                    VStack{
                        VStack{
                            HStack {
                                PinnedTitleView()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            StepsView(steps: "34", date: "Yesterday")
                            WeightView()
                            ShowAllHealthDataView()
                        }.padding()

                        VStack{
                            HStack {
                                TrendTitleView()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ShowAllHealthTrendView()
                        }.padding()


                        VStack{
                            HStack {
                                HighlightsTitleView()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            StepsHighlightView()
                            HeadphoneAudioLevelsHighlightView()
                            WorkoutsHighlightView()
                            ShowAllHighlightsView()
                        }.padding()

                        Text("[Learn more about Apple Health](https://www.apple.com/ios/health/)")
                            .font(.footnote)
                            .tint(.blue)
                            .padding(.bottom, 24)

                    }
                    .navigationTitle("Summary")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                print("Account tapped")
                            } label: {
                                Image(systemName: "apple.logo")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.primary)
                            }
                            .accessibilityLabel("Account")
                        }
                    }
                }
                }
            }
            .tabItem {
                Label("Summary", systemImage: "heart.fill")
            }

            NavigationStack {
                Text("Sharing")
                    .navigationTitle("Sharing")
            }
            .tabItem {
                Label("Sharing", systemImage: "person.2.fill")
            }

            NavigationStack {
                Text("Browse")
                    .navigationTitle("Browse")
            }
            .tabItem {
                Label("Browse", systemImage: "square.grid.2x2.fill")
            }
        }
        .tint(.blue)
    }
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}




struct StepPoint: Identifiable {
    let id = UUID()
    let hour: Double
    let steps: Double
}
