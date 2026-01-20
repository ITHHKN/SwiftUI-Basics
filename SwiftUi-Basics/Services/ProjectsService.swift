import Foundation

protocol ProjectsService {
    func fetchProjects() async throws -> [Project]
}

struct MockProjectsService: ProjectsService {
    func fetchProjects() async throws -> [Project] {
        // Simulate a small delay as if from network/database
        try await Task.sleep(nanoseconds: 200_000_000)
        return [
            Project(title: "Project AL Yalies", location: "AL Yalies 5", availableVillas: 35, imageName: "house.fill"),
            Project(title: "Project AL Khawanij", location: "Al Khawanij", availableVillas: 150, imageName: "house.circle.fill"),
            Project(title: "Project Palm Heights", location: "Palm Jumeirah", availableVillas: 12, imageName: "house.lodge.fill")
        ]
    }
}
