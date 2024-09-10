//
//  AddStokItemView.swift
//  Stok_Takip
//
//  Created by Osman Esad on 25.08.2024.
//

import SwiftUI

struct AddStokItemView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var stokKodu = ""
    @State private var stokAdi = ""
    @State private var stokTuru = ""
    @State private var stokAdedi = 0
    @State private var stokFiyati = 0.0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Stok Kodu", text: $stokKodu)
                TextField("Stok Adı", text: $stokAdi)
                TextField("Stok Türü", text: $stokTuru)
                Stepper("Stok Adedi: \(stokAdedi)", value: $stokAdedi, in: 0...1000)
                TextField("Stok Fiyatı", value: $stokFiyati, format: .currency(code: "TRY"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Yeni Stok Ekle")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Kaydet") {
                        let newItem = StokItem(stokKodu: stokKodu, stokAdi: stokAdi, stokTuru: stokTuru, stokAdedi: stokAdedi, stokFiyati: stokFiyati)
                        modelContext.insert(newItem)
                        dismiss()
                    }
                }
            }
        }
    }
}


