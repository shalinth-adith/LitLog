//
//  Entryview.swift
//  LitLog
//
//  Created by shalinth adithyan on 12/08/25.
//

import SwiftUI

struct EntrySplashView: View {
    let onContinue: () -> Void
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private let bookCount = 6

    var body: some View {
        ZStack {
            LinearGradient(
                colors: scheme == .dark
                ? [Color(.sRGB, red: 0.06, green: 0.12, blue: 0.20, opacity: 1),
                   Color(.sRGB, red: 0.10, green: 0.18, blue: 0.30, opacity: 1)]
                : [Color(.systemBackground), Color(.secondarySystemBackground)],
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Text("Lit Log")
                    .font(.system(size: 40, weight: .bold))
                    .tracking(0.5)

                HStack(spacing: 16) {
                    ForEach(0..<bookCount, id: \.self) { i in
                        BookJumpIcon(index: i, animateBounce: !reduceMotion)
                    }
                }

                Text("Tap to enter")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .opacityPulse()
                    .padding(.top, 8)
               
            }
            .padding(.horizontal, 24)
        }
        .contentShape(Rectangle())
        .onTapGesture { onContinue() }
    }
}

private struct BookJumpIcon: View {
    let index: Int
    let animateBounce: Bool

    @State private var popped = false
    @State private var bounce = false

    var body: some View {
        Image(systemName: "book.closed.fill")
            .font(.system(size: 42, weight: .regular))
            .symbolRenderingMode(.hierarchical)
            .foregroundStyle(.tint)
            .scaleEffect(popped ? 1.0 : 0.6, anchor: .bottom)
            .opacity(popped ? 1 : 0)
            .offset(y: bounce ? -8 : 0)
            .rotationEffect(.degrees(bounce ? (index.isMultiple(of: 2) ? -6 : 6) : 0), anchor: .bottom)
            .shadow(color: Color.black.opacity(popped ? 0.18 : 0), radius: 6, x: 0, y: 3)
            .onAppear {
                let delay = 0.08 * Double(index)

                // Pop-in
                withAnimation(.spring(response: 0.42, dampingFraction: 0.68).delay(delay)) {
                    popped = true
                }

                // Gentle jump (respects Reduce Motion)
                guard animateBounce else { return }
                withAnimation(.easeInOut(duration: 0.46).delay(delay + 0.25).repeatForever(autoreverses: true)) {
                    bounce = true
                }
            }
            .accessibilityHidden(true) // decorative
    }
}

/// Little helper for a subtle blinking hint
private extension View {
    func opacityPulse() -> some View {
        modifier(_OpacityPulse())
    }
}

private struct _OpacityPulse: ViewModifier {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var on = false
    func body(content: Content) -> some View {
        content
            .opacity(on ? 1 : 0.35)
            .onAppear {
                guard !reduceMotion else { return }
                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    on = true
                }
            }
    }
}

#Preview("Entry • Light") {
    EntrySplashView{}
        .preferredColorScheme(.dark)
}
