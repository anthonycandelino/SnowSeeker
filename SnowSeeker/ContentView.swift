//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Anthony Candelino on 2024-10-11.
//

import SwiftUI

enum SortOption {
    case defaultOrder, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var sortOption: SortOption = .defaultOrder
    
    var filteredResorts: [Resort] {
        let sortedResorts: [Resort]
        
        switch sortOption {
        case .alphabetical:
            sortedResorts = resorts.sorted { $0.name < $1.name }
        case .country:
            sortedResorts = resorts.sorted { $0.country < $1.country }
        case .defaultOrder:
            sortedResorts = resorts
        }
        
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            HStack {
                Spacer()
                Picker("Sort by", selection: $sortOption) {
                    Text("Default").tag(SortOption.defaultOrder)
                    Text("Alphabetical").tag(SortOption.alphabetical)
                    Text("Country").tag(SortOption.country)
                }
            }
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                                
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search resorts")
        } detail : {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
