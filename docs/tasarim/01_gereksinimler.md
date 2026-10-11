# 01 — Gereksinimler: TEKNOFEST Uluslararası İHA Yarışması – Döner Kanat

Otonom Görev Yazılımı Gereksinimleri

Kaynak: TÜBİTAK İHA Yarışmaları Şartnamesi, V6 (30.06.2026). Sayfa numaraları şartnamenin alt bilgisindeki numaralardır.

Özet: G 25 · S 13 · P 14 · H 6 · K 13 — toplam 71 gereksinim.

Kategoriler: G = Görev akışı, S = Güvenlik, P = Performans, H = Hakem / yer istasyonu / kanıt / video, K = Kısıt. Öncelik: Zorunlu (yapılmazsa görev geçersiz, sıfır puan ya da eleme) / Puan (puanı artırır) / İyi olur.

## Bölüm 1 — Gereksinim tablosu

### G — Görev akışı (kronolojik: Görev 1 → Görev 2 → Görev 3 → bitiş → iniş)

| ID | Gereksinim | Şartname alıntısı | Kaynak | Doğrulama | Öncelik | Not |
|---|---|---|---|---|---|---|
| G-01 | Sistem kalkışı kalkış çizgisinden yapmalıdır. | "İHA’lar kalkış çizgisinden havalanır." | 10.2.1, s.47 | Sim / IRL | Zorunlu | Görev 1 ve 2 için ortak (Şekil 6, 7). Uçuş süresi çizgiden hareketle başlar (P-06, P-07). Otonom kalkış için bkz. P-12. |
| G-02 | Sistem kalkış yönünü, uçuş öncesinde hakemin onayladığı doğrultuya göre ayarlanabilmelidir. | "Kalkış yönünün hangi doğrultuda gerçekleştirileceğine ilişkin uçuş öncesi uçuş hakeminin onayını almak zorunludur." | 10.2.1, s.51 | Masa testi / IRL | Zorunlu | Madde Görev 2 bölümünün sonunda geçiyor. Görev 1'e uygulanıp uygulanmadığı belirsiz (Bölüm 2). |
| G-03 | Sistem Birinci Görevi yüksüz uçmalıdır. | "Takımlar birinci görevi yüksüz uçar. Birinci görev puanlaması, yüksüz İHA ağırlığı üzerinden yapılır." | 8.3.2, s.27; 10.2.1, s.46 | İnceleme | Zorunlu | Yüklü ve yüksüz olmak üzere iki görev profili gerekir. G-10 ile ilişkili. |
| G-04 | Sistem direkler arası mesafeyi sahada belirlenen değere göre kullanabilmelidir. (Planlanan: 150 m) | "Sabit ve Döner Kanat kategorilerinde, iki direk arası mesafenin 150 metre olması planlanmaktadır. Ancak bu mesafe, yarışma alanının fiziksel koşullarına göre değişiklik gösterebilir." | 7, s.22; 8.3.1, s.26 | Masa testi / Sim | Zorunlu | Değişebilir. Kesin değer saha belirlendikten sonra duyurulacak. |
| G-05 | Sistem kalkıştan sonra doğrudan direk 2’ye ilerlemelidir. | "Kalkışın ardından İHA doğrudan direk 2’ye ilerler ve 2. direği dışarıdan alarak iki direk arasında sonsuz (∞) şeklinde uçuş manevrası gerçekleştirir." | 10.2.1, s.47 | Sim / IRL | Zorunlu | Görev 1. |
| G-06 | Sistem ∞ manevrasına 2. direği dışarıdan alarak başlamalıdır. | "…2. direği dışarıdan alarak iki direk arasında sonsuz (∞) şeklinde uçuş manevrası gerçekleştirir." | 10.2.1, s.47 | Sim / IRL | Zorunlu | Direği içeriden alma cezası için bkz. K-09. |
| G-07 | Sistem ∞ manevrasını iki direk arasında art arda iki tur olarak tamamlamalıdır. | "Bu manevra art arda iki tur olacak şekilde uygulanır." | 5.2, s.17; 8.3.7, s.30; 10.2.1, s.47 | Sim / IRL | Zorunlu | Manevra yapılamazsa Görev 1 sıfır puan alır ve Görev 2 hakkı doğmaz (8.3.7, s.30; 10.2, s.45). Videoda da şarttır. |
| G-08 | Sistem her iki turda 1 ve 2 numaralı direkleri manevranın içinde bırakmalıdır. | "Döner kanat İHA’ların, yüksüz şekilde her iki (2) turda uçuş alanındaki dönüş noktalarına yerleştirilen 1 ve 2 numaralı referans direklerini içeride bırakacak şekilde ∞ (yatay 8, sonsuz) hareketi yapması gerekir." | 10.2.1, s.46 | Sim / IRL | Zorunlu | K-09 ile ilişkili. |
| G-09 | Sistem iki tur bittikten sonra direk 2’nin arka tarafından geçerek direğin dışından dönüş yapmalıdır. | "İki turun tamamlanmasının ardından takımlar, görselde belirtildiği üzere direk 2’nin arka tarafından geçerek direğin dışından dönüş yapar ve parkuru tamamlamak üzere pist başlangıç/bitiş çizgisinden geçerek görevlerini sonlandırırlar." | 10.2.1, s.47 (Şekil 6) | Sim / IRL | Zorunlu | "Arka taraf" yalnızca Şekil 6'da tanımlı (Bölüm 2). Bu adımdan sonra G-24 gelir. |
| G-10 | Sistem İkinci Görevde iki adet yük taşımalıdır. | "İHA’lar, ikinci görev kapsamında iki (2) adet yük taşımakla yükümlüdür ve bu görevde iki (2) farklı yük denemesi yapabilir." | 3.2, s.11; 8.3.2, s.26; 10.2.1, s.48 | İnceleme / Masa testi | Zorunlu | Görev 2'ye geçebilmek için Görev 1'in başarılı olması gerekir (10.2, s.45). |
| G-11 | Sistem hedef tespitine ancak 2. direği dışarıdan aldıktan sonra başlamalıdır. | "Tüm takımlar, ikinci görevdeki hedef tespiti aşamasında uçuşlarını gerçekleştirirken hedef tespitini 2. direği dışarıdan aldıktan sonra yapmak zorundadır." | 10.2.1, s.50 | Sim / IRL | Zorunlu | Görev 2 güzergâhı metinde tarif edilmemiş, yalnızca Şekil 7'de var (Bölüm 2). |
| G-12 | Sistem duyurulacak tarama alanı sınırları içinde görüntü işleme taraması yapabilmelidir. (Planlanan: yaklaşık 30 × 100 m) | "Tarama yapılacak alanın ölçülerinin yaklaşık 30 x 100 metre olması planlanmaktadır." "Yarışma alanının konumu ilan edildikten sonra takımların görüntü işleme için tarama yapması gereken alanın sınırları ayrıca duyurulacaktır." | 7, s.22; 8.3.3, s.28 | Masa testi / Sim | Zorunlu | Değişebilir. |
| G-13 | Sistem her İkinci Görev uçuşunda hedef konumlarını o uçuş sırasında yeniden belirlemelidir. | "…alanda bulunan hedefler, her ikinci görev uçuşu öncesinde rastgele konumlandırılır. Hedef, uçuş alanı içerisindeki uygun bölgelere yerleştirilecek olup dönüş alanlarına yakın konumlandırılmaz." | 8.3.3, s.28 | Sim / IRL | Zorunlu | Önceki uçuştan kalan konum bilgisi kullanılamaz. |
| G-14 | Sistem konumu önceden bilinmeyen iki hedefin konumunu görüntü işleme ile belirlemelidir. | "Bu görevde, takımların geliştirdikleri döner kanat İHA’nın dikdörtgen ya da kare prizması şeklindeki muhafaza kutusundan çıkarılıp uçuşa hazır hale getirilmesi, uçuş kontrol yazılımı ile otonom uçuş yapması ve uçuş alanında konumları bilinmeyen iki (2) farklı hedefin konumlarını görüntü işleme tekniğiyle algılayarak her hedefe bir (1) yük olacak şekilde iki (2) farklı yük bırakması istenir." | 3.2, s.10–11; 10.2.1, s.48 | Sim / IRL | Zorunlu | Şartnamede konum doğruluğu için bir değer yok (Bölüm 2, öneri). |
| G-15 | Sistem her kenarı 2 m olan mavi düzgün altıgen hedefi tespit etmelidir. | "Her kenarı 2 metre olan mavi renkli düzgün altıgen hedefe dışı kırmızıya boyanmış yük, her kenarı 1 metre olan kırmızı renkli eşkenar üçgen şeklindeki hedefe dışı maviye boyanmış yük bırakılır." | 3.2, s.11; 10.2.1, s.48 | Sim / IRL | Zorunlu | Sabit kanat hedefleriyle ayırt edilmeli (K-05, K-06). |
| G-16 | Sistem her kenarı 1 m olan kırmızı eşkenar üçgen hedefi tespit etmelidir. | "…her kenarı 1 metre olan kırmızı renkli eşkenar üçgen şeklindeki hedefe dışı maviye boyanmış yük bırakılır." | 3.2, s.11; 10.2.1, s.48 | Sim / IRL | Zorunlu | K-05, K-06 ile ilişkili. |
| G-17 | Sistem her yük bırakma kararını ilgili hedefin görüntü işleme ile tespit edilmesine dayandırmalıdır. | "Görüntü işleme yapılmadan hedefe isabet sağlansa dahi takımlar hedef isabet puanı alamaz." | 10.2.1, s.49 | İnceleme / IRL | Puan | Aksi hâlde isabet puanı (8 + 12) alınamaz. Tespit H-01 ile kanıtlanır. |
| G-18 | Sistem dışı kırmızı yükü mavi altıgen hedefe bırakmalıdır. | "Her kenarı 2 metre olan mavi renkli düzgün altıgen hedefe dışı kırmızıya boyanmış yük, …" | 3.2, s.11; 10.2.1, s.48 | Masa testi / IRL | Zorunlu | P-09, P-10. |
| G-19 | Sistem dışı mavi yükü kırmızı üçgen hedefe bırakmalıdır. | "…kırmızı renkli eşkenar üçgen şeklindeki hedefe dışı maviye boyanmış yük bırakılır." | 3.2, s.11; 10.2.1, s.48 | Masa testi / IRL | Zorunlu | P-09, P-11. |
| G-20 | Sistem yük bırakma sırasını hangi hedefin önce tespit edildiğine göre belirleyebilmelidir. | "Sahada hedef yerleşimleri belirli bir sıraya göre yapılmadığından, takımlar hedeflere yük bırakma işlemini sıraya bağlı olmaksızın gerçekleştirir; hangi hedefi önce tespit ederlerse o hedefe uygun renkteki yükü bırakırlar." | 3.2, s.11; 10.2.1, s.48 | Sim | Zorunlu | Her iki sıra da test edilmeli. |
| G-21 | Sistem iki yükü bıraktıktan sonra ilk bırakılan yükün bulunduğu hedefe gidebilmelidir. | "Uluslararası İHA Yarışması Döner Kanat kategorisinde ikinci görevi yapan takımlar, iki yükü attıktan sonra ilk attıkları yükün bulunduğu hedefe giderek yerdeki yükü alıp diğer hedefe bırakmaları halinde bonus puan alacakları üçüncü görevi başarıyla tamamlamış sayılırlar." | 3.2, s.11; 10.2.1, s.48, s.52 | Sim / IRL | Puan | Görev 3 isteğe bağlıdır ("Üçüncü görevi yapmak zorunlu değildir.", s.11). s.48'deki parametre cümlesi sırayı altıgen→üçgen olarak veriyor (Bölüm 2). |
| G-22 | Sistem hedefin üstündeki yükü alabilmelidir. | "Takımlar, ilk attıkları yükün bulunduğu hedefe giderek hedefin üstündeki yükü almaları halinde on (10) puan, …" | 10.2.1, s.52; 11.1.3, s.61 | Sim / IRL | Puan | Formüldeki AY terimi (0/1). K-03, K-07, K-08 ile ilişkili. |
| G-23 | Sistem aldığı yükü diğer hedefe bırakabilmelidir. | "…hedefin üstündeki yükü alıp diğer hedefe bırakmaları halinde ise on (10) puan alarak üçüncü görevi başarıyla tamamlamış olurlar." | 10.2.1, s.52; 11.1.3, s.61 | Sim / IRL | Puan | Formüldeki BY terimi (0/1). "İsabetli" sayılma ölçütü tanımsız (Bölüm 2). |
| G-24 | Sistem görevi başlangıç/bitiş çizgisini geçerek sonlandırmalıdır. | "Uçuş süresi İHA’nın başlangıç/bitiş çizgisinden hareketiyle beraber başlayacak olup İHA görevini icra ettikten sonra başlangıç/bitiş çizgisini geçince süre durdurulur." | 8.3.5, s.29; 10.2.1, s.47, s.49–50 | Sim / IRL | Zorunlu | Görev 1'de G-09'dan, Görev 2'de G-20 veya G-23'ten sonra gelir. Süre bu noktada durur. |
| G-25 | Sistem bitiş çizgisinden sonra sahada seçilen iniş noktasına iniş yapmalıdır. | "Bitiş çizgisi geçildikten sonra iniş yapılacak konumun seçilmesi takımın inisiyatifindedir. Takımlar, 1. direk ile 2. direk arasındaki uygun bir alana inişlerini gerçekleştirebilirler." | 10.2.1, s.47, s.50 | Sim / IRL | Zorunlu | Şekil 6 inişi pist yakınında gösteriyor (Bölüm 2). Otonom iniş için P-13, kırımsız iniş için S-10. |

