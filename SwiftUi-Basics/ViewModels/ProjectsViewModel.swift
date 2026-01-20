import Foundation
import Observation

@Observable
final class ProjectsViewModel {
    private let service: ProjectsService
    
    var projects: [Project] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    init(service: ProjectsService = MockProjectsService()) {
        self.service = service
    }
    
    @MainActor
    func load() async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        do {
            let items = try await service.fetchProjects()
            projects = items
        } catch {
            errorMessage = NSLocalizedString("error.projects.fetch", comment: "Generic projects fetch error")
        }
        isLoading = false
    }
}
