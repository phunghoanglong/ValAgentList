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

struct Welcome: View {
    @State private var showInfo = false
    @State private var navigateToAgentList = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("valorant-dark"), .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                
                    Image("valorant-icon") // Ensure the image is added to your assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 150)

               
                    Text(" Valorant Agent List")
                        .font(.custom("Coiny", size: 34))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                        .padding(.top,15)

               
                    Text("Know your Agent")
                        .font(.custom("Coiny", size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                     
                    Text("Become the Radiant")
                        .font(.custom("Coiny", size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.bottom, 40)

           
                    NavigationLink(destination: AgentList(), isActive: $navigateToAgentList) {
                        Button(action: {
                            navigateToAgentList = true
                        }) {
                            Text("Start")
                                .font(.custom("Coiny", size: 50))
                                .padding()
                                .border(Color.white)
                                .foregroundColor(.valorant-Red)
                                .cornerRadius(5)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
              
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showInfo.toggle()
                        }) {
                            Image(systemName: "person.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                }
            }
            .sheet(isPresented: $showInfo) {
                InfoView()
            }
        }
    }
}

struct InfoView: View {
    var body: some View {
        VStack {
            Text("App Author:")
                .font(.custom("Coiny", size: 22))
                .foregroundColor(Color("valorant-dark"))
                .padding(.bottom, 5)
            Text("Phung Hoang Long")
                .font(.custom("Coiny", size: 22))
                .foregroundColor(Color("valorant-red"))
                .padding(.bottom, 10)
            Text("Student ID:")
                .font(.custom("Coiny", size: 22))
                .foregroundColor(Color("valorant-dark"))
            Text(" s3965673")
                .font(.custom("Coiny", size: 22))
                .foregroundColor(Color("valorant-red"))
            Text("Student ID:")
                .font(.custom("Coiny", size: 22))
                .foregroundColor(Color("valorant-dark"))
            Text("Valorant Agent List")
                .font(.custom("Coiny", size: 22))
                .foregroundColor(Color("valorant-red"))
                .padding(.bottom, 20)

            Button(action: {
            
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
            }) {
                Text("Close")
                    .font(.custom("Coiny", size: 20))
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("valorantRed"), Color.white.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(15)
        .padding()
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