### S — Güvenlik

| ID | Gereksinim | Şartname alıntısı | Kaynak | Doğrulama | Öncelik | Not |
|---|---|---|---|---|---|---|
| S-01 | Sistem bir arıza emniyet (fail-safe) moduna sahip olmalıdır. | "Tanımı ve teknik özellikleri açıkça belirtilmiş “Radyo Arıza Emniyet Sistemi (Fail-safe)” modu zorunludur." "Radyo arıza emniyet sistemi (fail-safe) kontrolünü geçemeyen İHA’lar uçuş yapamaz." | Tanımlar, s.6; 9.1, s.31 | İnceleme / Masa testi | Zorunlu | Teknik kontrolde yerde, verici kapatılarak test edilir (s.32). |
| S-02 | Sistem RC sinyal kaybında en fazla 5 saniye içinde otomatik olarak fail-safe moduna geçmelidir. | "İHA’nın radyo kontrol ünitesinde yaşanan bir sinyal kaybında otomatik olarak (en fazla beş (5) saniye içinde) arıza emniyeti sistemi (fail-safe) moduna geçebilir özellikte olması zorunludur." | 9.2, s.32; 9.3.2, s.33 | Masa testi / Sim | Zorunlu | — |
| S-03 | Sistem fail-safe modunda kontrollü iniş yapmalıdır. | "Yarım gaz - kontrollü iniş (eve dönüş modu (RTL) seçilemez)," | 9.2, s.32 | Masa testi / Sim | Zorunlu | "Yarım gaz" ifadesinin nasıl yorumlanacağı belirsiz (Bölüm 2). |
| S-04 | Sistem fail-safe modunda eve dönüş (RTL) davranışını seçmemelidir. | "Yarım gaz - kontrollü iniş (eve dönüş modu (RTL) seçilemez)," | 9.2, s.32 | Masa testi | Zorunlu | Yasaklı davranış. |
| S-05 | Sistem hakemin komutu üzerine motor gazını kesebilmelidir. | "Gazın kesilmesi (hakemin komut vermesi durumunda)." | 9.2, s.32 | Masa testi | Zorunlu | Komutun hangi kanaldan verileceği belirsiz (Bölüm 2). |
| S-06 | Sistem uçuş sırasında hakem talebiyle fail-safe moduna geçirilip güvenli iniş yapabilmelidir. | "İHA’nın uçuşu esnasında hakemler güvenlik açısından bir tehlike hissederse uçuşun durdurulmasını isteyebilir. Bu durumda aracın Fail-safe moduna geçirilerek güvenli iniş yapması istenir." | 8.1, s.23 | Sim / IRL | Zorunlu | S-03 ile aynı iniş davranışı. |
| S-07 | Sistem hakem iniş emri verdiğinde gecikmeden inişe geçirilebilmelidir. | "Görev uçuşu nedeniyle havalandığında sınır dışına çıkan ve hakem tarafından tehlikeli görülüp iniş emir verildiği halde pilot veya görevli üye tarafından gerekli müdahalenin zamanında yapılmaması," | 9.4, s.34; 14.3, s.78 | Sim / IRL | Zorunlu | "Zamanında" için sayısal değer yok. |
| S-08 | Sistem tanımlı uçuş paterninden aşırı derecede sapmamalıdır. | "Uçuş hakemleri, uçuş paterninden aşırı derecede sapıp yarışma alanında kontrolsüz şekilde seyreden, yarışma alanı ve çevresinin güvenliğini tehlikeye atan uçuşları durdurma ve uçuşun iptaline karar verme yetkisine sahiptir." | 8.3.7, s.30 | Sim / IRL | Zorunlu | "Aşırı" tanımsız (Bölüm 2). |
| S-09 | Sistem uçuşu kararlı şekilde gerçekleştirmelidir. | "Sabit Kanat ve Döner Kanat kategorilerinde, İHA'nın uçuşunun başarılı sayılabilmesi için, videoda hava aracının ∞ (sonsuz çizme/sekiz çizme/figure-eight) manevrasını başarılı bir şekilde tamamlaması, kararlı bir şekilde uçması ve kırımsız bir şekilde iniş yapması gerekmektedir." | 3.2, s.10; 5.2, s.17 | IRL | Zorunlu | Kararlılık ölçütü tanımsız (Bölüm 2). |
| S-10 | Sistem inişi İHA’nın donanımsal bütünlüğünü koruyacak şekilde yapmalıdır. | "İniş sonrasında İHA’nın donanımsal bütünlüğünün korunuyor olması gerekir. İstisnai olarak inişlerde pervane kırılmasına müsaade edilir ve uçuş başarılı sayılır." | 5.2, s.17; 8.3.5, s.29; 8.3.7, s.30 | IRL | Zorunlu | Çizgi geçişinden sonra kırım olursa uçuş başarısız sayılır (s.29). |
| S-11 | Sistem motorların arm/disarm işleminin kumanda üzerindeki stick hareketleriyle yapılmasına imkân vermelidir. | "Motorların arm/disarm işlemlerinin kumanda üzerindeki stick hareketleriyle gerçekleştirilmesi gerekir." | 9.1, s.31; 9.2, s.32 | Masa testi | Zorunlu | Otonom kalkıştaki arm yöntemiyle ilişkisi belirsiz (Bölüm 2). |
| S-12 | Sistem yarışma alanındaki yayın gürültüsü ve kirliliğinden kaynaklanabilecek sorunlara karşı önlem içermelidir. | "Yarışma alanında uçuş gerçekleştirilirken doğabilecek problemler ile yarışma alanında oluşan yayın gürültüsünden veya kirliliğinden doğabilecek problemler takımların sorumluluğunda olduğundan gerekli önlemlerin takım tarafından alınması." | 9.2, s.32 | Analiz / IRL | Zorunlu | Uçuş emniyeti kontrol maddesi. Ölçüt tanımsız. |
| S-13 | Sistem son önemli değişiklikten sonra, yarışma alanına gelinmeden önce uçuş testiyle doğrulanmış olmalıdır. | "Yarışmalar haftasından önce uçuş denemeleri yapamamış olan araçların ilk defa yarışma esnasında denenmesi," "Daha önce deneme testleri yapılmış ancak araç üzerinde önemli değişiklikler yapılmış ise ön testlerin yapılmadan alana gelinmesi," | 14.3, s.77 | IRL | Zorunlu | Yazılım değişikliğinin "önemli değişiklik" sayılıp sayılmadığı belirsiz. K-11 ile ilişkili. |

