//
//  Untitled 2.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 18/03/26.
//

import SwiftUI

struct Day3: View {
    
    
    let names = ["a", "b", "c", "d"]
    
    var body: some View {
        NavigationStack{
            
            VStack {
                List(names, id: \.self) { item in
                    NavigationLink(destination: Details(item: item)) {
                        VStack{
                            Image(systemName: "heart.fill")
                            HStack {
                                Image(systemName: "applelogo")
                                Text(item)
                            }
                        }
                    }
                }
               
            }
            .navigationTitle("HOME")
        }
    }
}

struct Details:View{
    
    var item: String
    @Environment(\.dismiss) var dismiss
    var body:  some View {
        HStack{
            
                Text("You have selected")
                //NavigationLink("\(item)", value: DismissAction)
                
                Button(item){
                    dismiss()
                }
                    .foregroundColor(.blue)
                    .font(.headline)
                    .bold()
                    .background(Color.green)
            
        }
        
    }
}


#Preview {
    Day3()
}

#Preview{
    Details(item: "Preview")
}
