import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var stokItems: [StokItem]
    @State private var searchText = ""
    @State private var showingAddView = false
    @State private var showingScanner = false
    
    var filteredItems: [StokItem] {
        if searchText.isEmpty {
            return stokItems
        } else {
            return stokItems.filter { $0.stokAdi.localizedCaseInsensitiveContains(searchText) || $0.stokKodu.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List {
                    ForEach(filteredItems) { item in
                        NavigationLink(destination: EditStokItemView(item: item)) {
                            VStack(alignment: .leading) {
                                Text(item.stokAdi)
                                    .font(.headline)
                                Text("Kod: \(item.stokKodu) - Adet: \(item.stokAdedi)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationTitle("Stok Listesi")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddView.toggle() }) {
                        Label("Ekle", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingScanner.toggle() }) {
                        Label("Barkod Tara", systemImage: "barcode.viewfinder")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddStokItemView()
            }
            .sheet(isPresented: $showingScanner) {
                BarcodeScannerView(scannedCode: $searchText)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(filteredItems[index])
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Ara...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.horizontal)
    }
}