### P — Performans (süre, doğruluk, isabet, otonomi)

| ID | Gereksinim | Şartname alıntısı | Kaynak | Doğrulama | Öncelik | Not |
|---|---|---|---|---|---|---|
| P-01 | Sistem kurulumu (montaj, yük yerleştirme, güç bağlantısı) en fazla 8 dakikada tamamlanabilmelidir. | "İHA’nın kurulum süresi için üst limit sekiz (8) dakikadır. Bu süre içinde kurulum yapamayan takımlar uçuş hakkını kaybeder." | 8.3.5, s.29; 10.2.1, s.46, s.49 | Masa testi | Zorunlu | Süre hakemin "başla" demesiyle başlar, pilotun "hazırız" demesiyle biter. |
| P-02 | Sistem GPS bağlantısı ve arm dahil uçuşa hazırlık işlemlerinin en fazla 8 dakikada tamamlanmasına imkân vermelidir. | "Uçuşa hazırlık süresi için üst limit sekiz (8) dakikadır. GPS bağlantısı, arm olması vb. unsurlar kurulum süresine dahil olmayıp uçuşa hazırlık süresi kapsamında değerlendirilir." | 8.3.5, s.29; 10.2.1, s.46, s.49 | Masa testi | Zorunlu | Süre aşılırsa ne olacağı yazılmamış (Bölüm 2). Soğuk açılış (K-13) bu süreye dahil. |
| P-03 | Sistem uçuşa hazırlık süresinin en aza indirilmesine imkân vermelidir. | "İHA muhafaza kutusunun hacmi, İHA’nın muhafazadan kutusundan çıkarılıp uçuşa hazır hale getirilme süresi, otonom uçuş, İHA’nın yüksüz ağırlığı ve turu tamamlama süresi birinci görev puanını etkileyen parametrelerdir." | 10.2.1, s.46, s.48; 11.1.2, s.60 | Masa testi | Puan | Görev 1'de 6·t_min,haz/t_tk,haz, Görev 2'de 4·t_min,haz/t_tk,haz. |
| P-04 | Sistem uçuşa hazırlık sırasında güç verme/kesme dışında İHA’ya ek müdahale gerektirmemelidir. | "Uçuşa hazırlık sırasında İHA’ya güç verme/kesme dışında yapılan “her ek müdahalenin süresi + 10 saniyeden” oluşan süre, toplam kurulum süresine eklenir." | 8.3.5, s.29; 10.2.1, s.47, s.49 | Masa testi | Puan | Her müdahale P-03'teki puanı düşürür. "Müdahale"nin kapsamı belirsiz (Bölüm 2). |
| P-05 | Sistem uçuş için gereken tüm unsurların kurulum ve uçuşa hazırlık süresi içinde tamamlanmasına imkân vermelidir. | "Kurulum ve uçuşa hazırlık sürecinin ardından takımlar uçuş için ek hazırlıklar yapamaz. İHA’nın uçuşu için gereken tüm unsurlar kurulum ve uçuşa hazırlık süresi içinde tamamlanmalıdır." | 8.3.5, s.29; 10.2.1, s.47, s.49 | Masa testi | Zorunlu | — |
| P-06 | Sistem Birinci Görevi en fazla 5 dakikalık uçuş süresiyle tamamlamalıdır. | "Birinci görev için uçuş süresi en fazla beş (5) dakika olarak belirlenmiştir. Belirlenen süre sınırlarını aşan takımların ilgili görev uçuşları başarısız sayılır." | 8.3.5, s.29; 10.2.1, s.47 | Sim / IRL | Zorunlu | Süre, çizgiden hareketle başlar ve görev sonrası çizgi geçişinde durur (G-01, G-24). |
| P-07 | Sistem İkinci Görevi en fazla 10 dakikalık uçuş süresiyle tamamlamalıdır. | "İkinci görev için uçuş süresi en fazla on (10) dakika olarak belirlenmiştir. Belirlenen süre sınırlarını aşan takımların ilgili görev uçuşları başarısız sayılır." | 8.3.5, s.29; 10.2.1, s.49 | Sim / IRL | Zorunlu | Görev 3'ün bu süreye dahil olup olmadığı belirsiz (Bölüm 2). |
| P-08 | Sistem görev uçuş süresini en aza indirmelidir. | "…hedefin merkezine olabildiğince yakın isabetli atış yapması, altıgen hedefe bıraktığı yükü yerden almak suretiyle üçgen hedefe bırakması ve turu tamamlama süresi ikinci görev puanını etkileyen parametrelerdir." | 10.2.1, s.46, s.48; 11.1.2, s.60 | Sim / IRL | Puan | Görev 1'de 12·t_min/t_tk, Görev 2'de 8·t_min/t_tk. t_min yalnızca başarılı takımlar arasından alınır. |
| P-09 | Sistem her yükü hedef merkezine en fazla 10 m uzaklıkta duracak şekilde bırakmalıdır. | "Yükün hedefe olan uzaklığında yükün düştüğü yer değil, en son durduğu yer baz alınarak ölçüm yapılır." "Sabit kanat İHA'lar için hedefin merkezinden itibaren 20 metreye kadar ve döner kanat İHA'lar içinse hedefin merkezinden itibaren 10 metreye kadar hedef ölçümü yapılır." | 8.3.3, s.27; 10.2.1, s.48 | IRL | Puan | 10 m dışında kalan yük için bu kriterden sıfır puan alınır. Yuvarlanma da hesaba girer. |
| P-10 | Sistem altıgen hedefe bıraktığı yükün hedef merkezine uzaklığını en aza indirmelidir. | "daltg,tk: Takımın bıraktığı yükün altıgen hedefin merkezine olan uzaklığı (Döner kanat)" | 11.1.2, s.60; 11.1.3, s.61 | IRL | Puan | 8·d_min/d_tk. |
| P-11 | Sistem üçgen hedefe bıraktığı yükün hedef merkezine uzaklığını en aza indirmelidir. | "düçg,tk: Takımın bıraktığı yükün üçgen hedefin merkezine olan uzaklığı (Döner kanat)" | 11.1.2, s.60; 11.1.3, s.61 | IRL | Puan | 12·d_min/d_tk. En yüksek ağırlıklı isabet kalemi budur. |
| P-12 | Sistem kalkışı otonom gerçekleştirmelidir. | "Uluslararası ve Liseler Arası İHA Yarışmalarında otonom kalkış, otonom uçuş, otonom iniş durumunda 1 şeklinde değerlendirilir." | 8.3.6, s.30; 11.1.3, s.60 | Sim / IRL | Puan | Manuel kalkışta c = 0,7 olur ve görev puanının tamamı 0,7 ile çarpılır. |
| P-13 | Sistem inişi otonom gerçekleştirmelidir. | "Uluslararası ve Liseler Arası İHA Yarışmalarında otonom kalkış, otonom uçuş, otonom iniş durumunda 1 şeklinde değerlendirilir." | 8.3.6, s.30; 11.1.3, s.60 | Sim / IRL | Puan | Manuel inişte c = 0,7. |
| P-14 | Sistem kalkış ile iniş arasındaki görev uçuşunu otonom gerçekleştirmelidir. | "Uluslararası ve Liseler Arası İHA Yarışmalarında manuel kalkış ve/veya manuel iniş, otonom uçuş durumunda 0,7;" | Tanımlar, s.7; 8.3.6, s.30; 11.1.3, s.60 | Sim / IRL | Zorunlu | Uluslararası'da otonom olmayan uçuş için c değeri tanımlanmamış (Bölüm 2). |

