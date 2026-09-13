import Foundation

class PlistEngine {
    static let shared = PlistEngine()
    private let gestaltPath = "/var/mobile/Library/Preferences/com.apple.MobileGestalt.plist"
    
    func createBackup() -> Bool {
        let fileManager = FileManager.default
        let backupPath = gestaltPath + ".iosmod_backup"
        if !fileManager.fileExists(atPath: backupPath) {
            do {
                try fileManager.copyItem(atPath: gestaltPath, toPath: backupPath)
                return true
            } catch {
                print("Backup Error: \(error)")
                return false
            }
        }
        return true
    }
    
    func applyPreset(key: String, value: Any) -> Bool {
        guard createBackup() else { return false }
        
        guard let dict = NSMutableDictionary(contentsOfFile: gestaltPath) else { return false }
        dict.setValue(value, forKey: key)
        
        return dict.write(toFile: gestaltPath, atomically: true)
    }
}