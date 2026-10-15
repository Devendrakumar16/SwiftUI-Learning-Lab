//
//  hhstack.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 16/03/26.
//

//
//  HStack.swift
//  SwiftuiNew
//
//  Created by Devendra Kumar on 16/03/26.
//


import SwiftUI

struct HhStack: View{
    
    @State private var isNotificationOn = false
    @State private var isDarkModeOn = false
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                // Header with dynamic gradient
                LinearGradient(colors: [Color.accentColor.opacity(0.35), Color.purple.opacity(0.35)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .overlay(
                        HStack{
                            VStack(alignment: .leading, spacing: 6){
                                Text("Preferences")
                                    .font(.title3.weight(.semibold))
                                Text("Personalize your experience")
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: isDarkModeOn ? "moon.stars.fill" : "sun.max.fill")
                                .symbolRenderingMode(.hierarchical)
                                .imageScale(.large)
                                .font(.title2)
                                .transition(.scale.combined(with: .opacity))
                                .id(isDarkModeOn)
                        }
                            .padding(16)
                    )
                    .frame(height: 84)
                    .clipShape(.rect(topLeadingRadius: 16, topTrailingRadius: 16))
                
                // Content
                VStack(spacing: 14){
                    preferenceRow(
                        icon: "bell.badge.fill",
                        iconTint: .orange,
                        title: "Notifications",
                        subtitle: isNotificationOn ? "Enabled" : "Disabled",
                        toggleBinding: $isNotificationOn
                    )
                    
                    preferenceRow(
                        icon: "moon.fill",
                        iconTint: .indigo,
                        title: "Dark Mode",
                        subtitle: isDarkModeOn ? "On" : "Off",
                        toggleBinding: $isDarkModeOn
                    )
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color(.secondarySystemBackground))
                )
                .clipShape(.rect(bottomLeadingRadius: 16, bottomTrailingRadius: 16))
            }
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .strokeBorder(Color(.separator).opacity(0.6), lineWidth: 0.5)
            )
            .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 6)
            .padding()
            .animation(.smooth(duration: 0.25), value: isNotificationOn)
            .animation(.smooth(duration: 0.25), value: isDarkModeOn)
            .preferredColorScheme(isDarkModeOn ? .dark : .light)
        }
        .navigationTitle("Prefrence")
    }
        
        @ViewBuilder
        private func preferenceRow(icon: String, iconTint: Color, title: String, subtitle: String, toggleBinding: Binding<Bool>) -> some View {
            HStack(spacing: 12){
                ZStack{
                    Circle()
                        .fill(iconTint.opacity(0.15))
                    Image(systemName: icon)
                        .foregroundStyle(iconTint)
                        .imageScale(.medium)
                }
                .frame(width: 34, height: 34)
                
                VStack(alignment: .leading, spacing: 2){
                    Text(title)
                        .font(.body)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Toggle("", isOn: toggleBinding)
                    .labelsHidden()
                    .onChange(of: toggleBinding.wrappedValue) { _, _ in
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }
            }
            .padding(.vertical, 6)
        }
    
}


#Preview {
    HhStack()
}

