import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSTouchBarDelegate {

    var window: NSWindow!
    var label: NSTextField!
    var text: String = "MacBook Touch Bar Scrolling Text! "
    var displayText: String = ""
    var timer: Timer?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create a window (optional, app can also run in the background)
        window = NSWindow(contentRect: NSMakeRect(0, 0, 400, 300),
                          styleMask: [.titled, .closable, .resizable],
                          backing: .buffered,
                          defer: false)
        window.title = "Touch Bar Scrolling Text"
        window.center()
        window.makeKeyAndOrderFront(nil)

        // Setup Touch Bar
        NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        NSTouchBarItemIdentifier(rawValue: "customTouchBarLabel")
        NSApplication.shared.touchBar = makeTouchBar()

        // Start scrolling text
        startScrollingText()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Stop the timer when the app is terminated
        timer?.invalidate()
    }

    func makeTouchBar() -> NSTouchBar {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.defaultItemIdentifiers = [.customText]
        return touchBar
    }

    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier == .customText {
            let customItem = NSCustomTouchBarItem(identifier: identifier)
            label = NSTextField(labelWithString: "MacBook Touch Bar Scrolling Text!")
            label.alignment = .center
            label.isBezeled = false
            label.isSelectable = false
            customItem.view = label
            return customItem
        }
        return nil
    }

    func startScrollingText() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            self.updateText()
        }
    }

    func updateText() {
        if !text.isEmpty {
            let firstCharacter = text.removeFirst()
            text.append(firstCharacter)
            label.stringValue = self.text
        }
    }
}

extension NSTouchBarItem.Identifier {
    static let customText = NSTouchBarItem.Identifier("com.example.touchBarScrollingText")
}
