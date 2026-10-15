//
//  AppBackgroundView.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 11/05/26.
//

import SwiftUI

struct AppBackgroundView: View {
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(#colorLiteral(red: 0.18, green: 0.2, blue: 0.24, alpha: 1)),
                Color(#colorLiteral(red: 0.38, green: 0.45, blue: 0.53, alpha: 1)),
                Color(#colorLiteral(red: 0.92, green: 0.94, blue: 0.96, alpha: 1))
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