### H — Hakem / yer istasyonu / kanıt / video

| ID | Gereksinim | Şartname alıntısı | Kaynak | Doğrulama | Öncelik | Not |
|---|---|---|---|---|---|---|
| H-01 | Sistem tespit edilen hedefin etiketlenmiş görüntüsünü yer istasyonunda hakemlere anlık olarak göstermelidir. | "Sabit Kanat ve Döner Kanat kategorilerinde görüntü algılama sürecinde, hedefin etiketlenmiş görüntüsünün yer istasyonunda hakemlere anlık olarak kanıtlanması tamamen takımın sorumluluğundadır." "Takımlar, görüntü işleme yöntemiyle hedefi tespit ettiklerini, yer kontrol istasyonu aracılığıyla uçuş hakemlerine kanıtlamakla yükümlüdür." | 8.1, s.23; 10.2.1, s.48 | Masa testi / IRL | Zorunlu | Uçuş logları talep edilmez (s.49), yani kanıt yalnızca canlı gösterimle sunulur. G-17 ile ilişkili. |
| H-02 | Sistem uçtan uca şifrelemeye sahip telemetri kullanmalıdır. | "Sabit Kanat ve Döner Kanat Kategorilerinde uçtan uca şifrelemeye sahip telemetri kullanımı zorunludur." | 9.4, s.34 | İnceleme / Masa testi | Zorunlu | — |
| H-03 | Sistemin telemetri ve görüntü aktarma işlevleri yarışma alanına gelinmeden önce test edilmiş olmalıdır. | "Telemetri ve görüntü aktarma sistemlerinin ön testleri mutlaka yarışma alanına gelmeden önce yapılmalıdır." | 9.4, s.34 | IRL | Zorunlu | — |
| H-04 | Sistemin yer istasyonu arayüzünden doğrudan ekran kaydı alınabilmelidir. | "Yer istasyonunu gösteren görüntüler ise harici bir kamerayla değil, doğrudan yer istasyonu ekranından alınan bir ekran kaydı (screen recording) şeklinde olmalıdır." | 5.2, s.17–18 (Şekil 1) | İnceleme | Zorunlu | Şartlara uymayan video değerlendirilmez. Şekil 1'deki panel adı "Otonomi - Yer İstasyonu". |
| H-05 | Sistem video için yarışma alanındaki görevin aynısını kalkış ve iniş dahil kesintisiz gerçekleştirebilmelidir. | "Kalkış ve iniş görüntüleri de tam olmak üzere yarışma alanında yapılacak görevin aynısının (Serbest Görev kategorisinde gerçeğe benzer uygulama yapılması zorunlu görevler hariç) hiç kesinti olmadan gerçekleştirilmesi beklenir." "Uçuş Görevi ve Gerçekleştirme bölümünde videoda kesme ve kırpma yapılamaz." | 5.2, s.16 | IRL | Zorunlu | Bu bölümü tamamlayamayan takım elenir. |
| H-06 | Sistem videodaki uçuş görevi bölümünü en fazla 5 dakikada tamamlamalıdır. | "Takım pilotu veya takımdaki sorumlu öğrencinin (Danışman ve danışman öğretmen hariç) seslendirmesiyle Serbest Görev kategorisinde on (10) dakikayı, Döner Kanat ve Sabit Kanat kategorilerinde beş (5) dakikayı geçmeyecek şekilde görev gerçekleştirme kısmına ait görüntülere yer verilir." | 5.2, s.16 | IRL | Zorunlu | Görev 2'nin 10 dakikalık sınırıyla çelişiyor (Bölüm 2). |

