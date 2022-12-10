//
//  ContentView.swift
//  Project9_part3
//
//  Created by K.Takahama on R 4/12/09.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows),Double(columns))
        }
        set{
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<columns {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct ContentView: View {
    //Project9_part3 やっていきやしょう(๑>◡<๑)
    //行と列を使用して新しい形状を作っていきます
    //表示させていきます
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {//前回のようにランダムにしてみます
                    rows = Int(Double.random(in: 4...16))
                    columns = Int(Double.random(in: 4...16))
                }//一瞬で変わるのでアニメーションさせるには・・・
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
