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

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.white),lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View{
        CircleImage(image: Image("brimstone"))
    }
}