### K — Kısıtlar ve yasaklar

| ID | Gereksinim | Şartname alıntısı | Kaynak | Doğrulama | Öncelik | Not |
|---|---|---|---|---|---|---|
| K-01 | Sistem yer seviyesinden 120 m'nin üzerine çıkmamalıdır. | "Yarışmalarda uçuş yüksekliği en fazla 120 metredir." "Üst irtifa limiti için Sivil Havacılık Genel Müdürlüğü tarafından belirlenen AGL 120 metre limiti baz alınır." | Tanımlar, s.8; 8.1, s.23; 8.3.1, s.26; 14.2, s.77 | Sim / Masa testi | Zorunlu | Test uçuşlarında da geçerli. |
| K-02 | Sistem yatayda, yarışma öncesinde bildirilecek koordinatlarla sınırlanan uçuş bölgesinin dışına çıkmamalıdır. | "Uçuş Bölgesi: Düşeyde yer seviyesinden 120 metre, yatayda ise yarışmalar öncesinde bildirilecek koordinatlarla sınırlandırılan, tüm uçuş görevlerinin gerçekleşeceği alanı," "Yarışma alanında tampon bölge bulunmayacaktır." | Tanımlar, s.8; 7, s.22 | Sim / Masa testi | Zorunlu | Değişebilir; koordinatlar sonradan verilecek. |
| K-03 | Sistem uçuş sırasında yere temas etmemelidir. | "İHA’lar için yere temas etmemek kaydıyla alt irtifa limiti konulmamıştır." | 8.3.1, s.26 | Sim / IRL | Zorunlu | Görev 3'teki yük alma ve s.48'deki "karadan" görüntü işleme izniyle çelişebilir (Bölüm 2). |
| K-04 | Sistem alanı görüntülemek için yardımcı bilgisayara entegre tek bir kamera dışında kamera kullanmamalıdır. | "Takımlar, görüntü işleme için kullanacakları yardımcı bilgisayara entegre edilmiş tek bir kamera kullanabilirler. Bunun dışında, alanı görüntülemek amacıyla ikinci bir kamera kullanılmasına kesinlikle izin verilmez." | 10.2.1, s.49 | İnceleme | Zorunlu | — |
| K-05 | Sistem sabit kanat kategorisinin 4 × 4 m mavi kare hedefini algılamamalıdır. | "Döner kanat İHA’ların görüntü işleme yaparken sabit kanat İHA’lar için uçuş alanına konumlandırılmış 4 x 4 metrelik ve 2 x 2 metrelik hedefleri algılamaması gerekir." | 3.1, s.10; 8.3.3, s.27; 10.2.1, s.49 | Sim / IRL | Zorunlu | Aynı uçuş alanı kullanılıyor (Şekil 7). Renk bilgisi s.10'da. |
| K-06 | Sistem sabit kanat kategorisinin 2 × 2 m kırmızı kare hedefini algılamamalıdır. | "Döner kanat İHA’ların görüntü işleme yaparken sabit kanat İHA’lar için uçuş alanına konumlandırılmış 4 x 4 metrelik ve 2 x 2 metrelik hedefleri algılamaması gerekir." | 3.1, s.10; 8.3.3, s.27; 10.2.1, s.49 | Sim / IRL | Zorunlu | "Algılamama"nın nasıl ölçüleceği belirsiz (Bölüm 2). |
| K-07 | Sistem yükü tanımak için yük üzerine eklenmiş işaret, şerit veya karekod gibi unsurlara dayanmamalıdır. | "Yükler yalnızca Görevler bölümünde belirtilen renkle boyanır ve yüklere işaret, şerit, karekod gibi herhangi bir unsur eklenemez." | 8.3.2, s.27 | İnceleme | Zorunlu | Görev 3'te yerdeki yükün tespitini doğrudan etkiler (G-22). |
| K-08 | Sistem yük üzerinde bulunan herhangi bir elektronik bileşene dayanmamalıdır. | "Yük üzerine aktif kontrol işlevi gören veya görmeyen hiçbir elektronik bileşen eklenemez." | 8.3.2, s.27 | İnceleme | Zorunlu | G-22 ile ilişkili. |
| K-09 | Sistem 1. ve 2. direği içeriden almamalıdır. | "Direğin dışından dönmeyen (direği içeriden alan) takımlar, görevi gerçekleştirmeleri durumunda -10 puan ceza puanı kaybeder. Direğin dışından ikinci kez dönmeyen (direği ikinci kez içeriden alan) takımların uçuşu ise başarısız sayılır." | 8.3.7, s.30; 11.1.3, s.61 | Sim / IRL | Zorunlu | İlk ihlal −10 puan (Ceza Puanı 2), ikinci ihlalde uçuş başarısız. |
| K-10 | Sistem diğer İHA'ların uçuş kontrolünü, haberleşmesini veya GNSS alımını etkileyecek elektromanyetik yayın, karıştırma veya sahte GNSS sinyali üretmemelidir. | "Yarışma sırasında, yarışan İHA’nın uçuş kontrolünü, haberleşmesini, GNSS alımını, sensörlerini veya görev performansını olumsuz etkileyecek nitelikte herhangi bir elektromanyetik yayın, sinyal karışması (jamming), GPS bozucu (spoofing) girişimi ya da frekans müdahalesi yapan takım, durum tespit edildiği anda yarışmadan elenir." | 9.3.2, s.33 | Analiz / İnceleme | Zorunlu | Eleme sebebi. |
| K-11 | Sistem yazılımı yarışma sürecinde DDK veya uçuş hakemi onayı olmadan değiştirilmemelidir. | "Şartnameye uymayan hava aracıyla yarışmaya katılan, yetkisiz alanlarda motor çalıştıran veya uçuş denemesi yapan, yarışma sürecinde DDK ve/veya uçuş hakemi onayı olmaksızın donanım ya da yazılım değişikliği gerçekleştiren, diğer takımların uçuşunu veya sistemlerini doğrudan ya da dolaylı olarak sabote eden, ayrıca takım bilgileri, lisans, izin veya resmi belgelerde gerçeğe aykırı veya yanıltıcı beyanda bulunduğu tespit edilen takımlar yarışmadan elenir." | 11, s.59 | İnceleme | Zorunlu | Eleme sebebi. Parametre ayarının bu kapsama girip girmediği belirsiz (Bölüm 2). |
| K-12 | Sistem hazırlık dönemindeki test uçuşlarında pilottan yatayda 500 m'den fazla uzaklaşmamalıdır. | "İHA, yatayda 500 metreyi geçmeyecek şekilde pilotun görüş alanında olmalıdır." | 14.2, s.77 | Masa testi | Zorunlu | Yalnızca test uçuşları için geçerli. |
| K-13 | Sistem kurulum başlangıcında tamamen güçsüz durumdan (soğuk başlatma) çalışmaya başlayabilmelidir. | "Muhafaza kutusu içindeki İHA’da herhangi bir güç sistemi önceden faal durumda olmamalıdır." | 8.3.5, s.29; 10.2.1, s.46 | Masa testi | Zorunlu | Açılış süresi P-02'ye girer. |

