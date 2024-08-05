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
import CoreLocation

struct AgentCard: View {
    var agent: Agent
    @Binding var isFavorite: Bool

    private func color(for role: String) -> Color {
        switch role {
        case "Controller":
            return .orange
        case "Duelist":
            return .red
        case "Sentinel":
            return .cyan
        case "Initiator":
            return .purple
        default:
            return .gray
        }
    }

    var body: some View {
        ZStack {
            Color("valorant-dark")
                .edgesIgnoringSafeArea(.bottom)
            ScrollView {
                VStack {
                    MapView(coordinate: agent.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                    CircleImage(image: agent.image)
                        .offset(y: -100)
                        .padding(.bottom, -100)
                    
                    VStack {
                        Text(agent.name)
                            .font(.custom("Coiny-Regular", size: 40))
                            .bold()
                            .foregroundColor(.white)
                        
                        Button(action: {
                            isFavorite.toggle()
                        }) {
                            Image(systemName: isFavorite ? "star.fill" : "star")
                                .foregroundColor(isFavorite ? .yellow : .gray)
                                .font(.system(size: 30))
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("⭐️ \(agent.role) ⭐️")
                        .font(.custom("Coiny-Regular", size: 25))
                        .bold()
                        .foregroundColor(color(for: agent.role)) // Updated color
                    
                    Text("🏅Background : ")
                        .font(.custom("Coiny-Regular", size: 25))
                        .bold()
                        .foregroundColor(.white)
                        .padding(3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(agent.background)
                        .font(.custom("Coiny-Regular", size: 25))
                        .bold()
                        .foregroundColor(.white) // Text color
                        .padding()
                        .background(Color(.darkGray)) // Background color
                        .cornerRadius(10) // Rounded corners
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Skill Image
                    agent.skillImage
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 20)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AgentCard_Previews: PreviewProvider {
    static var previews: some View {
        AgentCard(agent: agents[0], isFavorite: .constant(false))
    }
}
