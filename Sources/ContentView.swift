import SwiftUI

struct ContentView: View {
    @State private var selectedColor = Color.blue
    @State private var message = "右键点击色块查看菜单"
    @State private var showNotification = false

    var body: some View {
        VStack(spacing: 30) {
            Text("ContextMenu 右键菜单示例")
                .font(.title)

            Text("对着下方色块点击右键")
                .foregroundColor(.secondary)

            // 基础 ContextMenu
            RoundedRectangle(cornerRadius: 12)
                .fill(selectedColor)
                .frame(width: 150, height: 150)
                .contextMenu {
                    Button {
                        selectedColor = .red
                    } label: {
                        Label("红色", systemImage: "circle.fill")
                    }

                    Button {
                        selectedColor = .green
                    } label: {
                        Label("绿色", systemImage: "circle.fill")
                    }

                    Button {
                        selectedColor = .blue
                    } label: {
                        Label("蓝色", systemImage: "circle.fill")
                    }

                    Divider()

                    Button(role: .destructive) {
                        message = "已删除"
                    } label: {
                        Label("删除", systemImage: "trash")
                    }
                }

            Text(message)
                .foregroundColor(.secondary)

            Divider()

            // 带子菜单的 ContextMenu
            Text("更多选项的右键菜单")
                .foregroundColor(.secondary)

            VStack(spacing: 10) {
                ForEach(["选项 A", "选项 B", "选项 C"], id: \.self) { option in
                    HStack {
                        Text(option)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(6)
                    .contextMenu {
                        Button("复制") { }
                        Button("剪切") { }
                        Button("粘贴") { }
                        Divider()
                        Button("属性") { }
                    }
                }
            }
            .frame(width: 250)
        }
        .padding(40)
    }
}
