//
//  ContentView.swift
//  TwoThousandFortyEight
//
//  Created by ma c on 2023/7/21.
//

import SwiftUI

let maxWidth = UIScreen.main.bounds.width
let maxHeight = UIScreen.main.bounds.height

struct ContentView: View {
    
    @State
    var coordinates: (x: Int, y: Int) = (0, 0)

    var body: some View {
        VStack {
            Form {
                Stepper(value: self.$coordinates.x, in: 0...3) {
                    Text("横坐标\(self.coordinates.x)")
                }
                Stepper(value: self.$coordinates.y, in: 0...3) {
                    Text("纵坐标\(self.coordinates.y)")
                }
            }
            
            ZStack {
                BackgroundGrid()
                SingleCard(coordinates: self.$coordinates)
                    .animation(.spring(dampingFraction: 0.55), value: coordinates.x)
                    .animation(.spring(dampingFraction: 0.55), value: coordinates.y)
            }
            .frame(width: min(maxWidth, maxHeight)*0.8, height: min(maxWidth, maxHeight))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
