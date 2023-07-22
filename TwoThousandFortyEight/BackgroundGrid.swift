//
//  BackgroundGrid.swift
//  TwoThousandFortyEight
//
//  Created by ma c on 2023/7/21.
//

import SwiftUI

struct BackgroundGrid: View {
    
    var lenth: CGFloat = 4
    var spacing: CGFloat = 10
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing: self.spacing) {
                ForEach(0 ..< 4) { _ in
                    HStack(spacing: self.spacing) {
                        ForEach(0 ..< 4) { _ in
                            Rectangle()
                                .frame(
                                    width: geometry.size.width / self.lenth / 1.075,
                                    height: geometry.size.height / self.lenth / 1.075
                                )
                                .foregroundColor(.gray)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct BackgroundGrid_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGrid()
    }
}
