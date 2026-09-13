    import SwiftUI

struct ContentView: View {
    @State private var statusMessage = "iOSMod Engine Aktif"
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("iOSMod Özelleştirmeleri")) {
                    ForEach(PresetStore.list) { preset in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(preset.title)
                                    .font(.headline)
                                Text(preset.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button("Uygula") {
                                if PlistEngine.shared.applyPreset(key: preset.gestaltKey, value: preset.value) {
                                    statusMessage = "\(preset.title) uygulandı!"
                                } else {
                                    statusMessage = "İşlem başarısız!"
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
                
                Section(header: Text("Sistem")) {
                    Button(action: { RespringManager.respring() }) {
                        HStack {
                            Image(systemName: "restart.circle")
                            Text("Respring Yap (Yeniden Başlat)")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("iOSMod 1.0")
            .toolbar {
                Text(statusMessage).font(.caption).foregroundColor(.blue)
            }
        }
    }
}