## Bölüm 2 — Belirsizlikler ve sorular

| # | Konu | İlgili ID | Neden belirsiz | Hakemlere / organizasyona soru |
|---|---|---|---|---|
| 1 | Görev 3'te hangi hedeften yük alınacağı | G-21–G-23 | s.11 ve s.52 "ilk attıkları yükün bulunduğu hedef" diyor. s.48'deki parametre cümlesi ise "altıgen hedefe bıraktığı yükü … üçgen hedefe" diyor. | Görev 3 her iki sırada da geçerli mi, yoksa yalnızca altıgenden üçgene mi puanlanır? |
| 2 | Görev 3'te renk uyumu ve "isabetli" tanımı | G-23 | Altıgendeki yük kırmızıdır ve kırmızı üçgene taşınır. Bu, 8.3.2'deki renk–hedef eşleşmesine ters düşüyor. BY (0/1) için ölçüt verilmemiş. | BY = 1 için yük hedef sınırı içinde mi durmalı, yoksa 10 m içinde olması yeterli mi? Renk uyuşmazlığı sorun yaratır mı? |
| 3 | Görev 3 puanının nereye dahil olduğu | G-22, G-23 | s.52 "bonus puan" diyor. Ancak Tablo 3'teki formülde 10·(AY+BY) terimi Görev 2'nin 80 puanı içinde yer alıyor ve c ile çarpılıyor. | Görev 3 puanı 80'in içinde mi, yoksa ek puan mı? c katsayısı uygulanır mı? |
| 4 | Görev 3 ve süre ölçümü | P-07, G-24 | 10 dakikalık sınırın Görev 3'ü kapsayıp kapsamadığı yazmıyor. | Görev 3 bitiş çizgisinden önce ve 10 dakika içinde mi tamamlanmalı? |
| 5 | Yere temas | K-03, G-22 | 8.3.1 yere temas etmemeyi şart koşuyor. Oysa Görev 3 yerden yük almayı gerektiriyor, s.48 de "karadan" görüntü işlemeye izin veriyor. | Yük alırken ya da görüntü işleme için yere inmek veya iniş takımının yere değmesi serbest mi? |
| 6 | Görev 2 güzergâhı | G-11, G-12 | Metinde rota tarif edilmemiş. Yalnızca Şekil 7 ve "2. direği dışarıdan aldıktan sonra" kuralı var. ∞ manevrası ya da direk 1 için bir şart da yazmıyor. | Görev 2'de ∞ manevrası veya belirli bir direk sırası zorunlu mu? Şekil 7 bağlayıcı mı? |
| 7 | Görev 1 iniş yeri | G-25 | Metin 1. ve 2. direk arasını gösteriyor, Şekil 6 ise inişi pist yakınında çiziyor. | İniş alanı tam olarak neresi? Kalkış noktasına iniş kabul edilir mi? |
| 8 | "Direk 2’nin arka tarafı" | G-09 | Yön yalnızca şekilde tanımlı. | Referans yön nedir (örneğin pistten bakış)? |
| 9 | Kalkış yönü onayı | G-02 | Madde yalnızca Görev 2 bölümünün sonunda yer alıyor. | Görev 1 için de geçerli mi? |
| 10 | Otonomi katsayısı (c) | P-14 | Uluslararası için yalnızca 0,7 ve 1 değerleri tanımlı. Manuel uçuş durumu tanımlanmamış. s.29'da geçen "yarı otonom" terimi de tanımsız. | Görev sırasında kısa bir manuel müdahale olursa c kaç olur? Uçuş geçersiz mi sayılır? |
| 11 | Fail-safe'teki "yarım gaz" | S-03 | Döner kanatta sabit yarım gaz kontrollü bir iniş sağlamaz. Otomatik bir iniş modunun kabul edilip edilmediği yazmıyor. | Konum tutarak yerinde otomatik iniş "yarım gaz - kontrollü iniş" olarak kabul edilir mi? |
| 12 | Gaz kesme komutunun kanalı | S-05 | Hakem komutunun RC anahtarıyla mı telemetriyle mi uygulanacağı belirtilmemiş. | Gaz kesme teknik kontrolde hangi kanal üzerinden gösterilmeli? |
| 13 | Otonom kalkışta arm yöntemi | S-11, P-12 | Stick ile arm zorunlu tutuluyor. Görev bilgisayarı veya yer istasyonu üzerinden yazılımsal arm'ın kabul edilip edilmediği yazmıyor. | Pilot stick ile arm edip ardından otonom moda mı geçmeli? Yazılımsal arm ile c = 1 alınabilir mi? |
| 14 | Hazırlık süresi aşımı ve t_haz tanımı | P-02, P-03 | Kurulum süresinin aşılması hak kaybı demek, ancak hazırlık süresinin aşılmasının yaptırımı yazılmamış. t_haz "uçuşa hazırlık için İHA kurulum süresi" olarak tanımlanmış; hangi sürenin ölçüldüğü net değil. | Puanlamada kurulum süresi mi, hazırlık süresi mi, yoksa ikisinin toplamı mı kullanılıyor? 8 dakikalık hazırlık süresi aşılırsa ne olur? |
| 15 | "Ek müdahale"nin kapsamı | P-04 | Yer istasyonunda yapılan işlemlerin müdahale sayılıp sayılmadığı belirsiz. | Yer istasyonundan görev yüklemek veya mod değiştirmek müdahale sayılır mı? |
| 16 | Video süresi | H-06, P-07 | Video uçuş bölümü en fazla 5 dakika olabilir, ama "görevin aynısı" isteniyor. Görev 2'nin sınırı ise 10 dakika. | Videoda hangi görev gösterilmeli: yalnızca Görev 1 mi, kısaltılmış bir Görev 2 mi? |
| 17 | Etiketli görüntünün içeriği | H-01 | "Anlık" için gecikme toleransı ve görüntüde hangi bilgilerin bulunacağı tanımsız. | Kabul edilen gecikme nedir? Sınıf, güven skoru veya konum bilgisi gösterilmeli mi? |
| 18 | Yanlış algılamanın ölçümü | K-05, K-06 | Sabit kanat hedefine yer istasyonunda kısa süreli bir etiket düşmesinin mi, yoksa o hedefe yük bırakılmasının mı ihlal sayılacağı yazmıyor. | "Algılamama" nasıl ölçülüyor? |
| 19 | Değişken saha parametreleri | G-04, G-12, K-02 | 150 m, 30 × 100 m ve uçuş bölgesi koordinatları sonradan duyurulacak. Tampon bölge de olmayacak. | Kesin değerler ve koordinatların formatı ne zaman, hangi biçimde verilecek? |
| 20 | Sapma ve kararlılık ölçütü | S-08, S-09 | Sayısal bir ölçüt yok. | Hakemler hangi ölçütü kullanıyor? |
| 21 | Yazılım değişikliğinin kapsamı | K-11, S-13 | Parametre veya eşik ayarlarının "yazılım değişikliği" sayılıp sayılmadığı yazmıyor. | Uçuşlar arasında yapılan parametre ayarı için onay gerekir mi? |
| 22 | Şartname sürümü | Tümü | Bu çıkarım V6 (30.06.2026) sürümüne dayanıyor. "Yarışmalarda en son ilan edilen güncel Şartname geçerlidir." (14.1, s.76) | Yeni dönem şartnamesi yayımlandığında hangi maddeler değişti? Tablonun bu sürüme göre güncellenmesi gerekir. |

