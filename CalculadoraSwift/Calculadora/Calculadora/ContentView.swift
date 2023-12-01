//
//  ContentView.swift
//  Calculadora
//
//  Created by  on 24/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var speedUno = 1.0
    @State private var isEditingUno = false
    @State private var speedDos = 75.0
    @State private var isEditingDos = false
    var body: some View {
        VStack {
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")*/
            Image("weight").resizable()
                .frame(width: 128, height: 128)
            HStack {
                Text("0")
                Slider(
                    value: $speedUno,
                    in: 0...2,
                    onEditingChanged: { editing in
                        isEditingUno = editing
                    }
                )
                Text("2")
            }
            
            Text("\(String(format: "%.2f", speedUno))")
                .foregroundColor(isEditingUno ? .red : .blue)
            
            HStack {
                Text("0")
                Slider(
                    value: $speedDos,
                    in: 0...150,
                    onEditingChanged: { editing in
                        isEditingDos = editing
                    }
                )
                Text("150")
            }
            
            
            Text("\(String(format: "%.2f", speedDos))")
                .foregroundColor(isEditingDos ? .red : .blue)
        }.padding()
        VStack {
            if ((speedDos / pow(speedUno, 2.0)).isNaN) {
                Text("Ningun Valor")
            } else if(!(speedDos / pow(speedUno, 2.0)).isInfinite) {
                Text("\(String(format: "%.2f", (speedDos / pow(speedUno, 2.0))))").foregroundColor(.green).bold().font(.system(size: 30))
            }
            
            if (speedDos > 0 && speedUno > 0) {
                if ((speedDos / pow(speedUno, 2.0)) < 30) {
                    Text("Bajo")
                } else if ((speedDos / pow(speedUno, 2.0)) > 30 && (speedDos / pow(speedUno, 2.0)) < 85) {
                    Text("Normal")
                } else if ((speedDos / pow(speedUno, 2.0)) > 85) {
                    Text("Mucho")
                } else if ((speedDos / pow(speedUno, 2.0)).isNaN) {
                    Text("No se a aportado ningun resultado")
                }
            }
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
