import Foundation
import SwiftData

@Model
class StokItem {
    var stokKodu: String
    var stokAdi: String
    var stokTuru: String
    var stokAdedi: Int
    var stokFiyati: Double
    var stokKayitTarihi: Date
    var stokDuzenlemeTarihi: Date
    
    init(stokKodu: String, stokAdi: String, stokTuru: String, stokAdedi: Int, stokFiyati: Double) {
        self.stokKodu = stokKodu
        self.stokAdi = stokAdi
        self.stokTuru = stokTuru
        self.stokAdedi = stokAdedi
        self.stokFiyati = stokFiyati
        self.stokKayitTarihi = Date()
        self.stokDuzenlemeTarihi = Date()
    }
}
