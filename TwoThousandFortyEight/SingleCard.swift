//
//  SingleCardf.swift
//  TwoThousandFortyEight
//
//  Created by ma c on 2023/7/21.
//

import SwiftUI

func appr(_ ip: CGFloat) -> Int {
    let remain = ip - CGFloat(Int(ip))
    return remain > 0.5 ? Int(ip) + 1 : Int(ip)
}

struct SingleCard: View {
    
    var lenth: CGFloat = 4
    var spacing: CGFloat = 10
    
    @Binding
    var coordinates: (x: Int, y: Int)
    @State
    var original: (x: Int, y: Int) = (0, 0) // 框外移动
    @State
    var magnet: (x: Int, y: Int) = (0, 0) // 框内移动
    @State
    var floatScale: CGFloat = 1
    
    var body: some View {
        GeometryReader{ geometry in
            let x = geometry.size.width / self.lenth / 1.075
            let y = geometry.size.height / self.lenth / 1.075
            let geometryX = x + spacing
            let geometryY = y + spacing
            ZStack{
                Rectangle()
                Text("2")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .frame(
                width: x,
                height: y
            )
            .foregroundColor(.yellow)
            .cornerRadius(10)
            .scaleEffect(self.floatScale)
            .shadow(
                radius: self.floatScale == 1.1 ? 10 : 0,
                x: self.floatScale == 1.1 ? 10 : 0,
                y: self.floatScale == 1.1 ? 10 : 0
            )
            .offset(
                x: CGFloat(self.coordinates.x) * geometryX,
                y: CGFloat(self.coordinates.y) * geometryY
            )
            .offset(
                x: CGFloat(self.magnet.x) / 5,
                y: CGFloat(self.magnet.y) / 5
            )
            .gesture(
                DragGesture()
                    .onChanged({ postion in
                        self.floatScale = 1.1
                        let movment = postion.translation
                        
                        let Xcoor = appr(movment.width / geometryX)
                        let Ycoor = appr(movment.height / geometryY)
                        
                        self.magnet.x = Int(movment.width - CGFloat(Xcoor) * geometryX)
                        self.magnet.y = Int(movment.height - CGFloat(Ycoor) * geometryY)
                        
                        self.coordinates.x = max(min(self.original.x + Xcoor, Int(self.lenth) - 1), 0)
                        self.coordinates.y = max(min(self.original.y + Ycoor, Int(self.lenth) - 1), 0)
                    })
                    .onEnded({ _ in
                        self.floatScale = 1
                        self.original = self.coordinates
                        self.magnet = (0, 0)
                    })
            )
        }
    }
}

struct SingleCard_Previews: PreviewProvider {
    static var previews: some View {
        SingleCard(coordinates: .constant((0, 0)))
    }
}
