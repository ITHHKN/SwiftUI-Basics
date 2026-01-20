import SwiftUI

struct ProjectCard: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.secondarySystemBackground))
                
                VStack(alignment: .leading, spacing: 12) {
                    // Image placeholder using SF Symbol
                    ZStack(alignment: .bottomLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.15))
                            .frame(height: 160)
                        Image(systemName: project.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    Text(project.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.secondary)
                        Text(String(format: NSLocalizedString("project.location", comment: ""), project.location))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(String(format: NSLocalizedString("project.available", comment: ""), project.availableVillas))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ProjectCard(project: Project(title: "Project AL Yalies", location: "AL Yalies 5", availableVillas: 35, imageName: "house.fill"))
}
