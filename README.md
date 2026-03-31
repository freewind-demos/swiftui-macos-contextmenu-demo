# SwiftUI macOS ContextMenu 右键菜单

## 简介

演示 SwiftUI 中 ContextMenu 的用法，创建右键上下文菜单。

## 快速开始

```bash
cd swiftui-macos-contextmenu-demo
xcodegen generate
open SwiftUIContextMenuDemo.xcodeproj
# Cmd+R 运行
```

对着色块点击右键查看菜单。

## 概念讲解

### 基础 ContextMenu

```swift
Rectangle()
    .fill(Color.blue)
    .frame(width: 100, height: 100)
    .contextMenu {
        Button("红色") { color = .red }
        Button("绿色") { color = .green }
    }
```

### 带分隔线和图标

```swift
.contextMenu {
    Button { } label: { Label("复制", systemImage: "doc.on.doc") }
    Button { } label: { Label("剪切", systemImage: "scissors") }

    Divider()

    Button(role: .destructive) { } label: {
        Label("删除", systemImage: "trash")
    }
}
```

## 完整示例

```swift
struct ContentView: View {
    @State private var favorite = false

    var body: some View {
        Image(systemName: favorite ? "star.fill" : "star")
            .contextMenu {
                Button {
                    favorite.toggle()
                } label: {
                    Label(favorite ? "取消收藏" : "收藏", systemImage: "star")
                }
            }
    }
}
```

## 完整讲解（中文）

### ContextMenu 特点

- 右键/长按触发
- 提供上下文相关操作
- 支持层级菜单
- 可用 `.destructive` 标记危险操作

### 使用场景

- 文件/文件夹操作
- 图片编辑选项
- 列表项快捷操作
- 任何需要右键菜单的场景