### Öneriler (şartnamede yazmayan mühendislik çıkarımları; bu yüzden tabloya alınmadı)

- Konum doğruluğu: P-09'daki 10 m eşiği ve P-10/P-11'deki göreli puanlama nedeniyle, takım içinde bir doğruluk hedefi belirlenmeli. Bu hedef, kameradan zemine konum hatası ile bırakma dağılımının toplamını kapsamalı.
- Şekil ayrımı: Sabit kanat hedefleri de mavi ve kırmızı renkte (s.10). Bu yüzden yalnızca renge bakmak yetmez, şekil ayrımı da gerekir. K-05 ve K-06 için kare hedefleri içeren bir test seti hazırlanmalı.
- Bırakma koşulları: Ölçüm yükün son durduğu yerden yapılıyor ve parçalanan yük ölçülmüyor (8.3.2–8.3.3). Bırakma irtifası ve hızı yuvarlanma ve kırılma açısından test edilmeli.
- Görev 3 yük tasarımı: Yüke işaret veya elektronik eklenemediği için (K-07, K-08) yerdeki yük yalnızca rengi ve şekliyle bulunabilir. Yükün boyu ve biçimi yazılım ekibiyle birlikte seçilmeli.
- Rüzgâr: Yarışma 25 km/h üzerindeki rüzgârda durdurulabiliyor (8.1, s.23). Sistem bu değerin altındaki rüzgârda görevi yapabilecek şekilde test edilmeli.
- Kayıt tutma: Uçuş logları istenmiyor (s.49), ama hata analizi için sistem yine de kayıt tutmalı.
- Bağlantı kaybı: Şartname yalnızca RC kaybındaki fail-safe'i tanımlıyor. Telemetri veya görev bilgisayarı bağlantısı koptuğunda ne olacağı takım tarafından tanımlanmalı (S-12 ile ilişkili).
- Açılış süresi: Soğuk başlatmadan "görev hazır" durumuna kadar geçen süre ölçülüp bütçelenmeli (K-13, P-02). Yer istasyonu tek bir üyeyle hazırlanabilecek şekilde tasarlanmalı, çünkü 8.3.5 buna bir ek üye ayırıyor.
- Geofence marjı: Tampon bölge olmadığı için (s.22), irtifa ve yatay sınırlarda içeride bir güvenlik payı bırakılmalı.

## Bölüm 3 — Kapsam kontrolü

