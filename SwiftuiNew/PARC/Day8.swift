import SwiftUI

struct Day8: View {
    
    @State private var items: [String] = []
    @State private var isLoading = false
    @State private var isError = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.18, green: 0.2, blue: 0.24, alpha: 1)).opacity(0.9), location: 0.0),
                    .init(color: Color(#colorLiteral(red: 0.38, green: 0.45, blue: 0.53, alpha: 1)).opacity(0.85), location: 0.5),
                    .init(color: Color(#colorLiteral(red: 0.92, green: 0.94, blue: 0.96, alpha: 1)).opacity(0.9), location: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            RadialGradient(
                colors: [Color.black.opacity(0.0), Color.black.opacity(0.12)],
                center: .center,
                startRadius: 200,
                endRadius: 1000
            )
            .blendMode(.multiply)
            .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                // 🔹 Load Button
                Button("LOAD DATA") {
                    loadData()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .disabled(isLoading)
                
                // 🔹 STATES
                
                if isLoading {
                    VStack {
                        ProgressView()
                            .tint(.white)
                        Text("Loading...")
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                else if isError {
                    VStack(spacing: 12) {
                        Text("Failed to load data ❌")
                            .foregroundStyle(.white)
                        
                        Button("Retry") {
                            loadData()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                else if items.isEmpty {
                    Text("No data available")
                        .foregroundStyle(.white)
                        .padding()
                }
                
                else {
                    // 🔹 SUCCESS STATE (Your UI)
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(items, id: \.self) { fruit in
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
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding(.top, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
    }
    
    // 🔹 Fake API Call
    func loadData() {
        isLoading = true
        isError = false
        items = []
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let success = Bool.random()
            
            if success {
                items = ["apple", "mango", "grapes", "kiwi", "banana"]
            } else {
                isError = true
            }
            
            isLoading = false
        }
    }
}

#Preview {
    Day8()
}
