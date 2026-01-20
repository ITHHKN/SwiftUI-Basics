import Foundation

struct Project: Identifiable, Equatable {
    let id: UUID
    let title: String
    let location: String
    let availableVillas: Int
    let imageName: String
    
    init(id: UUID = UUID(), title: String, location: String, availableVillas: Int, imageName: String) {
        self.id = id
        self.title = title
        self.location = location
        self.availableVillas = availableVillas
        self.imageName = imageName
    }
}
