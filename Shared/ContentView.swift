import SwiftUI

struct ContentView: View {
    
    @State private var colors = [
        [0.0, 0.0, 0.0],
        [0.1, 0.1, 0.1],
        [0.2, 0.2, 0.2],
        [0.3, 0.3, 0.3],
        [0.4, 0.4, 0.4]
    ]
    
    @State private var recent = [
        [0.0, 0.0, 0.0],
        [0.1, 0.1, 0.1],
        [0.2, 0.2, 0.2],
        [0.3, 0.3, 0.3],
        [0.4, 0.4, 0.4]
    ]
    
    @State private var isDisabled = true
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > geometry.size.height {
                HStack(spacing: 0) {
                    ForEach(colors, id: \.self) { color in
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .foregroundColor(Color(red: color[0], green: color[1], blue: color[2]))
                            VStack(alignment: .leading) {
                                Button(action: {
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.writeObjects(["(\(Int(color[0]*255)), \(Int(color[1]*255)), \(Int(color[2]*255)))" as NSString])
                                }) {
                                    HStack {
                                        Image(systemName: "doc.on.doc")
                                        Text("RGB (\(Int(color[0]*255)), \(Int(color[1]*255)), \(Int(color[2]*255)))")
                                    }
                                }
                                Button(action: {
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.writeObjects(["\(String(format:"%02X", Int(Int(color[0]*255))) + String(format:"%02X", Int(Int(color[1]*255))) + String(format:"%02X", Int(Int(color[2]*255))))" as NSString])
                                }) {
                                    HStack {
                                        Image(systemName: "doc.on.doc")
                                        Text("HEX #\(String(format:"%02X", Int(Int(color[0]*255))) + String(format:"%02X", Int(Int(color[1]*255))) + String(format:"%02X", Int(Int(color[2]*255))))")
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            } else {
                VStack(spacing: 0) {
                    ForEach(colors, id: \.self) { color in
                        ZStack(alignment: .bottomLeading) {
                            Rectangle()
                                .foregroundColor(Color(red: color[0], green: color[1], blue: color[2]))
                            VStack(alignment: .leading) {
                                Button(action: {
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.writeObjects(["(\(Int(color[0]*255)), \(Int(color[1]*255)), \(Int(color[2]*255)))" as NSString])
                                }) {
                                    HStack {
                                        Image(systemName: "doc.on.doc")
                                        Text("RGB (\(Int(color[0]*255)), \(Int(color[1]*255)), \(Int(color[2]*255)))")
                                    }
                                }
                                Button(action: {
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.writeObjects(["\(String(format:"%02X", Int(Int(color[0]*255))) + String(format:"%02X", Int(Int(color[1]*255))) + String(format:"%02X", Int(Int(color[2]*255))))" as NSString])
                                }) {
                                    HStack {
                                        Image(systemName: "doc.on.doc")
                                        Text("HEX #\(String(format:"%02X", Int(Int(color[0]*255))) + String(format:"%02X", Int(Int(color[1]*255))) + String(format:"%02X", Int(Int(color[2]*255))))")
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onTapGesture {
            recent = colors
            isDisabled = false
            colors = [
                [Double.random(in: 0..<1), Double.random(in: 0..<1), Double.random(in: 0..<1)],
                [Double.random(in: 0..<1), Double.random(in: 0..<1), Double.random(in: 0..<1)],
                [Double.random(in: 0..<1), Double.random(in: 0..<1), Double.random(in: 0..<1)],
                [Double.random(in: 0..<1), Double.random(in: 0..<1), Double.random(in: 0..<1)],
                [Double.random(in: 0..<1), Double.random(in: 0..<1), Double.random(in: 0..<1)]
            ]
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                    colors = recent
                    isDisabled = true
                }) {
                    Label("Revert", systemImage: "clock.arrow.circlepath")
                }
                .disabled(isDisabled)
            }
        }
    }
}
