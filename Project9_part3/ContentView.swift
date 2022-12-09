//
//  ContentView.swift
//  Project9_part3
//
//  Created by K.Takahama on R 4/12/09.
//

import SwiftUI

struct ContentView: View {
    //Project9_part3 やっていきやしょう(๑>◡<๑)
    //３つの円をスライダーを使って描画していきます
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {//最後に画像にブラーをかけてみます
            Image("orizuru")
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
