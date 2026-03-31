import Cocoa

@main
struct ContextMenuApp: App {
    var body: some Scene {
        Window("ContextMenu 右键菜单", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 400)
    }
}
