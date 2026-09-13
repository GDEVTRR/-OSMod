import Foundation

struct TweakPreset: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let gestaltKey: String
    let value: Any
}

class PresetStore {
    static let list: [TweakPreset] = [
        TweakPreset(title: "Landscape FaceID", description: "Yatay konumda FaceID kilidi açmayı etkinleştirir.", gestaltKey: "oPe/9n5xRO4nqSWiyTH6A", value: true),
        TweakPreset(title: "Dynamic Island", description: "Ekran adası arayüzünü aktif eder.", gestaltKey: "fW9C1xG2JM3k0D8P", value: true),
        TweakPreset(title: "Action Button", description: "Eylem Düğmesi menüsünü açar.", gestaltKey: "dKqW1mG9n1vC", value: true)
    ]
}