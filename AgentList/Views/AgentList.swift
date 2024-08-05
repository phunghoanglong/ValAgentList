/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Phung Hoang Long
  ID: s3965673
  Created  date: 05/08/2024
  Last modified: 06/08/2024
  Acknowledgement: SSET-Contact-List-iOS Turorial Week 4
*/

import SwiftUI

struct AgentList: View {
    @State private var agents: [Agent] = decodeJsonFromJsonFile(jsonFileName: "agents.json")
    @State private var isDarkMode = false
    @State private var searchText = ""
    @State private var showFavoritesOnly = false

    @Environment(\.colorScheme) var colorScheme

    var filteredAgents: [Agent] {
        let lowercasedSearchText = searchText.lowercased()
        return agents.filter { agent in
            let matchesSearchText = lowercasedSearchText.isEmpty || agent.name.lowercased().contains(lowercasedSearchText)
            let matchesFavoriteFilter = !showFavoritesOnly || agent.isFavorite
            return matchesSearchText && matchesFavoriteFilter
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .font(.custom("Coiny-Regular", size: 18))
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorite Agents")
                        .padding(.leading)
                        .font(.custom("Coiny-Regular", size: 18))
                        .bold()
                }
                .padding()

                List {
                    ForEach(filteredAgents) { agent in
                        NavigationLink {
                            AgentCard(agent: agent, isFavorite: $agents[agents.firstIndex(where: { $0.id == agent.id })!].isFavorite)
                        } label: {
                            AgentRow(agent: agent, isFavorite: $agents[agents.firstIndex(where: { $0.id == agent.id })!].isFavorite)
                                .font(.custom("Coiny-Regular", size: 18))
                        }
                    }
                }
                .navigationTitle("Valorant Agent 🔫")
                .font(.custom("Coiny-Regular", size: 24))
                .navigationBarItems(trailing: Button(action: {
                    isDarkMode.toggle()
                }) {
                    Image(systemName: colorScheme == .dark ? "sun.max.fill" : "moon.fill")
                })
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}

struct AgentList_Previews: PreviewProvider {
    static var previews: some View {
        AgentList()
    }
}
