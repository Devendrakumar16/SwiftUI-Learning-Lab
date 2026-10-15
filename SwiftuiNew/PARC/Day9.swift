import SwiftUI



struct Day9: View {
    
    
    @State private var isBalancePressed: Bool = false
    @State private var isRewardsPressed: Bool = false
    @State private var isActivityPressed: Bool = false
    @State private var isSendPressed: Bool = false
    @State private var isReceivePressed: Bool = false
    @State private var isPayPressed: Bool = false
    @State private var isDarkModeOn: Bool = false
    var body: some View {
        ZStack {

            // 🔹 Background
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

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // 🔹 Header
                    VStack(alignment: .leading, spacing: 6) {
                        HStack{
                            Text("Hello, Dev 👋")
                                .font(.largeTitle)
                                .bold()
                            
                            Spacer()
                            
                            Text(isDarkModeOn ? "Light Mode" : "Dark mode")
                                .font(.title3)
                              
                            Button(action: {
                                print(isDarkModeOn ? "DARK MODE ON" : "LIGHT MODE ON")
                                isDarkModeOn.toggle()
                                
                            }){
                                Image(systemName: isDarkModeOn ? "circle" : "circle.fill")
                                    .foregroundStyle(.green)
                                
                            }
                        }

                        //time.now
                        Text("Good Morning ☀️")
                            .font(.subheadline)
                            .foregroundStyle(isDarkModeOn ? .primary : .secondary)
                    }

                    // 🔹 Cards Row
                    HStack(spacing: 16) {

                        // Balance Card
                        VStack(alignment: .leading, spacing: 12) {
                            Image(systemName: "creditcard.fill")
                                .foregroundStyle(.blue)

                            Text("Balance")
                                .font(.subheadline)
                                .foregroundStyle(.gray)

                            Text("₹12,500")
                                .font(.title2)
                                .bold()
                        }
                        .cardStyle()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isBalancePressed.toggle()
                                isRewardsPressed = false
                                isActivityPressed = false
                                isSendPressed = false
                                isReceivePressed = false
                                isPayPressed = false
                            }
                        }
                        .background(isBalancePressed ? Color.blue.opacity(0.25) : Color.clear)
                        .cornerRadius(16)
                        .scaleEffect(isBalancePressed ? 1.1 : 1)

                        // Rewards Card
                        VStack(alignment: .leading, spacing: 12) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)

                            Text("Rewards")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                                

                            Text("240 pts")
                                .font(.title2)
                                .bold()
                        }
                        .cardStyle()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isRewardsPressed.toggle()
                                isBalancePressed = false
                                isActivityPressed = false
                                isSendPressed = false
                                isReceivePressed = false
                                isPayPressed = false
                            }
                        }
                        .background(isRewardsPressed ? Color.blue.opacity(0.25) : Color.clear)
                        .cornerRadius(16)
                        .scaleEffect(isRewardsPressed ? 1.1 : 1)
                        
                    }

                    // 🔹 Activity Card
                    VStack(alignment: .leading, spacing: 16) {

                        Text("Your Activity")
                            .font(.headline)

                        HStack {
                            Label("Steps: 5000", systemImage: "figure.walk")
                            Spacer()
                        }

                        HStack {
                            Label("Calories: 300", systemImage: "flame.fill")
                            Spacer()
                        }
                    }
                    .cardStyle()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isActivityPressed.toggle()
                            isBalancePressed = false
                            isRewardsPressed = false
                            isSendPressed = false
                            isReceivePressed = false
                            isPayPressed = false
                        }
                    }
                    .background(isActivityPressed ? Color.blue.opacity(0.25) : Color.clear)
                    .cornerRadius(16)
                    .scaleEffect(isActivityPressed ? 1.05 : 1)

                    // 🔹 Quick Actions (New Section)
                    HStack(spacing: 16) {
                        actionItem(icon: "arrow.up.circle.fill", title: "Send")
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    isSendPressed.toggle()
                                    isBalancePressed = false
                                    isRewardsPressed = false
                                    isActivityPressed = false
                                    isReceivePressed = false
                                    isPayPressed = false
                                }
                            }
                            .background(isSendPressed ? Color.blue.opacity(0.25) : Color.clear)
                            .cornerRadius(16)
                            .scaleEffect(isSendPressed ? 1.1 : 1)

                        actionItem(icon: "arrow.down.circle.fill", title: "Receive")
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    isReceivePressed.toggle()
                                    isBalancePressed = false
                                    isRewardsPressed = false
                                    isActivityPressed = false
                                    isSendPressed = false
                                    isPayPressed = false
                                }
                            }
                            .background(isReceivePressed ? Color.blue.opacity(0.25) : Color.clear)
                            .cornerRadius(16)
                            .scaleEffect(isReceivePressed ? 1.1 : 1)

                        actionItem(icon: "qrcode", title: "Pay")
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    isPayPressed.toggle()
                                    isBalancePressed = false
                                    isRewardsPressed = false
                                    isActivityPressed = false
                                    isSendPressed = false
                                    isReceivePressed = false
                                }
                            }
                            .background(isPayPressed ? Color.blue.opacity(0.25) : Color.clear)
                            .cornerRadius(16)
                            .scaleEffect(isPayPressed ? 1.1 : 1)
                    }
                    
                    CustonCard{
                        VStack(alignment: .leading){
                            HStack
                            {
                                Text("Water")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .cardStyle()
                                
                                Text("ASDF")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .cardStyle()
                            }
                        }
                       
                    }
                }
                .padding()
            }
        }
    }

    // 🔹 Reusable Action Item
    func actionItem(icon: String, title: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)

            Text(title)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .cardStyle()
    }
}

// 🔹 Reusable Card Modifier
extension View {
    func cardStyle() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.2))
                    )
            )
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    Day9()
}



struct CustonCard<Content: View>:View {
    let content: Content
    
    init(@ViewBuilder content: ()-> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            //.padding()
            .frame(maxWidth: .infinity)
//            .background(
//                RoundedRectangle(cornerRadius: 16, style: .continuous)
//                    .fill(.ultraThinMaterial)
//            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 16, style: .continuous)
//                    .stroke(Color.white.opacity(0.2))
//            )
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
            //.padding(.horizontal)
    }
}

