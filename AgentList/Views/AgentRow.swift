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

struct AgentRow: View {
    var agent: Agent
    @Binding var isFavorite: Bool

    private func gradient(for role: String) -> LinearGradient {
        switch role {
        case "Controller":
            return LinearGradient(
                gradient: Gradient(colors: [.orange, .black]),
                startPoint: .leading,
                endPoint: .trailing
            )
        case "Duelist":
            return LinearGradient(
                gradient: Gradient(colors: [.red, .black]),
                startPoint: .leading,
                endPoint: .trailing
            )
        case "Sentinel":
            return LinearGradient(
                gradient: Gradient(colors: [.cyan, .black]),
                startPoint: .leading,
                endPoint: .trailing
            )
        case "Initiator":
            return LinearGradient(
                gradient: Gradient(colors: [.purple, .black]),
                startPoint: .leading,
                endPoint: .trailing
            )
        default:
            return LinearGradient(
                gradient: Gradient(colors: [.gray, .black]),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }

    var body: some View {
        HStack {
            agent.image
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70) // Increased size
                .clipShape(RoundedRectangle(cornerRadius: 15)) // Added border radius
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2) // Border color and width
                )
            VStack(alignment: .leading) {
                Text(agent.name)
                    .font(.custom("Coiny-Regular", size: 18))
                    .foregroundColor(.white)
                Text(agent.role)
                    .font(.custom("Coiny-Regular", size: 14))
                    .foregroundColor(.white) // Ensure text color contrasts with gradient
            }
            Spacer()
            Button(action: {
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(isFavorite ? .yellow : .gray)
            }
        }
        .padding()
        .background(gradient(for: agent.role))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct AgentRow_Previews: PreviewProvider {
    static var previews: some View {
        AgentRow(agent: agents[0], isFavorite: .constant(false))
            .previewLayout(.fixed(width: 300, height: 100)) 
    }
}
