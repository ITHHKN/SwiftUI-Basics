//
//  ContentView.swift
//  SwiftUi-Basics
//
//  Created by Hasnain Haider on 13/01/2026.
//

import SwiftUI

// MARK: - ContentView
struct ContentView: View {
    
    // MARK: Constants & Sample Data
    private let name: String = "Hasnain Haider"
    private let age: Int = 35
    @State private var newRow = ""
    @State private var fruits: [String] = [
        "fruits.apple",
        "fruits.orange",
        "fruits.banana",
        "fruits.pineapple"
    ]

    // MARK: View State
    @State private var count = 0
    @State private var textFName: String = ""
    @State private var showGreeting = false

    private let gradient = LinearGradient(
        colors: [Color.blue.opacity(0.18), Color.purple.opacity(0.18), Color.cyan.opacity(0.12)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    // MARK: Body
    var body: some View {
        NavigationStack {
            ZStack {
                gradient
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 18) {
                        headerCard
                        statRow
                        counterCard
                        greetingCard
                        fruitsCard
                        navigationCard
                    }
                    .padding(20)
                }
            }
            .navigationTitle(LocalizedStringKey("home.title"))
        }
    }

    // MARK: - Sections
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(LocalizedStringKey("welcome.title"))
                .font(.system(.largeTitle, design: .rounded).weight(.bold))
            Text("Quick playground to try SwiftUI basics.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(alignment: .topTrailing) {
            Image(systemName: "globe")
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(.tint)
                .padding(16)
        }
    }

    private var statRow: some View {
        HStack(spacing: 12) {
            StatPill(icon: "number.circle", title: NSLocalizedString("counter.title", comment: ""), value: "\(count)")
            StatPill(icon: "leaf.fill", title: NSLocalizedString("list.table", comment: ""), value: "\(fruits.count)")
            StatPill(icon: "person", title: "Age", value: "\(age)")
        }
    }

    private var counterCard: some View {
        SectionCard(titleKey: "counter.title", icon: "plusminus.circle") {
            VStack(spacing: 12) {
                Text(String(format: NSLocalizedString("counter.value", comment: "Counter value"), count))
                    .font(.system(.title, design: .rounded).weight(.semibold))
                    .foregroundStyle(.primary)

                HStack(spacing: 14) {
                    Button {
                        withAnimation { count = max(0, count - 1) }
                    } label: {
                        Label("Decrement", systemImage: "minus")
                            .labelStyle(.iconOnly)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray.opacity(0.5))

                    Button {
                        incrementLabel()
                    } label: {
                        Label(LocalizedStringKey("button.increment"), systemImage: "plus")
                            .labelStyle(.iconOnly)
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(.borderedProminent)

                    Button(LocalizedStringKey("button.reset")) {
                        resetButton()
                    }
                    .buttonStyle(.bordered)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var greetingCard: some View {
        SectionCard(titleKey: "greeting.hello", icon: "message") {
            VStack(alignment: .leading, spacing: 12) {
                TextField(LocalizedStringKey("input.name.placeholder"), text: $textFName)
                    .textFieldStyle(.roundedBorder)

                Button(LocalizedStringKey("button.showGreeting")) {
                    withAnimation(.spring(duration: 0.35)) {
                        showGreeting = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)

                if showGreeting {
                    Text(
                        String(
                            format: NSLocalizedString("greeting.hello", comment: "Greeting with name"),
                            textFName.isEmpty ? name : textFName
                        )
                    )
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
        }
    }

    private var fruitsCard: some View {
        SectionCard(titleKey: "list.table", icon: "list.bullet.rectangle") {
            VStack(spacing: 12) {
                HStack {
                    TextField("Next Row", text: $newRow)
                        .textFieldStyle(.roundedBorder)
                    Button("Add") {
                        addFruit()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newRow.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }

                VStack(spacing: 10) {
                    ForEach(fruits, id: \.self) { fruit in
                        HStack {
                            Label {
                                fruitLabel(for: fruit)
                            } icon: {
                                Image(systemName: "leaf")
                                    .foregroundStyle(.green)
                            }
                            Spacer()
                            Button {
                                removeFruit(fruit)
                            } label: {
                                Image(systemName: "trash")
                            }
                            .foregroundStyle(.red)
                            .buttonStyle(.borderless)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
            }
        }
    }

    private var navigationCard: some View {
        SectionCard(titleKey: "nav.detailView", icon: "arrow.right.circle.fill") {
            NavigationLink {
                ProjectsListView()
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(LocalizedStringKey("nav.detailView"))
                            .font(.headline)
                        Text("Browse the projects showcase and detail steps.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Actions
    private func incrementLabel() {
        if age > 30 {
            print("My Age is", age)
        }
        count += 1
        print(count)
    }

    private func resetButton() {
        count = 0
        showGreeting = false
    }

    private func addFruit() {
        let trimmed = newRow.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        fruits.append(trimmed)
        newRow.removeAll()
    }

    private func removeFruit(_ fruit: String) {
        fruits.removeAll { $0 == fruit }
    }

    @ViewBuilder
    private func fruitLabel(for fruit: String) -> some View {
        if fruit.hasPrefix("fruits.") {
            Text(LocalizedStringKey(fruit))
        } else {
            Text(fruit)
        }
    }
}

// MARK: - Reusable UI
private struct SectionCard<Content: View>: View {
    let titleKey: LocalizedStringKey
    let icon: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.tint)
                    .frame(width: 32, height: 32)
                    .background(Color(.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                Text(titleKey)
                    .font(.headline)
            }
            content
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.black.opacity(0.06), radius: 12, x: 0, y: 6)
    }
}

private struct StatPill: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.headline)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

#Preview {
    ContentView()
}
