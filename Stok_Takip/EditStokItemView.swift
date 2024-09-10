//
//  EditStokItemView.swift
//  Stok_Takip
//
//  Created by Osman Esad on 25.08.2024.
//

import SwiftUI

struct EditStokItemView: View {
    @Bindable var item: StokItem
    
    var body: some View {
        Form {
            TextField("Stok Kodu", text: $item.stokKodu)
            TextField("Stok Adı", text: $item.stokAdi)
            TextField("Stok Türü", text: $item.stokTuru)
            Stepper("Stok Adedi: \(item.stokAdedi)", value: $item.stokAdedi, in: 0...1000)
            TextField("Stok Fiyatı", value: $item.stokFiyati, format: .currency(code: "TRY"))
                .keyboardType(.decimalPad)
        }
        .navigationTitle("Stok Düzenle")
        .onDisappear {
            item.stokDuzenlemeTarihi = Date()
        }
    }
}

