//
//  Day7.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 08/04/26.
//

import SwiftUI

struct Day7: View {
    @State private var searchBar: String = ""
    private var fruits  = ["apple", "mango", "grapes", "kiwi", "tomatos", "banana","apple", "mango", "grapes", "kiwi", "tomatos", "banana"]
    
    private var filteredFruits: [String] {
        let query = searchBar.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return fruits }
        return fruits.filter { $0.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        ZStack {
            // Modern dynamic gradient background
            ZStack {
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.18, green: 0.2, blue: 0.24, alpha: 1)).opacity(0.9), location: 0.0),   // slate
                        .init(color: Color(#colorLiteral(red: 0.38, green: 0.45, blue: 0.53, alpha: 1)).opacity(0.85), location: 0.5), // blue-gray
                        .init(color: Color(#colorLiteral(red: 0.92, green: 0.94, blue: 0.96, alpha: 1)).opacity(0.9), location: 1.0)   // soft off-white
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                // subtle vignette for depth
                RadialGradient(
                    colors: [Color.black.opacity(0.0), Color.black.opacity(0.12)],
                    center: .center,
                    startRadius: 200,
                    endRadius: 1000
                )
                .blendMode(.multiply)
            }
            .ignoresSafeArea()

            VStack(spacing: 16) {
                // Header
                VStack(spacing: 6) {
                    Text("Fruits")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .foregroundStyle(.white.opacity(0.95))
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                    Text("Search and browse your favorites")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.top, 8)

                // Search Bar
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                        .imageScale(.medium)
                    TextField("Search fruits", text: $searchBar)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .foregroundStyle(.primary)
                    if !searchBar.isEmpty {
                        Button(action: { withAnimation(.easeInOut) { searchBar = "" } }) {
                            Image(systemName: "xmark.circle.fill")
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(.secondary)
                                .imageScale(.medium)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .strokeBorder(.white.opacity(0.15))
                )
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 8)
                .padding(.horizontal)

                // List as modern cards
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(filteredFruits, id: \.self) { fruit in
                            HStack(spacing: 12) {
                                ZStack {
                                    Circle()
                                        .fill(
                                            LinearGradient(colors: [
                                                Color.white.opacity(0.35),
                                                Color.white.opacity(0.15)
                                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        )
                                    Image(systemName: "leaf.fill")
                                        .foregroundStyle(Color.green.opacity(0.9))
                                        .imageScale(.small)
                                }
                                .frame(width: 36, height: 36)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(fruit.capitalized)
                                        .font(.system(.headline, design: .rounded))
                                        .foregroundStyle(Color.white.opacity(0.95))
                                    Text("Delicious and fresh")
                                        .font(.caption)
                                        .foregroundStyle(Color.white.opacity(0.65))
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.white.opacity(0.6))
                                    .imageScale(.small)
                            }
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.white.opacity(0.08))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .strokeBorder(Color.white.opacity(0.12))
                            )
                            .shadow(color: .black.opacity(0.12), radius: 12, x: 0, y: 6)
                            .padding(.horizontal)
                            .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .buttonStyle(.plain)
                            .onTapGesture {
                                // simple tap feedback animation
                                withAnimation(.easeInOut(duration: 0.12)) {}
                            }
                            .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .top)), removal: .opacity))
                        }
                    }
                    .padding(.vertical, 4)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.bottom)
        }
        .animation(.spring(response: 0.8, dampingFraction: 0.8), value: filteredFruits)
    }
}

#Preview {
    Day7()
}

////
////  Day7.swift
////  SwiftuiNew
////
////  Created by Devendra Kumar on 08/04/26.
////
//
//import SwiftUI
//
//struct Day7: View {
//    
//    @State private var searchBar:String = ""
//    private var fruits  = ["apple", "mango", "grapes", "kiwi", "tomatos", "banana","apple", "mango", "grapes", "kiwi", "tomatos", "banana"]
//    
//    private var filteredFruits: [String] {
//        let query = searchBar.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !query.isEmpty else { return fruits }
//        return fruits.filter { $0.localizedCaseInsensitiveContains(query) }
//    }
//    
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Search...", text: $searchBar)
//                Button(action: { searchBar = "" }) {
//                    Image(systemName: "xmark")
//                        .imageScale(.medium)
//                        .foregroundStyle(.primary)
//                        .padding(8)
//                        .background(.ultraThinMaterial, in: Circle())
//                }
//            }
//            .padding(10)
//            .background(
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .fill(.white.opacity(0.2))
//            )
//            .padding()
//
//            List(filteredFruits, id: \.self) { fruit in
//                Text(fruit)
//            }
//            .scrollContentBackground(.hidden) // hides default List background
//            .background(.clear) // transparent background so gradient shows through
//            //.listStyle(.plain)
//            .padding(.horizontal, 10)
//            .padding(.bottom, 5)
//        }
//        .background(
//            AngularGradient(
//                gradient: Gradient(colors: [
//                    Color.purple.opacity(0.9),
//                    Color.indigo.opacity(0.9),
//                    Color.blue.opacity(0.9),
//                    Color.cyan.opacity(0.9),
//                    Color.mint.opacity(0.9),
//                    Color.pink.opacity(0.9)
//                ]),
//                center: .center
//            )
//            .ignoresSafeArea()
//        )
//    }
//}
//
//
//#Preview {
//    Day7()
//}
//