| Bölüm | Başlık | Çıkan ID'ler |
|---|---|---|
| — | Versiyonlar, İçindekiler, Tablolar, Şekiller | yok – dizin ve sürüm bilgisi (sürüm notu Bölüm 2 #22'de) |
| — | Tanımlar | S-01, P-14, K-01, K-02 |
| 1 | Amaç ve Kapsam | yok – genel tanıtım |
| 2 | Yarışma Takvimi | yok – idari |
| 3 / 3.1 | Kategoriler / Sabit Kanat | K-05, K-06 (yalnızca hedef renkleri) |
| 3.2 | Döner Kanat Kategorisi | G-10, G-14, G-15, G-16, G-18, G-19, G-20, G-21 |
| 3.3 | Serbest Görev | yok – kapsam dışı kategori |
| 4 | Başvuru Koşulları | yok – idari |
| 5 / 5.1 | Proje Süreci / Proje Sunum Raporu | yok – rapor ve idari süreç |
| 5.2 | Hazırlık ve Görev Videosu | H-04, H-05, H-06, G-07, S-09, S-10 |
| 6 / 6.1 / 6.2 | Destekler | yok – mali |
| 7 | Yarışma Alanı | G-04, G-12, K-02 |
| 8.1 | Tüm Kategoriler İçin Genel Süreç | S-06, H-01, K-01 |
| 8.2 | Serbest Görev Hususları | yok – kapsam dışı kategori |
| 8.3.1 | Genel Hususlar | G-04, K-01, K-03 |
| 8.3.2 | Yükle İlgili Hususlar | G-03, G-10, K-07, K-08 |
| 8.3.3 | Hedefe Uzaklık Ölçümü | P-09, K-05, K-06, G-12, G-13 |
| 8.3.4 | Muhafaza Kutusu | yok – mekanik |
| 8.3.5 | Süre Ölçümü ve Kısıtı | P-01, P-02, P-04, P-05, P-06, P-07, G-24, S-10, K-13 |
| 8.3.6 | Otonom Uçuş | P-12, P-13, P-14 |
| 8.3.7 | Puanlama ve Geçersiz Uçuş | G-07, S-08, S-10, K-09 |
| 9.1 | Teknik Kontrol | S-01, S-11 |
| 9.2 | Uçuş Emniyeti Kontrolü | S-02, S-03, S-04, S-05, S-11, S-12 |
| 9.3 | İHA’nın Özellikleri | yok – araç tipi ve kategori uyumu (donanım) |
| 9.3.1 | Ağırlık | yok – donanım |
| 9.3.2 | Radyo Kontrol | S-02, K-10 |
| 9.3.3 | Tasarım | yok – özgünlük şartı (donanım/idari) |
| 9.3.4 | Acil Durum Güç Kesme | yok – donanım anahtarı |
| 9.4 | Uçuş Sırasında Kurallar | H-02, H-03, S-07 |
| 10 / 10.1 / 10.1.1 / 10.1.2 | Görevler / Sabit Kanat | yok – kapsam dışı kategori |
| 10.2 | Döner Kanat Kategorisi | G-07 ve G-10 notları (Görev 1 → Görev 2 geçiş şartı) |
| 10.2.1 | Birinci Görev | G-01, G-03, G-05, G-06, G-07, G-08, G-09, G-24, G-25, P-01–P-06, K-13 |
| 10.2.1 | İkinci Görev | G-02, G-10–G-20, G-24, G-25, P-07–P-11, H-01, K-04, K-05, K-06 |
| 10.2.1 | Üçüncü Görev | G-21, G-22, G-23 |
| 10.2.2 | Liseler Arası Döner Kanat | yok – kapsam dışı |
| 10.3 | Serbest Görev | yok – kapsam dışı |
| 11 (giriş) | Puanlama | K-11 |
| 11.1 / 11.1.1 | Genel Puanlama Tablosu | Puan dağılımı P-03, P-08, P-10, P-11 notlarında |
| 11.1.2 | Görev Puanlama Tablosu | P-03, P-08, P-10, P-11, G-22, G-23 |
| 11.1.3 | Puanlama Parametreleri | P-12, P-13, P-14, G-22, G-23, K-09 |
| 11.2.x | Liseler Arası Puanlama | yok – kapsam dışı |
| 11.3.x | Serbest Görev Puanlama | yok – kapsam dışı kategori |
| 12 / 12.1 / 12.2 | Ödüller | yok – idari |
| 13 | Destek Kullanımı | yok – mali |
| 14 / 14.1 | İdari Hükümler | yok – idari (güncelleme notu Bölüm 2 #22'de) |
| 14.2 | Test Uçuşları | K-01, K-12 |
| 14.3 | Güvenlik Tedbirleri | S-07, S-13 |
| 15 / 16 | Mevzuat / İletişim | yok – referans bilgisi |

## Bölüm 4 — Kapsam dışı bırakılanlar

- 2, 4, 5.1, 6, 12, 13, 14.1: Takvim, başvuru, rapor, destek, ödül ve idari hükümler. Yazılımı etkilemiyor.
- 5.2 (Hazırlık/Bilgilendirme bölümü, HD, mp4, müzik yasağı, Türkçe dil): Video prodüksiyonuyla ilgili. Yazılım tarafı H-04, H-05 ve H-06'da alındı.
- 8.1 (kayıt, SHGM kaydı, danışmanların alana alınmaması, THK pilotu): İdari ve operasyonel.
- 8.1 / 8.3.7 (centilmenlik), 11 (takım bilinci): Davranış kuralları.
- 8.3.1, 9.3.1 (4 kg sınırı): Donanım. Yazılımın ağırlığa etkisi dolaylı (görev bilgisayarı seçimi).
- 8.3.1 (iki görev için dört uçuş hakkı, alana en fazla dört üye), 8.3.5 (kurulumda en fazla üç üye): Operasyonel. Yer istasyonu notu Bölüm 2 önerilerinde.
- 8.3.2 (yük ağırlığının beyanı, yüklerin aynı özellikte olması, boyama, paraşüt rengi, parçalanmama, itki sisteminin değiştirilmemesi): Donanım. Bırakma koşulları Bölüm 2 önerilerinde.
- 8.3.4 (muhafaza kutusu, ceza puanı 1): Mekanik.
- 9.1 (pervaneler sökülü getirilir, yedek piller), 9.2 (yapısal bütünlük, tel ve konektörler, RC menzili): Donanım ve teknik kontrol prosedürü.
- 9.2, 9.3.2 (RC sisteminin uçtan uca şifrelenmesi): RC donanımı. Telemetri şifrelemesi ayrıca H-02'de alındı.
- 9.3, 9.3.3 (kategori–araç tipi uyumu, tasarım özgünlüğü): Donanım ve idari.
- 9.3.4 (2 saniyede güç kesen anahtar, onaysız güç verme): Donanım ve operasyon.
- 9.4 (baret zorunluluğu, çoklu pilot): Operasyonel veya diğer kategori.
- 11.1.2 (W_yük: 20 puan, W₀ ve Vol terimleri): Yük kapasitesi, ağırlık ve hacim. Mekanik ve donanım konusu.
- 14.2 (insan ve yapılardan 50 m, gün doğumu–gün batımı arası, 2 km görüş, pilot yetkisi): Mevzuata bağlı operasyon kuralları. Yalnızca 500 m ve 120 m sınırları (K-01, K-12) yazılımla uygulanabilir.
- 14.3 (kapalı alanda pervaneli çalıştırma, düşmüş araca müdahale, kırım sonrası teknik kontrol): Saha operasyon prosedürü.
- 3.1, 3.3, 8.2, 10.1, 10.2.2, 10.3, 11.2, 11.3: Sabit Kanat, Liseler Arası ve Serbest Görev kategorilerine özgü maddeler.
Özet: G 25 · S 13 · P 14 · H 6 · K 13 — toplam 71 gereksinim.
