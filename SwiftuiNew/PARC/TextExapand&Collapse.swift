//
//  TextExapand&Collapse.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 16/03/26.
//

// MARK: - Imports
import SwiftUI

// MARK: - View
struct TextExpandCollapse: View{
    @State private var isexpanded = false
    private let text = "SwiftUI lets you build great-looking apps across all Apple platforms with the power of Swift — and as you can see here, you can expand and collapse long text easily."
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(text)
                .lineLimit(isexpanded ? nil : 2 )
            
            Button(isexpanded ? "less" : "More"){
                isexpanded.toggle()
                
            }
        }
        .padding()
        .frame(width: .infinity)
        .background(Color.red.opacity(0.5))
        .cornerRadius(15)
        .padding(5)
        
        
    }
}

// MARK: - Preview
#Preview {
    TextExpandCollapse()
}
