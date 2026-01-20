import SwiftUI

struct ProjectDetailView: View {
    let project: Project
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header card (status)
                StatusCard(project: project)
                    .padding(.horizontal)
                    .padding(.top)
                
                // Steps
                VStack(spacing: 12) {
                    StepRow(icon: "checkmark.seal", title: LocalizedStringKey("step.financial.title"), subtitle: LocalizedStringKey("step.financial.subtitle"))
                    StepRow(icon: "square.grid.2x2", title: LocalizedStringKey("step.allocate.title"), subtitle: LocalizedStringKey("step.allocate.subtitle"))
                    StepRow(icon: "bolt", title: LocalizedStringKey("step.handover.title"), subtitle: LocalizedStringKey("step.handover.subtitle"))
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .navigationTitle(LocalizedStringKey("nav.title.projectDetail"))
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}

private struct StatusCard: View {
    let project: Project
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 28))
                .foregroundColor(.blue)
                .frame(width: 44, height: 44)
                .background(Color.blue.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(LocalizedStringKey("detail.status.header"))
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                Text(project.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(LocalizedStringKey("detail.status.description"))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Button(LocalizedStringKey("detail.status.view")) {}
                .font(.subheadline.weight(.semibold))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.12))
                .foregroundColor(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.separator), lineWidth: 0.5)
                )
        )
        .shadow(color: Color.black.opacity(0.04), radius: 3, x: 0, y: 1)
    }
}

private struct StepRow: View {
    let icon: String
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.gray)
                .frame(width: 44, height: 44)
                .background(Color.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.separator), lineWidth: 0.5)
                )
        )
        .shadow(color: Color.black.opacity(0.03), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    NavigationStack {
        ProjectDetailView(project: Project(title: "Project AL Yalies", location: "AL Yalies 5", availableVillas: 35, imageName: "house.fill"))
    }
}
